package cn.lf.store.service;

import cn.lf.store.domain.User;

import java.sql.SQLException;

public interface UserService {
    // 用户的注册
    void userRegist(User user) throws SQLException;
    // 用户的激活功能
    boolean userActive(String code) throws SQLException;

    User userLogin(User user) throws SQLException;

    User userDetailMsg(User user) throws SQLException;
}
