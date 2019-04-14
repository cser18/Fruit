package cn.lf.store.dao.daoImp;

import cn.lf.store.dao.AdminDao;
import cn.lf.store.domain.Root;
import cn.lf.store.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class AdminDaoImp implements AdminDao {

    @Override
    public Root adminLogin(String adminName, String adminPassWord) throws SQLException {
        String sql = "select * from Root where adminName=? and adminPassWord=?";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        Root root = queryRunner.query(sql, new BeanHandler<Root>(Root.class),adminName,adminPassWord);
        return root;
    }
}
