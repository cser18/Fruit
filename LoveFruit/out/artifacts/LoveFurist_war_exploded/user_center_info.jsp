<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/8
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="CSS/user_center_info.css">
<link rel="stylesheet" href="CSS/main.css">

<head>
    <title>用户中心</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li>
                <a href="/LoveFurist/UserServlet?method=userUI" class="active">· 个人信息</a>
            </li>
            <li>
                <a href="/LoveFurist/OrderServlet?method=findMyOrdersWithPage&num=1">· 全部订单</a>
            </li>
            <li>
                <%--/LoveFurist/UserServlet?method=XXXX--%>
                <a href="/LoveFurist/user_site.jsp">· 收货地址</a>
            </li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <div class="info_con clearfix">
            <h3 class="common_title2">基本信息</h3>
            <ul class="user_info_list">
                <c:if test="${empty loginUser}">
                    请去填写详细地址
                </c:if>
                <c:if test="${not empty loginUser}">
                    <li>
                        <span>用户名:</span>
                            ${loginUser.username}
                    </li>
                    <li>
                        <span>联系方式:</span>
                            ${loginUser.telephone}
                    </li>
                    <li>
                        <span>联系地址:</span>
                            ${loginUser.addrs}
                    </li>
                </c:if>
            </ul>
        </div>
        <h3 class="common_title2">最近浏览</h3>
        <div class="has_view_list">
            <ul class="goods_type_list clearfix">
                <li>
                    <a href="#">
                        <img>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
