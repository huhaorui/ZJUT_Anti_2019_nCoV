<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta name="theme-color" content="#2196f3">
    <title>浙江工业大学</title>
    <link rel="stylesheet" type="text/css" href="css/mdui.min.css">
    <script src="js/mdui.min.js"></script>
</head>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo mdui-theme-accent-pink">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
        <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white" onclick="">
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
<div class="mdui-col-md-1 mdui-col-sm-12 ">

</div>
<div class="mdui-col-md-4 mdui-col-sm-12" style="margin-top: 16px">
    <div class="mdui-card">
        <div class="mdui-card-media">
            <img src="image/card.jpg"/>
            <div class="mdui-card-media-covered">
                <div class="mdui-card-primary">
                    <div class="mdui-card-primary-title">管理员</div>
                    <div class="mdui-card-primary-subtitle">Administrator</div>
                </div>
            </div>
        </div>
        <div class="mdui-card-actions">
            <button class="mdui-btn mdui-ripple" onclick="window.location.assign('login.jsp?user=admin')">登陆
            </button>
        </div>
    </div>
</div>
<div class="mdui-col-md-1 mdui-col-sm-12">
</div>
<div class="mdui-col-md-4 mdui-col-sm-12" style="margin-top: 16px">
    <div class="mdui-card">
        <div class="mdui-card-media">
            <img src="image/card.jpg"/>
            <div class="mdui-card-media-covered">
                <div class="mdui-card-primary">
                    <div class="mdui-card-primary-title">教师/学生</div>
                    <div class="mdui-card-primary-subtitle">Teacher/Student</div>
                </div>
            </div>
        </div>
        <div class="mdui-card-actions">
            <button class="mdui-btn mdui-ripple" onclick="window.location.assign('login.jsp?user=teacher')">登陆
            </button>
        </div>
    </div>
</div>
<div class="mdui-col-md-1 mdui-col-sm-12">
</div>
</body>
<script>const $$ = mdui.JQ;</script>
<script src="js/script.js"></script>
</html>
