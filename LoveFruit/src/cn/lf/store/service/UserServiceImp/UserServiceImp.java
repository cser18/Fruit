package cn.lf.store.service.UserServiceImp;

import cn.lf.store.dao.UserDao;
import cn.lf.store.dao.daoImp.UserDaoImp;
import cn.lf.store.domain.User;
import cn.lf.store.service.UserService;

import java.sql.SQLException;

public class UserServiceImp implements UserService {

    @Override
    public void userRegist(User user) throws SQLException {
//        实现注册功能
        UserDao userDao = new UserDaoImp();
//        让dao层去实现注册功能
        userDao.userRegist(user);
    }
//  账户的激活
    @Override
    public boolean userActive(String code) throws SQLException {
        UserDao userDao = new UserDaoImp();
        User user = userDao.userActive(code);
        if(user!=null){
            // 修改用户的状态
            user.setState(1);
            user.setCode(null);
            // 更新到数据库里面
            userDao.userUpdate(user);
            return true;
        }
        // 激活失败
        return false;
    }

    /**
     * 用户登录
     * @param user
     * @return
     */
    @Override
    public User userLogin(User user) throws SQLException {
        /*
         * 可以采用异常
         */
        UserDao userDao = new UserDaoImp();
        // select * from user where username=user and password=password
        User us = userDao.userLogin(user);

        if(us == null){
            throw new RuntimeException("密码有误");
        }
        else if(us.getState() == 0){
            throw new RuntimeException("用户未激活");
        }
        return us;
    }

    @Override
    public User userDetailMsg(User user) throws SQLException {
        UserDao userDao = new UserDaoImp();
        User user1 = userDao.userDetaiMsg(user);
        return user1;
    }
}
