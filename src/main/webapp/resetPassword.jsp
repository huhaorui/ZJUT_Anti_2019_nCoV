<%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/17
  Time: 19:16
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
    function check() {
        let password = document.getElementById("password").value;
        let password1 = document.getElementById("password2").value;
        if (password !== password1) {
            alert("两次输入的密码不同")
            return false
        }
        password = md5(password + "wcfnb") //wcf is salt
        document.getElementById("password").value = password
        document.getElementById("password2").value = password
        return true
    }
</script>
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
<div class="mdui-col-md-4 mdui-col-sm-12  mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">找回密码</h1>
    <div class="mdui-container-fluid mdui-center" id="content" style="margin: 64px">
        <form action="resetPassword" method="post">
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">lock</i>
                <label class="mdui-textfield-label">请输入新密码</label>
                <input class="mdui-textfield-input" id="password" name="password" type="password"/>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">lock</i>
                <label class="mdui-textfield-label">请再输入一次</label>
                <input class="mdui-textfield-input" id="password2" name="password2" type="password"/>
            </div>
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
            <input type="hidden" name="token" value="<%=request.getParameter("token")%>">
            <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
                    style="margin-top: 32px" onclick="return check()">重置密码
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
