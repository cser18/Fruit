package cn.lf.store.dao;

import cn.lf.store.domain.User;

import java.sql.SQLException;

public interface UserDao {
    void userRegist(User user) throws SQLException;

    User userActive(String code) throws SQLException;

    int  userUpdate(User user) throws SQLException;

    User userLogin(User user) throws SQLException;

    User userDetaiMsg(User user) throws SQLException;
}
