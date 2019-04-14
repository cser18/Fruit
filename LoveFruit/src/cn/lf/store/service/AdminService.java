package cn.lf.store.service;

import cn.lf.store.domain.Root;

import java.sql.SQLException;

public interface AdminService {
    Root adminLogin(String adminName, String adminPassWord) throws SQLException;
}
