<%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/16
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta name="theme-color" content="#2196f3">
    <title>浙江工业大学</title>
    <link rel="stylesheet" type="text/css" href="css/mdui.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/md5.min.js"></script>
    <script src="js/mdui.min.js"></script>
</head>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo  mdui-theme-accent-deep-purple">
<%
    if (request.getParameter("reset") != null && request.getParameter("reset").equals("error")) {
%>
<script type="text/javascript">
    window.onload = function () {
        checkIfEmpty();
        mdui.dialog({
            title: '邮箱验证失败',
            buttons: [
                {
                    text: '确认',
                }
            ],
            history: false,
        });
    }
</script>
<%
} else if (request.getParameter("reset") != null && request.getParameter("reset").equals("ok")) {
%>
<script type="text/javascript">
    window.onload = function () {
        checkIfEmpty();
        mdui.dialog({
            title: '邮件发送成功，请到邮箱查收',
            buttons: [
                {
                    text: '确认',
                }
            ],
            history: false,
        });
    }
</script>
<%
} else {
%>
<script type="text/javascript">
    window.onload = function () {
        checkIfEmpty();
    }
</script>
<%
    }
%>
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
       <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"
             onclick="window.location.assign('main.jsp')">
            <i class="mdui-icon material-icons">home</i>
        </span>
        <a href="" class="mdui-typo-headline mdui-hidden-xs"
           style="font-weight: inherit">浙江工业大学</a>
        <a href="" class="mdui-typo-title " style="font-weight: inherit">学生健康信息管理系统</a>
        <div class="mdui-toolbar-spacer"></div>

    </div>
</header>
<div class="mdui-col-md12 mdui-hidden-md-down" style="height: 64px">
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">

</div>
<div class="mdui-col-md-4 mdui-col-sm-12  mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">找回密码</h1>
    <div class="mdui-container-fluid mdui-center" id="content" style="margin: 64px">
        <form action="forgetPassword" method="post">
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">account_circle</i>
                <label class="mdui-textfield-label">工号</label>
                <input class="mdui-textfield-input" name="id" type="text"/>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">mail</i>
                <label class="mdui-textfield-label">邮箱</label>
                <input class="mdui-textfield-input" name="email" type="email"/>
            </div>
            <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
                    style="margin-top: 32px">重置密码
            </button>
        </form>
    </div>
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script>const $$ = mdui.JQ;</script>
<script src="js/script.js"></script>
</html>
