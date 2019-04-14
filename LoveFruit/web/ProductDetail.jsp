<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/2
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="CSS/main.css">
<link href="CSS/ProductDetail.css" rel="stylesheet">
<html>
<head>
    <title>商品详情页</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span> > </span>
    <a href="#">热门水果</a>
    <span> > </span>
    <a href="#">商品详情</a>
</div>

<form action="/LoveFurist/CartServlet?method=addCart&pid=${product.pid}" method="post" id="formId">
<div class="goods_detail_con clearfix">
    <div class="goods_detail_img fl">
        <img src="${product.pimage}">
    </div>
    <%--价格页--%>
    <div class="goods_detail_list fl">
        <h3>${product.pname}</h3>
        <p>${product.pdesc}</p>
        <%--价格--%>
        <div class="prize_bar">
            <span class="show_price">
                ¥
                <em>${product.shop_price}</em>
            </span>
            <span class="show_unit">单位:500g</span>
        </div>
        <div class="goods_num clearfix">
            <div class="num_name fl">数量:</div>
            <div class="num_add fl">
                <input type="text" id="num_show" name="num" class="num_show fl" value="1">
                <a href="#" class="add fr">+</a>
                <a href="#" class="minus fr">-</a>
            </div>
        </div>
        <div class="total">
            总价:
            <em>${product.shop_price}</em>
        </div>
        <div class="operate_btn">
            <a href="#" id="buy_btn" class="buy_btn">立即购买</a>
            <a href="#" id="add_cart" class="add_cart" onclick="document:formId.submit()">加入购物车</a>
        </div>
    </div>
</div>
</form>
</body>

<%--<script>--%>
    <%--$(function () {--%>
        <%--$("#add_cart").click(function () {--%>
            <%--var $count = $("#num_show").val();--%>
            <%--&lt;%&ndash;var $id = ${product.pid};&ndash;%&gt;--%>
            <%--&lt;%&ndash;$("#add_cart").attr("href","/LoveFurist/CartServlet?method=addCart&pid="+$id+"&num="+$count);&ndash;%&gt;--%>
            <%--var $url = "/LoveFurist/CartServlet";--%>
            <%--var $parms = {"method":"addCart", "pid":"${product.pid}", "num":$count};--%>
            <%--$("#add_cart").submit();--%>
        <%--})--%>
    <%--})--%>
<%--</script>--%>
</html>
