package cn.lf.store.web.Servlet;

import cn.lf.store.domain.pageModel;
import cn.lf.store.domain.Product;
import cn.lf.store.service.ProductService;
import cn.lf.store.service.UserServiceImp.ProductServiceImp;
import cn.lf.store.web.base.BaseServlet;
import net.sf.json.JSONArray;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "ProductServlet")
public class ProductServlet extends BaseServlet {
    /**
     * 实现加载热门和最新商品
     * 1. 向业务层发送数据  返回两个List
     * 2. 将两个list转为json格式的数据
     * 3. 读取json格式的数据
     * @param request
     * @param response
     * @return null
     */
    public String FindProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        // 1.创建业务层
        ProductService productService = new ProductServiceImp();
        // 2.获得数据
        List<Product> hots = productService.findHots();
        //List<Product> news = productService.findNews();
        String jsons = JSONArray.fromObject(hots).toString();
//        System.out.println(jsons);
        //将获得信息给客户端
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(jsons);
        return null;
    }

    /**
     * 查看商品的详情
     * 1. 取数据   pid
     * 2. 向数据库 查pid
     * 3. 返回商品的所有信息
     * @param request
     * @param response
     * @return
     * @throws SQLException
     * @throws IOException
     */

    public String detailbyId(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        // 1.
        String pid = request.getParameter("pid");
        // 2.
        ProductService productService = new ProductServiceImp();
        Product product = productService.detailById(pid);
        request.setAttribute("product",product);
        return "/ProductDetail.jsp";
    }

    /**
     * 功能: 商品的分页查询
     * 1. 查到所有的分类下的商品
     * 2. 将商品放到pageModel中
     * 3. 关联pageModel
     * @param request
     * @param response
     * @return "/product_list.jsp"
     * @throws SQLException
     * @throws IOException
     */
    public String findProductByCidWithPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String cid = request.getParameter("cid");
        int curNum = Integer.parseInt(request.getParameter("num"));

        ProductService productService = new ProductServiceImp();
        pageModel pageModel = productService.findProductByCidWithPage(cid,curNum);


        // 将数据给浏览器
        request.setAttribute("page",pageModel);

        return "/product_list.jsp";
    }
}
