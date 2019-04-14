package cn.lf.store.web.Servlet;

import cn.lf.store.domain.Category;
import cn.lf.store.domain.Root;
import cn.lf.store.service.AdminService;
import cn.lf.store.service.CategoryService;
import cn.lf.store.service.UserServiceImp.AdminServiceImp;
import cn.lf.store.service.UserServiceImp.CategoryServiceImp;
import cn.lf.store.web.base.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminServlet")
public class AdminServlet extends BaseServlet {
    /**
     * 1. 管理员登录
     * 2. 进过思考 天天满鲜为电商网站 用户量多 所以新建管理员表
     * 3. 一样的功能
     * @param request
     * @param response
     * @return
     * @throws SQLDataException
     */
    public String adminLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String adminName = request.getParameter("admin");
        String adminPassWord = request.getParameter("adminPassWord");
        AdminService adminService = new AdminServiceImp();
        Root root = adminService.adminLogin(adminName,adminPassWord);
        if(root != null){
            response.sendRedirect("../LoveFurist/admin/adminIndex.html");
            return null;
        }
        else{
            //request.setAttribute("msg","账户名或密码错误!");
            return "/admin.jsp";
        }

    }

    /**
     * 查找所有分类
     * @param request
     * @param response
     * @return
     * @throws SQLException
     * @throws IOException
     */
    public String findCateAll(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        CategoryService cartgoryService = new CategoryServiceImp();
        List<Category> list = cartgoryService.findCateAll();
        request.setAttribute("cate",list);
        return "/admin/AdminCategory/list.jsp";
    }

    /**
     * 转发路径
     * @param request
     * @param response
     * @return
     */
    public String addCateUI(HttpServletRequest request, HttpServletResponse response){
        return "/admin/AdminCategory/add.jsp";
    }

}
