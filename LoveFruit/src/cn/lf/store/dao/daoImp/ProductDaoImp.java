package cn.lf.store.dao.daoImp;

import cn.lf.store.dao.ProductDao;
import cn.lf.store.domain.Product;
import cn.lf.store.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javax.sql.rowset.JdbcRowSet;
import java.sql.SQLException;
import java.util.List;

public class ProductDaoImp implements ProductDao {
    /**
     * dao层寻找最热的商品
     * @return list
     */
    @Override
    public List<Product> findHost() throws SQLException {
        String sql = "select * from product where pflag=0 and is_hot=1 order by pdate desc limit 0, 4 ";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        return queryRunner.query(sql,new BeanListHandler<Product>(Product.class));
    }

    /**
     * 在dao层查询pid
     * @param pid
     * @return
     */
    @Override
    public Product detailById(String pid) throws SQLException {
        String sql = "select * from Product where pid=?";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        return queryRunner.query(sql,new BeanHandler<Product>(Product.class),pid);
    }

    /**
     * 查找分类下所有商品的数量
     * @return
     * @throws SQLException
     */
    @Override
    public int getTotalRecords(String cid) throws SQLException {
        String sql = "select count(*) from product  where cid=?";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        Long totalRecords = (Long)queryRunner.query(sql, new ScalarHandler(),cid);
        return totalRecords.intValue();
    }

    /**
     * 查询分类下的分页信息
     * @param cid
     * @param startIndex
     * @param pageSize
     * @return
     */
    @Override
    public List<Product> findProductByCidWithPage(String cid, int startIndex, int pageSize) throws SQLException {
        String sql = "select * from product where cid=? limit ?,?";
        Object[] parms = {cid, startIndex, pageSize};
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());

        return queryRunner.query(sql, new BeanListHandler<Product>(Product.class),parms);
    }
}
