<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/7
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="CSS/main.css">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" href="CSS/cart.css">
<html>
<head>
    <title>购物车</title>
</head>

<body>
<%@include file="header.jsp"%>
<c:if test="${empty Cart.getCartItems()}">
    <div class="total_count">
        全部商品
        <em>${Cart.getNum()}</em>
        件
    </div>
</c:if>

<c:if test="${not empty Cart.getCartItems()}">
    <div class="total_count">
        全部商品
        <em>${Cart.getNum()}</em>
        件
    </div>
    <ul class="cart_list_th clearfix">
        <li class="col01">商品名称</li>
        <li class="col02">商品单位</li>
        <li class="col03">商品价格</li>
        <li class="col04">数量</li>
        <li class="col05">小记</li>
        <li class="col06">操作</li>
    </ul>
    <ul class="cart_list_td clearfix">
        <c:forEach items="${Cart.getCartItems()}" var="item">
            <li class="col01">
                <input type="checkbox" name="" checked>
            </li>
            <li class="col02">
                <img src="${item.product.pimage}">
            </li>
            <li class="col03">
                ${item.product.pname}<br>
                <em>${item.product.shop_price}/500g</em>
            </li>
            <li class="col04">
                500g
            </li>
            <li class="col05">
                ${item.product.shop_price}元
            </li>
            <li class="col06">
                <div class="num_add">
                    <a href="#" class="add fl">+</a>
                    <input type="text" class="num_show fl" value="${item.getTotalNum()}">
                    <a href="#" class="minus fl">-</a>
                </div>
            </li>
            <li class="col07">
                    ${item.getTotalPrice()}元
            </li>
            <li class="col08">
                <a href="/LoveFurist/CartServlet?method=removeItem&pid=${item.product.pid}">删除</a>
            </li>
        </c:forEach>

    </ul>
    <ul class="total clearfix">
        <li class="col01">
            <input type="checkbox" name="" checked>
        </li>
        <li class="col02">全选</li>
        <li class="col03">
            合计(不含运费)
            <span>¥</span>
            <em>${Cart.getTotalPrice()}</em>
            <br>
            共计
            <b>${Cart.getNum()}</b>
            件商品
        </li>
        <li class="col04">
            <a href="${pageContext.request.contextPath}/OrderServlet?method=saveOrder">去结算</a>
        </li>
    </ul>
</c:if>


</body>
</html>
