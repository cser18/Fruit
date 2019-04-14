package cn.lf.store.dao;

import cn.lf.store.domain.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryDao {

    List<Category> findCateAll() throws SQLException;
}
