<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/8
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="CSS/main.css">
<link rel="stylesheet" href="CSS/order.css">
<html>
<head>
    <title>全部订单</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li>
                <a href="/LoveFurist/UserServlet?method=userUI">· 个人信息</a>
            </li>
            <li>
                <a href="/LoveFurist/OrderServlet?method=findMyOrdersWithPage&num=1" class="active">· 全部订单</a>
            </li>
            <li>
                <a href="/LoveFurist/UserServlet?method=XXXX">· 收货地址</a>
            </li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <h3 class="common_title2">全部订单</h3>
        <c:forEach items="${page.list}" var="order">
            <ul class="order_list_th w978 clearfix">
                <li class="col01">${order.ordertime}</li>
                <li class="col02">订单号:${order.oid}</li>
                <c:if test="${order.state == 1}">
                    <%--1为未支付--%>
                    <li class="col02 stress">
                        未支付
                    </li>
                </c:if>
                    <%--2为已支付--%>
                <c:if test="${order.state == 2}">
                    <li class="col02 stress">
                        已支付
                    </li>
                </c:if>
                    <%--3为未发货--%>
                <c:if test="${order.state == 3}">
                    <li class="col02 stress">
                        未发货
                    </li>
                </c:if>
                    <%--4为已发货--%>
                <c:if test="${order.state == 4}">
                    <li class="col02 stress">
                        已发货
                    </li>
                </c:if>
                    <%--5为已签收--%>
                <c:if test="${order.state == 5}">
                    <li class="col02 stress">
                        已签收
                    </li>
                </c:if>
                <div style="clear: both"></div>
            </ul>
            <table class="order_list_table w980">
                <tbody>
                <tr>
                    <td style="width: 100%; display: inline-block; border-bottom-width: 0; border-top-width: 0; padding-top: 0; padding-right: 0; border-right-width: 0">
                        <c:forEach items="${order.list}" var="orderitem" varStatus="i">
                            <ul class="order_goods_list clearfix">
                                <li class="col01">
                                    <img src="${orderitem.product.pimage}">
                                </li>
                                <li class="col02">
                                    ${orderitem.product.pname}
                                    <em>${orderitem.product.shop_price}元/500g</em>
                                </li>
                                <li class="col03">${orderitem.quantity}</li>
                                <li class="col04">${orderitem.total}</li>
                            </ul>
                            <div style="clear: both"></div>
                        </c:forEach>
                    </td>
                    <td style="width: 15%">${order.total}</td>
                    <c:if test="${order.state == 1}">
                        <%--1为未支付--%>
                        <td width="15%">待付款</td>
                    </c:if>
                        <%--2为已支付--%>
                    <c:if test="${order.state == 2}">
                        <td width="15%">已付款</td>
                    </c:if>


                    <c:if test="${order.state == 1}">
                        <%--1为未支付--%>
                        <td width="15%">
                            <a href="#" class="oper_btn">去付款</a>
                        </td>
                    </c:if>
                        <%--2为已支付--%>
                    <c:if test="${order.state == 2}">
                        <td width="15%">
                            <a href="#" class="oper_btn">查看物流</a>
                        </td>
                    </c:if>
                        <%--3为未发货--%>
                    <c:if test="${order.state == 3}">
                        <td width="15%">
                            <a href="#" class="oper_btn">催卖家</a>
                        </td>
                    </c:if>
                        <%--4为已发货--%>
                    <c:if test="${order.state == 4}">
                        <td width="15%">
                            <a href="#" class="oper_btn">查看物流</a>
                        </td>
                    </c:if>


                </tr>
                </tbody>
            </table>
        </c:forEach>

    </div>
</div>
</body>
</html>
