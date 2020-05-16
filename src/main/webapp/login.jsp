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
</script>
<%
    boolean admin = true;
    if (request.getParameter("user") != null && request.getParameter("user").equals("teacher")) {
        admin = false;
    }
%>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo mdui-drawer-body-left  mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
        <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white" id="folder"><i
                class="mdui-icon material-icons">menu</i></span>
        <a href="" class="mdui-typo-headline mdui-hidden-xs"
           style="font-weight: inherit">浙江工业大学</a>
        <a href="" class="mdui-typo-title " style="font-weight: inherit">学生健康信息管理系统</a>
        <div class="mdui-toolbar-spacer"></div>

    </div>
</header>
<div class="mdui-drawer" id="drawer">
    <div class="mdui-list" mdui-collapse="{accordion: true}" style="margin-bottom: 76px;">
        <div class="mdui-collapse-item ">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple mdui-list-item-active">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-red">near_me</i>
                <a href="#" class="mdui-list-item-content">首页</a>
            </div>
        </div>
        <div class="mdui-collapse-item">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">account_balance</i>
                <a href="#" class="mdui-list-item-content">健康申报</a>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-collapse-item-body mdui-list">
                <a href="#" class="mdui-list-item mdui-ripple">每日打卡</a>
                <a href="#" class="mdui-list-item mdui-ripple">健康码申领</a>
                <a href="#" class="mdui-list-item mdui-ripple">查询健康码</a>
            </div>
        </div>
        <div class="mdui-collapse-item">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">account_balance</i>
                <a href="#" class="mdui-list-item-content">信息概览</a>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-collapse-item-body mdui-list">
                <a href="#" class="mdui-list-item mdui-ripple">学院信息</a>
                <a href="#" class="mdui-list-item mdui-ripple">专业信息</a>
                <a href="#" class="mdui-list-item mdui-ripple">查询健康码</a>
            </div>
        </div>
        <div class="mdui-collapse-item">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">account_balance</i>
                <a href="#" class="mdui-list-item-content">信息维护</a>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-collapse-item-body mdui-list">
                <a href="#" class="mdui-list-item mdui-ripple">个人信息维护</a>
                <a href="#" class="mdui-list-item mdui-ripple">密码管理</a>
            </div>
        </div>
    </div>
</div>

<div class="mdui-col-md-4 mdui-col-sm-12">

</div>
<%
    if (admin) {
%>
<div class="mdui-col-md-4 mdui-col-sm-12  mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">管理员登陆</h1>
    <div class="mdui-container-fluid mdui-center" id="content" style="margin: 64px">
        <form action="LoginServlet" method="post">
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
        <form action="LoginServlet" method="post">
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
    }
%>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script>const $$ = mdui.JQ;</script>
<script src="js/script.js"></script>
</html>
