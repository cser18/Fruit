package cn.lf.store.service;

import cn.lf.store.domain.Product;
import cn.lf.store.domain.pageModel;

import java.sql.SQLException;
import java.util.List;

// 业务层的商品层
public interface ProductService {

    List<Product> findHots() throws SQLException;

    Product detailById(String pid) throws SQLException;

    pageModel findProductByCidWithPage(String cid, int curNum) throws SQLException;
}
