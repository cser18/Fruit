package cn.lf.store.service.UserServiceImp;

import cn.lf.store.dao.ProductDao;
import cn.lf.store.dao.daoImp.ProductDaoImp;
import cn.lf.store.domain.Product;
import cn.lf.store.domain.pageModel;
import cn.lf.store.service.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImp implements ProductService {
    /**
     * 寻找最热商品
     * @return list
     */
    @Override
    public List<Product> findHots() throws SQLException {
        ProductDao productDao = new ProductDaoImp();
        return productDao.findHost();
    }

    @Override
    public Product detailById(String pid) throws SQLException {
        ProductDao productDao = new ProductDaoImp();

        return productDao.detailById(pid);
    }

    /**
     * 1. 查找分类的所有商品总数
     * 2. 创建pageModel对象
     * 3. 返回对象实例
     * @param cid
     * @param curNum
     * @return
     * @throws SQLException
     */
    @Override
    public pageModel findProductByCidWithPage(String cid, int curNum) throws SQLException {

        //1. 创建对象
        ProductDao productDao = new ProductDaoImp();
        //1.1 查找总数
        int totalRecords = productDao.getTotalRecords(cid);
        pageModel pageModel = new pageModel(curNum, totalRecords, 5);
        //2 查找所有商品
        //select * from product where cid=? limit ?,?;
        List<Product> products = productDao.findProductByCidWithPage(cid,pageModel.getStartIndex(),pageModel.getPageSize());
        pageModel.setList(products);
        pageModel.setUrl(" ");  //这里等下写
        return pageModel;
    }


}
