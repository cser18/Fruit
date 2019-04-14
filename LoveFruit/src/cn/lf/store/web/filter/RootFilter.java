package cn.lf.store.web.filter;

import cn.lf.store.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "RootFilter")
public class RootFilter implements Filter {
    public void destroy() {
    }

    /**
     * 1. 判断是否登录
     * 2. 有登录放行
     * 3. 没有登录，转到提示页面
     * @param req
     * @param resp
     * @param chain
     * @throws ServletException
     * @throws IOException
     */
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        // 1.
        HttpServletRequest myRequest = (HttpServletRequest)req;
        User user = (User)myRequest.getSession().getAttribute("loginUser");
        if(user != null){
            chain.doFilter(req, resp);
        }
        else{
            String msg = "请进行登录后在执行该操作";
            myRequest.setAttribute("msg",msg);
            myRequest.getRequestDispatcher("/Login.jsp").forward(req,resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
