package cn.lf.store.web.Servlet;

import cn.lf.store.domain.*;
import cn.lf.store.service.OrderService;
import cn.lf.store.service.UserServiceImp.OrderServiceImp;
import cn.lf.store.utils.UUIDUtils;
import cn.lf.store.web.base.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "OrderServlet")
public class OrderServlet extends BaseServlet {
    /**
     * 保存订单
     * **********
     * 数据分析:
     * Orders
     * private String oid;    程序给的
     * private String ordertime; 程序给的
     * private double total;    Cart中的值
     * private int state;       自己给的 为1
     * private String address;  可以是user
     * private String name;     可以是user
     * private int telephone;   可以是user
     * private User user;        在Session中
     * *************
     * OrderItem
     * private String itemid;    程序给的
     * private int quantity;     遍历Cart里面的Value中的
     * private double total;     遍历Cart里面的Value中的
     * private Product product; //pid   遍历Cart里面的Value中的
     * private Orders orders;   //oid   上面的order
     * **********
     * 1. 看是否登录上用户了  如果有到2 没有 转到登录页面 并且提示
     * 2. 得到Session Cart
     * 3. new Order 将里面进行复制
     * 4. 遍历Session Cart
     * 5. new OrderItem
     * 6. 将Order.list.add
     * 7. 调用Service dao 存到数据库中
     * 8. 清除购物车
     * 8. setAttribute
     *
     * @param request
     * @param response
     * @return
     * @throws SQLException
     * @throws IOException
     */
    public String saveOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        User user = (User) request.getSession().getAttribute("loginUser");
        if (user == null) {
            //转到登录页面 并提示
            request.setAttribute("orderMsg", "请先登录,在下单");
            return "/Login.jsp";
        }
//        3
        Cart cart = (Cart) request.getSession().getAttribute("Cart");
        Orders orders = new Orders();
        orders.setOid(UUIDUtils.getId());
        orders.setOrdertime(new Date().toString());
        orders.setTotal(cart.getTotalPrice());
        orders.setState(1);
        orders.setUser(user);
        //4
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setItemid(UUIDUtils.getId());
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getTotalNum());
            orderItem.setTotal(cartItem.getTotalPrice());
            orderItem.setOrders(orders);
            orders.getList().add(orderItem);
        }
        OrderService orderService = new OrderServiceImp();
        orderService.saveOrder(orders);

        cart.clearCart();
        cart.setNum(0);
        request.setAttribute("order", orders);
        return "/place_order.jsp";
    }

    /**
     * 获得用户登录
     * 获得当前页
     * 调用service逻辑 返回pageModel
     * @param request
     * @param response
     * @return
     * @throws SQLException
     * @throws IOException
     */
    public String findMyOrdersWithPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, InvocationTargetException, IllegalAccessException {
        User user = (User)request.getSession().getAttribute("loginUser");
        int currIndex = Integer.parseInt(request.getParameter("num"));

        OrderService orderService = new OrderServiceImp();
        pageModel pageModel = orderService.findMyOrdersWithPage(user, currIndex);
        request.setAttribute("page",pageModel);
        return "/order.jsp";
    }
}