package cn.lf.store.service.UserServiceImp;

import cn.lf.store.dao.CategoryDao;
import cn.lf.store.dao.daoImp.CategoryDaoImp;
import cn.lf.store.domain.Category;
import cn.lf.store.service.CategoryService;

import java.sql.SQLException;
import java.util.List;

public class CategoryServiceImp implements CategoryService {
    @Override
    public List<Category> findCateAll() throws SQLException {
        CategoryDao categoryDao = new CategoryDaoImp();
        List<Category> list = categoryDao.findCateAll();
        return list;
    }
}
