package cn.lf.store.service;

import cn.lf.store.domain.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryService {
    List<Category> findCateAll() throws SQLException;
}
