package cn.lf.store.web.Servlet;

import cn.lf.store.domain.Category;
import cn.lf.store.service.CategoryService;
import cn.lf.store.service.UserServiceImp.CategoryServiceImp;
import cn.lf.store.web.base.BaseServlet;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CategroyServlet")
public class CategoryServlet extends BaseServlet{
    /**
     * 查到所有的分类
     * 1. 调用CategoryService
     * @param request
     * @param response
     * @return
     */
    public String findCate(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        CategoryService categoryService = new CategoryServiceImp();
        List<Category> list = categoryService.findCateAll();
        String jsons = JSONArray.fromObject(list).toString();
//        System.out.println(jsons);
        //将获得信息给客户端
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(jsons);
        return null;
    }

}
