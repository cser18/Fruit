package cn.lf.store.dao.daoImp;

import cn.lf.store.dao.UserDao;
import cn.lf.store.domain.User;
import cn.lf.store.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

//对于UserDao的实现
public class UserDaoImp implements UserDao {

    @Override
//    对用户的注册主要实现在这里
//    通过Servlet将User传入进来
    public void userRegist(User user) throws SQLException {
        String sql = "insert into user(uid, username, password,email, code) values(?,?,?,?,?)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Object[] parms = {user.getUid(),user.getUsername(),user.getPassword(),user.getEmail(),user.getCode()};
        qr.update(sql,parms);
    }
    /*
     * 用户的激活功能在这里实现
     */
    @Override
    public User userActive(String code) throws SQLException {
        String sql = "select * from user where code=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        User user = qr.query(sql,new BeanHandler<User>(User.class),code);
        return user;
    }
    /*
     * 用户的数据更新
     */
    @Override
    public int userUpdate(User user) throws SQLException {
        String sql = "update user set username=?, password=?, email=?, telephone=?, sex=?, state=?,code=? where uid=?";
        Object[] parms = {user.getUsername(),user.getPassword(),user.getEmail(),user.getTelephone(),user.getSex(),user.getState(),user.getCode(),user.getUid()};
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        int flag = qr.update(sql,parms);
        return flag;
    }

    /**
     * 用户登录 会sql语句就行了
     * @param user
     * @return
     */
    @Override
    public User userLogin(User user) throws SQLException {
        String sql = "select * from user where username=? and password=?";
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        Object[] parms = {user.getUsername(),user.getPassword()};
        User us = queryRunner.query(sql,new BeanHandler<User>(User.class),parms);
        return us;
    }

    /**
     * 一些数据的更新
     * @param user
     * update 成功为1 失败为0
     */
    @Override
    public User userDetaiMsg(User user) throws SQLException {
        String sql = "update user set addrs=?,postcodes=?,telephone=? where uid=?";
        Object[] parms = {user.getAddrs(),user.getPostcode(),user.getTelephone(),user.getUid()};
        QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
        queryRunner.update(sql,parms);
        sql = "select * from user where uid=?";
        User user1 = queryRunner.query(sql,new BeanHandler<User>(User.class),user.getUid());
        return user1;
    }

}
