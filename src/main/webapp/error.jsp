<%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/18
  Time: 13:30
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
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '密码错误',
            buttons: [
                {
                    text: '确认',
                }
            ]
        });
    }

    function login() {
        let id = document.getElementsByName("id")[0].value;
        let password = document.getElementsByName("password")[0].value;
        if (id.length === 0 || password.length === 0) {
            alert("工号或密码不能为空")
            return false
        }
        password = md5(password + "wcfnb") //wcf is salt
        document.getElementsByName("password")[0].value = password
    }

    function check() {
        let id = document.getElementsByName("id")[0].value;
        let password = document.getElementsByName("password")[0].value;
        if (id.length === 0 || password.length === 0) {
            alert("工号或密码不能为空")
            return false
        }
    }
</script>
<%
    boolean admin = false;
    if (request.getParameter("user") != null && request.getParameter("user").equals("admin")) {
        admin = true;
    }
%>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo  mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
        <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white" onclick="history.back()">
            <i class="mdui-icon material-icons">arrow_back</i>
        </span>
        <a href="" class="mdui-typo-headline mdui-hidden-xs"
           style="font-weight: inherit">浙江工业大学</a>
        <a href="" class="mdui-typo-title " style="font-weight: inherit">学生健康信息管理系统</a>
        <div class="mdui-toolbar-spacer"></div>

    </div>
</header>
<div class="mdui-col-md-4 mdui-col-sm-12">

</div>
<%
    if (admin) {
%>
<div class="mdui-col-md-4 mdui-col-sm-12  mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">管理员登陆</h1>
    <div class="mdui-container-fluid mdui-center" id="content" style="margin: 64px">
        <form action="login" method="post">
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">account_circle</i>
                <label class="mdui-textfield-label">工号</label>
                <input class="mdui-textfield-input" name="id" type="text"/>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">lock</i>
                <label class="mdui-textfield-label">密码</label>
                <input class="mdui-textfield-input" name="password" type="password"/>
            </div>
            <input type="hidden" name="user" value="admin">
            <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
                    style="margin-top: 32px" onclick="return login()">登陆
            </button>
        </form>
        <button class="mdui-btn mdui-ripple mdui-center" onclick="window.location.assign('ForgetPassword.jsp')">
            忘记密码
        </button>
    </div>
</div>
<%
} else {
%>
<div class="mdui-col-md-4 mdui-col-sm-12  mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">师生登陆</h1>
    <div class="mdui-container-fluid mdui-center" id="" style="margin: 64px">
        <form action="login" method="post">
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">account_circle</i>
                <label class="mdui-textfield-label">姓名</label>
                <input class="mdui-textfield-input" name="name" type="text"/>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">account_circle</i>
                <label class="mdui-textfield-label">学号/工号</label>
                <input class="mdui-textfield-input" name="id" type="text"/>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">lock</i>
                <label class="mdui-textfield-label">密码</label>
                <input class="mdui-textfield-input" name="password" type="password"/>
                <div class="mdui-textfield-helper">密码为身份证后八位</div>
            </div>
            <input type="hidden" name="user" value="user">
            <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
                    style="margin-top: 32px" onclick="return check()">登陆
            </button>
        </form>

    </div>
</div>

<%
    }
%>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script>const $$ = mdui.JQ;</script>
<script src="js/script.js"></script>
</html>
