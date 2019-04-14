package cn.lf.store.service.UserServiceImp;

import cn.lf.store.dao.OrderDao;
import cn.lf.store.dao.daoImp.OrderDaoImp;
import cn.lf.store.domain.OrderItem;
import cn.lf.store.domain.Orders;
import cn.lf.store.domain.User;
import cn.lf.store.domain.pageModel;
import cn.lf.store.service.OrderService;
import cn.lf.store.utils.JDBCUtils;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class OrderServiceImp implements OrderService {
    @Override
    public void saveOrder(Orders orders) throws SQLException {
        //向Dao层传输据
        //用事物必须同时成功或者同时失败
        Connection connection  = null;
        try {
            connection = JDBCUtils.getConnection();
            //开启事物
            connection.setAutoCommit(false);
            //保存订单
            OrderDao orderDao = new OrderDaoImp();
            orderDao.saveOrder(connection,orders);
            //保存订单项
            for (OrderItem orderItem: orders.getList()) {
                orderDao.saveOrderItem(connection,orderItem);
            }
            // 提交
            connection.commit();
        }
        catch (Exception e){
            connection.rollback();
        }
    }

    /**
     * 三件事
     * 1. 创建page
     * 2. 关联集合
     * 3. 关联url
     * @param user
     * @param currIndex
     * @return
     * @throws SQLException
     */
    @Override
    public pageModel findMyOrdersWithPage(User user, int currIndex) throws SQLException, InvocationTargetException, IllegalAccessException {
        /*
         * sql select count(*) from orders where uid=?
         */
        OrderDao orderDao = new OrderDaoImp();
        int totalOrderRecords = orderDao.gettotalOrderRecords(user);
        pageModel pageModel = new pageModel(currIndex,totalOrderRecords,3);
        List list = orderDao.findMyOrdersWithPage(user,pageModel.getStartIndex(),pageModel.getPageSize());
        pageModel.setList(list);
        pageModel.setUrl("");
        return pageModel;
    }
}
