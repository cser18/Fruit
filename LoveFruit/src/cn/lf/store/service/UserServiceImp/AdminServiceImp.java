package cn.lf.store.service.UserServiceImp;

import cn.lf.store.dao.AdminDao;
import cn.lf.store.dao.daoImp.AdminDaoImp;
import cn.lf.store.domain.Root;
import cn.lf.store.service.AdminService;

import java.sql.SQLException;

public class AdminServiceImp implements AdminService {
    @Override
    public Root adminLogin(String adminName, String adminPassWord) throws SQLException {
        AdminDao adminDao = new AdminDaoImp();
        Root root = adminDao.adminLogin(adminName, adminPassWord);
        return root;
    }
}
