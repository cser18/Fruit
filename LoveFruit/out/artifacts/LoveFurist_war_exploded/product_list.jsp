<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/3
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="CSS/main.css">
<link rel="stylesheet" href="CSS/product_list.css">
<html>
<head>
    <title>商品分页</title>
</head>
<body>
<%--引入头部--%>
<%@include file="header.jsp" %>
<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span> > </span>
    <a href="#">热门水果</a>
</div>
<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>热门推荐</h3>
            <ul>
                <li>
                    <img src="#">
                    <h4>
                        <a href="#">XXX</a>
                    </h4>
                    <div class="prize">
                        ¥ XXX
                    </div>
                </li>
                <li>
                    <img src="#">
                    <h4>
                        <a href="#">XXX</a>
                    </h4>
                    <div class="prize">
                        ¥ XXX
                    </div>
                </li>
            </ul>
        </div>

    </div>
    <div class="r_wrap fr clearfix">
        <div class="sort_bar">
            <a href="#" class="active">默认</a>
            <a href="#">价格</a>
            <a href="#">人气</a>
        </div>
        <ul class="goods_type_list clearfix">
            <c:forEach items="${page.list}" var="li">
                <li>
                    <a href="/LoveFurist/ProductServlet?method=detailbyId&pid=${li.pid}">
                        <img src="${li.pimage}">
                    </a>
                    <h4>
                        <a href="/LoveFurist/ProductServlet?method=detailbyId&pid=${li.pid}">${li.pname}</a>
                    </h4>
                    <div class="operate">
                        <span class="prize">${li.shop_price}</span>
                        <span class="unit">${li.shop_price}/500g</span>
                        <c:if test="${empty loginUser}">
                            <a href="#" class="add_goods" title="加入购物车"></a>
                        </c:if>
                        <c:if test="${not empty loginUser}">
                            <a href="/LoveFurist/CartServlet?method?addCart&pid=${li.pid}" class="add_goods" title="加入购物车"></a>
                        </c:if>

                    </div>
                </li>
            </c:forEach>
            <li></li>
        </ul>
    </div>
</div>
</body>
</html>
