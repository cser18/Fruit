package cn.lf.store.dao;

import cn.lf.store.domain.OrderItem;
import cn.lf.store.domain.Orders;
import cn.lf.store.domain.User;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface OrderDao {
    void saveOrder(Connection connection, Orders orders) throws SQLException;

    void saveOrderItem(Connection connection, OrderItem orderItem) throws SQLException;

    int gettotalOrderRecords(User user) throws SQLException;

    List findMyOrdersWithPage(User user, int startIndex, int pageSize) throws SQLException, InvocationTargetException, IllegalAccessException;
}
