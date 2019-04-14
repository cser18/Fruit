<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/1/28
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!--
    1.  用户注册界面
    -->
    <meta charset="UTF-8">
    <title>用户注册页面</title>
    <link rel="stylesheet" href="CSS/Count_Reg.css">
    <link rel="stylesheet" href="CSS/main.css">
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
</head>
<body>
<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"> <img src="image/logo.jpg"></a>
        <div class="div_tip">快乐生活每一天</div>
    </div>
    <div class="reg_div">
        <div class="r_con fr">
            <div class="reg_title clearfix">
                <h1>用户注册</h1>
                <a href="Login.jsp">登录</a>
            </div>
        </div>
        <div class="reg_form clearfix">
            <form action="${pageContext.request.contextPath}/UserServlet?method=userRegist" method="post">
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="username" id="user_name">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input name="password" type="password">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>邮箱:</label>
                        <input name="email" type="text">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意"爱水果用户使用协议"</label>
                        <span class="error_tip2">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit" value="注册" name="reg">
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
<div class="footer no-mp">
    <div class="foot_link">
        <a href="#">关于我们</a>
        <span>|</span>
        <a href="#">联系我们</a>
        <span>|</span>
        <a href="#">招聘人才</a>
        <span>|</span>
        <a href="#">友情连接</a>
        <p>CopyRight © 2019 安徽信息工程学院天天满鲜有限公司</p>
    </div>
</div>
</body>
</html>
