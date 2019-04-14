package cn.lf.store.service;

import cn.lf.store.domain.Orders;
import cn.lf.store.domain.User;
import cn.lf.store.domain.pageModel;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLDataException;
import java.sql.SQLException;

public interface OrderService {
    void saveOrder(Orders orders) throws SQLException;

    pageModel findMyOrdersWithPage(User user, int currIndex) throws SQLException, InvocationTargetException, IllegalAccessException;
}
