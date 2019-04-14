<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/1
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
<%--首行div--%>
<div class="index">
    <div class="head">
        <div id="index_top_1" class="topdiv">
            <a href="#">网站地图</a>
            <a href="#">联系我们</a>
        </div>
        <div id="index_top_2" class="topdiv">
            <a href="#">天天优惠</a>
            <a href="#">天天会员</a>
            <a href="#">我的订单</a>
            <a href="#" class="dic_a">购物车</a>
        </div>
        <div id="index_top_3" class="topdiv">
            <c:if test="${empty loginUser}">
                <a href="${pageContext.request.contextPath}/UserServlet?method=loginUI">请登录</a>
                <a href="${pageContext.request.contextPath}/UserServlet?method=registUI" class="top_a">注册有礼</a>
            </c:if>
            <c:if test="${not empty loginUser}">
                <a style="color: darkorange;" href="${pageContext.request.contextPath}/UserServlet?method=userUI">欢迎您:${loginUser["username"]}</a>
                <a class="top_a" href="${pageContext.request.contextPath}/UserServlet?method=userOut">退出</a>
            </c:if>
        </div>
    </div>
</div>
<%--第二行div 包括搜索框和图标 height: 120px--%>
<div class="top_title">
    <div class="top_ico">
        <a href="index.jsp"><img height="120px" src="image/title.png"></a>
    </div>
    <%--表单--%>
    <div class="top_list">
        <div class="top_list_1">
            <form>
                <table class="tab">
                    <tr>
                        <td><input id="soso" class="susu" type="text" placeholder="请输入要搜索的内容"></td>
                        <td><input id="sub" type="submit" value="搜索"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="top_link">
            <a href="#">火龙果</a>
            <a href="#">新鲜蔬菜</a>
            <a href="#">香蕉芒果</a>
            <a href="#">天天优选</a>
        </div>
    </div>
</div>
</body>
</html>
