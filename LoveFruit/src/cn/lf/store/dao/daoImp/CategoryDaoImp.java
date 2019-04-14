package cn.lf.store.dao.daoImp;

import cn.lf.store.dao.CategoryDao;
import cn.lf.store.domain.Category;
import cn.lf.store.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class CategoryDaoImp implements CategoryDao {
    @Override
    public List<Category> findCateAll() throws SQLException {
        String sql = "select * from category";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        List<Category> list = queryRunner.query(sql,new BeanListHandler<Category>(Category.class));
        return list;
    }
}
