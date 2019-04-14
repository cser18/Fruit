<%--
  Created by IntelliJ IDEA.
  User: cser
  Date: 2019/2/12
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <title>后台登录</title>
    <script>var __links = document.querySelectorAll('a');

    function __linkClick(e) {
        parent.window.postMessage(this.href, '*');
    };
    for (var i = 0, l = __links.length; i < l; i++) {
        if (__links[i].getAttribute('data-t') == '_blank') {
            __links[i].addEventListener('click', __linkClick, false);
        }
    }</script>
    <script>$(document).ready(function (c) {
        $('.alert-close').on('click', function (c) {
            $('.message').fadeOut('slow', function (c) {
                $('.message').remove();
            });
        });
    });
    </script>
</head>
<body>
<!-- contact-form -->
<div class="message warning">
    <div class="inset">
        <div class="login-head">
            <h1>后台登录</h1>
            <div class="alert-close"></div>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/AdminServlet?method=adminLogin">
            <li>
                <input type="text" name="admin" class="text" value="Username" onfocus="this.value = '';"
                       onblur="if (this.value == '') {this.value = 'Username';}"><a href="#" class=" icon user"></a>
            </li>
            <div class="clear"></div>
            <li>
                <input type="password" name="adminPassWord" value="Password" onfocus="this.value = '';"
                       onblur="if (this.value == '') {this.value = 'Password';}"> <a href="#" class="icon lock"></a>
            </li>
            <div class="clear"></div>
            <div class="submit">
                <input type="submit"  value="Sign in">
                <%--<h4><a href="#">Lost your Password ?</a></h4>--%>
                <div class="clear"></div>
            </div>

        </form>
    </div>
</div>
</div>
<div class="clear"></div>
<!--- footer --->
<div class="footer">
    <p>Copyright &copy; 2019.</p>
</div>

</body>
</html>
