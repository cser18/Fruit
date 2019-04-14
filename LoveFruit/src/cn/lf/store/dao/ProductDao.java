package cn.lf.store.dao;

import cn.lf.store.domain.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    List<Product> findHost() throws SQLException;

    Product detailById(String pid) throws SQLException;

    int getTotalRecords(String cid) throws SQLException;

    List<Product> findProductByCidWithPage(String cid, int startIndex, int pageSize) throws SQLException;
}
