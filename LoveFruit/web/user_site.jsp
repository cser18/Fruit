<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/8
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="CSS/main.css">
<link rel="stylesheet" href="CSS/user_site.css">
<html>
<head>
    <title>收货地址</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li>
                <a href="/LoveFurist/UserServlet?method=userUI">· 个人信息</a>
            </li>
            <li>
                <a href="/LoveFurist/OrderServlet?method=findMyOrdersWithPage&num=1">· 全部订单</a>
            </li>
            <li>
                <a href="/LoveFurist/UserServlet?method=XXXX" class="active">· 收货地址</a>
            </li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <h3 class="common_title2">收货地址</h3>
        <c:if test="${empty loginUser.addrs}">
            <div class="site_con">
                <dl>
                    请添加你的收货地址,让我们精准送货
                </dl>
            </div>
        </c:if>
        <c:if test="${not empty loginUser.addrs}">
            <div class="site_con">
                <dl>
                   <dt>当前地址:</dt>
                    <dd>${loginUser.addrs}</dd>
                </dl>
            </div>
        </c:if>
        <h3 class="common_title2">编辑地址</h3>
        <div class="site_con">
            <form action="/LoveFurist/UserServlet?method=userDetailMsg" method="post">
                <div class="form_group">
                    <label>收信人</label>
                    <input type="hidden" name="uid"  value="${loginUser.uid}">
                    <input type="text" name="username" placeholder="${loginUser.username}">
                </div>
                <div class="form_group form_group2">
                    <label>详细地址:</label>
                    <textarea name="addrs" style="resize: none" class="site_area"></textarea>
                </div>
                <div class="form_group">
                    <label>邮编:</label>
                    <input type="text" name="postcode">
                </div>
                <div class="form_group">
                    <label>手机:</label>
                    <input type="text" name="telephone">
                </div>
                <input type="submit" name="sub" value="提交" class="info_submit">
            </form>
        </div>
    </div>
</div>
</body>
</html>
