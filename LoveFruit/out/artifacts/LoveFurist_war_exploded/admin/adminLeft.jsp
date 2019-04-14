<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/12
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--这个是标签的左边--%>
<head>
    <link rel="stylesheet" href="../CSS/dtree.css" type="text/css">
    <script src="../JaveScript/dtree.js" type="text/javascript"></script>
</head>
<body>
<div class="dtree">
    <p><a href="javascript: d.openAll();">显示所有</a> | <a href="javascript: d.closeAll();">关闭所有</a></p>
    <script type="text/javascript">

        d = new dTree("d");
        // 1当前节点
        // 2父节点id
        // 3节点上的文字描述
        // 跳转路径
        // 提示信息
        // 发生变化的frame的name属性
        d.add(0, -1, "系统菜单树");
        d.add(1,0,"分类管理"," ","分类管理","");
        d.add(2,1,"分类管理","${pageContext.request.contextPath}/AdminServlet?method=findCateAll","分类管理","main");
        d.add(3,0,"商品管理");
        d.add(4,3,"商品管理","","","main");
        d.add(5,3,"已下架的商品管理","","","main");
        d.add(6,0,"订单管理");
        d.add(7,6,"订单管理","","","main");
        d.add(8,6,"未付款的订单","","","main");
        d.add(9,6,"已付款的订单","","","main");
        d.add(10,6,"已发货的订单","","","main");
        d.add(11,6,"已完成的订单","","","main");
        document.write(d);
    </script>
</div>
</body>
</html>
