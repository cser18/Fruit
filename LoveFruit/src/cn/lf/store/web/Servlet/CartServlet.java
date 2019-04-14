package cn.lf.store.web.Servlet;

import cn.lf.store.domain.Cart;
import cn.lf.store.domain.CartItem;
import cn.lf.store.domain.Product;
import cn.lf.store.service.ProductService;
import cn.lf.store.service.UserServiceImp.ProductServiceImp;
import cn.lf.store.web.base.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLDataException;
import java.sql.SQLException;

@WebServlet(name = "CartServlet")
public class CartServlet extends BaseServlet {
    /**
     * addCart 增加到购物车
     * 1. 从session里面获取购物车
     * 2. 没有  创建购物车 放到session中
     * 3. 有  取得购物车
     * 4. 获得商品的pid和数量
     * 5. 通过pid查找到商品
     * 6. 获取到待购买的购物项
     * 7. 使用购物车上的方法
     * @param request
     * @param response
     * @return null
     * @throws SQLDataException
     */
    public String addCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        //1.
        Cart cart = (Cart)request.getSession().getAttribute("Cart");
        if(cart==null){
            cart = new Cart();
            request.getSession().setAttribute("Cart",cart);
        }
        // 有
        String pid = request.getParameter("pid");
        int num = Integer.parseInt(request.getParameter("num"));
        ProductService productService = new ProductServiceImp();
        Product product = productService.detailById(pid);

        CartItem cartItem = new CartItem();
        cartItem.setProduct(product);
        cartItem.setTotalNum(num);
        cart.addCartItemToCart(cartItem);
        response.sendRedirect("/LoveFurist/cart.jsp");
        return null;
   }

    /**
     * 删除物品
     * 1. 得到物品的pid
     * 2. 得到购物车
     * 3. 调用购物车的删除方法
     * 4. 更新购物车
     * @param request
     * @param response
     * @return
     * @throws SQLException
     * @throws IOException
     */

    public String removeItem(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String pid = request.getParameter("pid");
        Cart cart = (Cart)request.getSession().getAttribute("Cart");
        cart.removeCartItem(pid);
        cart.setNum(cart.getNum() - 1);
        response.sendRedirect("/LoveFurist/cart.jsp");
        return null;
    }
}
