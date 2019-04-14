package cn.lf.store.web.Servlet;

import cn.lf.store.domain.User;
import cn.lf.store.service.UserService;
import cn.lf.store.service.UserServiceImp.UserServiceImp;
import cn.lf.store.utils.MyBeanUtils;
import cn.lf.store.utils.MyMailUtil;
import cn.lf.store.utils.UUIDUtils;
import cn.lf.store.web.base.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

public class UserServlet extends BaseServlet {
    public String registUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return "/user_reg.jsp";
    }

    public String loginUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return "/Login.jsp";
    }

    public String userUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/LoveFurist/user_center_info.jsp");
        return null;
        //return "/user_center_info.jsp";
    }
//    实现userRegist方法   用户注册

    /**
     * 用户注册
     *
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String userRegist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        1）接受表单数据
        Map<String, String[]> map = request.getParameterMap();
        User user = new User();
        MyBeanUtils.populate(user, map);
//        为其他属性赋值
        user.setUid(UUIDUtils.getId());
        user.setCode(UUIDUtils.getCode());
        user.setState(0);   //状态
//        System.out.println(user);
//        遍历map数据
//        Set<String> keySet = map.keySet();
//        Iterator<String> iterator = keySet.iterator();
//        while (iterator.hasNext()){
//            String str = iterator.next();
//            String[] strs = map.get(str);
//            for (String string:strs) {
//
//            }
//        }
//        2）调用业务层注册功能
        UserService userService = new UserServiceImp();
        try {
            userService.userRegist(user);

            System.out.println("注册成功");
            System.out.println(user);
//          3）注册成功，向用户邮箱发送信息，跳转到提示页面
            MyMailUtil.sendMessage(user.getEmail(), user.getCode());
            request.setAttribute("msg", "请立即激活");
            return "/info.jsp";
        } catch (Exception e) {
//            4）注册失败，跳转到提示页面

        }
        return "";
    }

//    实现邮件激活的功能
    /*
     * 思考的步骤实现
     * 1. 当用户点击连接时,会跳到此页面 取得code
     * 2. 传到业务层service dao
     * 3. 向数据库进行查询
     * 4. 如果有就返回到登录界面, 没有就重新发送连接
     */

    public String active(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String code = request.getParameter("code");
        //System.out.println(code);
        // 这是第二步
        UserService userService = new UserServiceImp();
        boolean flag = userService.userActive(code);

        // 判断flag
        if (flag) {
            //激活成功 返回到收货页面
            return "/Login.jsp";
        }
        return " ";   //这里补写失败页面
    }

    /**
     * 用户登录
     * 1. 获取用户数据 （账户和密码）
     * 2. 交给业务层
     *
     * @param request
     * @param response
     * @return
     * @throws ServletException
     */
    public String userLogin(HttpServletRequest request, HttpServletResponse response) {
        // 1.获取用户数据
        User user = new User();
        MyBeanUtils.populate(user, request.getParameterMap());
        // 2.交给业务层
        UserService userService = new UserServiceImp();
        try {
            user = userService.userLogin(user);
            //登录成功，将用户放入session里面
            request.getSession().setAttribute("loginUser", user);
            // 重定向到首页
            response.sendRedirect("index.jsp");
            return null;
        } catch (Exception e) {
            String msg = e.getMessage();
            System.out.println(msg);
            request.setAttribute("msg", msg);
            //失败跳转到哪去？？？？
            return "";
        }


    }

    /**
     * 退出功能 共三件事
     * 1. 删除session
     * 2. 重定向到首页
     * 3. return null
     *
     * @param request
     * @param response
     * @return null
     * @throws IOException
     */
    public String userOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
        return null;
    }

    /**
     * 添加一些信息
     * 1. 住址
     * 2. 邮编
     * 3. 电话
     * @param request
     * @param response
     * @return
     * @throws IOException
     */

    public String userDetailMsg(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Map<String,String[]> map = request.getParameterMap();
        User user = new User();
        MyBeanUtils.populate(user,map);
        System.out.println(user);
        UserService service = new UserServiceImp();
        User user1 = service.userDetailMsg(user);

        User user2 = (User) request.getSession().getAttribute("loginUser");
        if(user2 != null){
            request.getSession().setAttribute("loginUser",user1);
        }
        response.sendRedirect("/LoveFurist/user_site.jsp");
        return null;
    }
}
