package cn.lf.store.dao.daoImp;

import cn.lf.store.dao.OrderDao;
import cn.lf.store.domain.OrderItem;
import cn.lf.store.domain.Orders;
import cn.lf.store.domain.Product;
import cn.lf.store.domain.User;
import cn.lf.store.utils.JDBCUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class OrderDaoImp  implements OrderDao {
    @Override
    public void saveOrder(Connection connection, Orders orders) throws SQLException {
        String sql = "insert into orders values(?, ?, ?, ?, ?, ?, ?, ?)";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        Object[] parms = {orders.getOid(),orders.getOrdertime(),orders.getTotal(),orders.getState(),orders.getUser().getAddrs(),orders.getUser().getUsername(),orders.getUser().getTelephone(),orders.getUser().getUid()};
        queryRunner.update(connection,sql,parms);

    }

    @Override
    public void saveOrderItem(Connection connection, OrderItem orderItem) throws SQLException {
        String sql = "insert into orderitem values(?, ?, ?, ?, ?)";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        Object[] parms = {orderItem.getItemid(),orderItem.getQuantity(),orderItem.getTotal(),orderItem.getProduct().getPid(),orderItem.getOrders().getOid()};
        queryRunner.update(connection,sql,parms);
    }

    @Override
    public int gettotalOrderRecords(User user) throws SQLException {
        String sql = "select count(*) from orders where uid=?";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        Long totalOrders = (Long) queryRunner.query(sql, new ScalarHandler(),user.getUid());
        return totalOrders.intValue();
    }

    /**
     * 多表查询
     * mapListHandler
     * @param user
     * @param startIndex
     * @param pageSize
     * @return
     * @throws SQLException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    @Override
    public List findMyOrdersWithPage(User user, int startIndex, int pageSize) throws SQLException, InvocationTargetException, IllegalAccessException {
        /*
         * sql = select * from orders where uid=? limit ?, ?;
         */
        String sql = "select * from orders where uid=? limit ?, ?";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        Object[] parms = {user.getUid(),startIndex,pageSize};
        List<Orders> list = queryRunner.query(sql, new BeanListHandler<Orders>(Orders.class),parms);
        for (Orders orders : list) {
            String oid = orders.getOid();
            sql = "select * from orderItem o, product p where o.pid=p.pid and oid=?";
            List<Map<String, Object>> maps = queryRunner.query(sql,new MapListHandler(),oid);
            for (Map<String, Object> map : maps) {
                OrderItem orderItem = new OrderItem();
                Product product = new Product();
                // 由于BeanUtils将字符串"1992-3-3"向user对象的setBithday();方法传递参数有问题,手动向BeanUtils注册一个时间类型转换器
                // 1_创建时间类型的转换器
                DateConverter dt = new DateConverter();
                // 2_设置转换的格式
                dt.setPattern("yyyy-MM-dd");
                // 3_注册转换器
                ConvertUtils.register(dt, java.util.Date.class);
                BeanUtils.populate(orderItem,map);
                BeanUtils.populate(product,map);

                orderItem.setProduct(product);
                orders.getList().add(orderItem);
            }

        }
        return list;
    }

}
