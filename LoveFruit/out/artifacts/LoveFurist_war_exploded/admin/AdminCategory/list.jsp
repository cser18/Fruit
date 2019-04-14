<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/13
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script type="text/javascript">
        function addCate() {
            window.location.href = ("${pageContext.request.contextPath}/AdminServlet?method=addCateUI");
        }
    </script>
</head>
<body>
<div>
    <div style="text-align: center ;height: 25px; margin: 0 auto;">
        <h3 style="color: darkgrey; font-size: 15pt">全部分类</h3>
    </div>
    <div style="float: right; margin-right: 50px">
        <input type="button" onclick="addCate()" value="添加" width="20px" height="5px">
    </div>


    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>
                            编号
                        </th>
                        <th>
                            分类名称
                        </th>
                        <th>
                            编辑
                        </th>
                        <th>
                            删除
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach varStatus="i" items="${cate}" var="cate">
                        <tr>
                            <td>
                                    ${i.count}
                            </td>
                            <td>
                                    ${cate.cname}
                            </td>
                            <td>
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/image/admin/i_edit.gif">
                                </a>
                            </td>
                            <td>
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/image/admin/i_del.gif">
                                </a>
                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
