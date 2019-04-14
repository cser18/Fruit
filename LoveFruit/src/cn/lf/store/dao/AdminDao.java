package cn.lf.store.dao;

import cn.lf.store.domain.Root;

import java.sql.SQLException;

public interface AdminDao {
    Root adminLogin(String adminName, String adminPassWord) throws SQLException;
}
