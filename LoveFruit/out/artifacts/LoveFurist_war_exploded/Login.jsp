<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/1/28
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" href="CSS/Login.css">
    <link rel="stylesheet" href="CSS/main.css">
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
</head>

<body>
<%@include file="header.jsp"%>

<div class="login_tip">

    <div class="login_form fr">
        <div class="login_title clearfix">
            <h1>用户登录</h1>
            <a href="${pageContext.request.contextPath}/UserServlet?method=registUI">立即注册</a>
        </div>
        <form action="${pageContext.request.contextPath}/UserServlet?method=userLogin" method="post">
            <div class="form_input">
                <input name="username" class="input_user" type="text" placeholder="请输入账号">
                <div class="error_user">输入错误</div>
                <input name="password" class="input_password" type="password" placeholder="请输入密码">
                <div class="error_pwd">输入错误</div>
                <div class="more_input clearfix">
                    <input type="checkbox"> <label>记住用户名</label>
                    <a href="#">忘记密码</a>
                </div>
            </div>
            <div>
                <input class="sub" type="submit" value="立即登录">
            </div>
        </form>
    </div>

</div>

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
</body>
</html>
