<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/9
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="CSS/main.css">
<link rel="stylesheet" href="CSS/place_order.css">
<html>
<head>
    <title>提交订单</title>
</head>
<body>
<%@include file="header.jsp"%>
<h3 class="common_title">确认收货地址</h3>
<div class="common_list_con clearfix">
    <dl>
    <dt>寄送到:</dt>
    <dd>
        <input type="radio" name checked>
        ${loginUser.addrs}(${loginUser.username} 收)  ${loginUser.telephone}
    </dd>
    </dl>
    <a href="user_site.jsp" class="edit_site">编辑收货地址</a>
</div>
<h3 class="common_title">支付方式</h3>
<div class="common_list_con clearfix">
    <div class="pay_style_con clearfix">
        <input type="radio" name="pay_style" checked>
        <label class="cash">货到付款</label>
        <input type="radio" name="pay_style" checked>
        <label class="weixin">微信支付</label>
        <input type="radio" name="pay_style" checked>
        <label class="zhifubao"></label>
        <input type="radio" name="pay_style" checked>
        <label class="bank">银行卡支付</label>
    </div>
</div>
<h3 class="common_title">商品名称</h3>
<div class="common_list_con clearfix">
    <ul class="goods_list_th clearfix">
        <li class="col01">商品名称</li>
        <li class="col02">商品单位</li>
        <li class="col03">商品价格</li>
        <li class="col04">数量</li>
        <li class="col04">小记</li>
    </ul>
    <ul class="goods_list_td clearfix">
        <c:forEach items="${order.list}" var="item" varStatus="i">
            <li class="col01">${i.count}</li>
            <li class="col02">
                <img src="${item.getProduct().pimage}">
            </li>
            <li class="col03">${item.getProduct().pname}</li>
            <li class="col04">500g</li>
            <li class="col05">${item.getProduct().shop_price}</li>
            <li class="col06">${item.quantity}</li>
            <li class="col07">${item.total}</li>
        </c:forEach>
    </ul>
</div>
<h3 class="common_title">总金额结算</h3>
<div class="common_list_con clearfix">
    <div class="settle_con">
        <div class="total_goods_count">
            共
            <em>${order.getListLength()}</em>
            件商品,共金额
            <b>${order.total}元</b>
        </div>
    </div>
    <div class="transit">
        运费:
        <b>无</b>
    </div>
    <div class="total_pay">
        实付款:
        <b>${order.total}元</b>
    </div>
</div>
<div class="order_submit clearfix">
    <a href="#" id="order_btn">提交订单</a>
</div>
</body>
</html>
