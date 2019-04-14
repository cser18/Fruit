<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/1/27
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="CSS/index.css">
<script src="JaveScript/index.js"></script>
<%--bost--%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>天天满鲜</title>
</head>
<body>
<%--<a href="${pageContext.request.contextPath}/UserServlet?method=registUI">用户注册</a>--%>
<%--抽取公共页面--%>
<%@include file="header.jsp" %>
<%--第三行 导航栏和轮播图--%>
<div class="three">
    <div class="top" style="float: left";>
        <ul class="topmenu" id="top">
            <div class="toptitle">
                全部商品分类
            </div>
            <%--<li class="tag"><a href="#">天天满鲜</a></li>--%>
            <%--<li class="tag"><a href="/LoveFurist/ProductServlet?method=findProductByCidWithPage&num=1&cid=1">热门水果</a></li>--%>
            <%--<li class="tag"><a href="#">新鲜蔬菜</a></li>--%>
            <%--<li class="tag"><a href="#">油盐酱醋</a></li>--%>
            <%--<li class="tag"><a href="#">美味海鲜</a></li>--%>
            <%--<li class="tag"><a href="#">速食冷冻</a></li>--%>
            <%--<li class="tag"><a href="#">调料厨具</a></li>--%>
            <%--<li class="tag"><a href="#">日用百货</a></li>--%>
            <div style="clear: both"></div>
        </ul>
    </div>

    <%--关于轮播图片--%>
    <div style="width: 78%; float: left; border: 1px solid red; display: inline-block; height: 370px">

    </div>
    <div style="clear: both"></div>
</div>
<%--第四部分 热门商品部分--%>
<div style="clear: both"></div>
<div class="four">
    <%--这里是标题层--%>
    <div class="list_title clearfix">
        <h3 class="fl" id="model01">热门水果</h3>
        <div class="subtitle fl">
            <span>|</span>
            <a href="#">鲜芒</a>
            <a href="#">加州提子</a>
            <a href="#">亚马逊牛油果</a>
        </div>
        <a class="goods_more fr" id="fruit_morr" href="/LoveFurist/ProductServlet?method=findProductByCidWithPage&num=1&cid=1">查看更多</a>
    </div>
    <%--这里是商品展示层--%>
    <div class="goods_con clearfix">
        <div class="goods_banner fl">
            <img src="image/banner05.jpg">
        </div>
        <ul class="goods_list fl" id="list">
            <%--追加的li标签--%>
        </ul>
    </div>
</div>
</body>
</html>
