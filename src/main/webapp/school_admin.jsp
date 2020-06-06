<%@ page import="model.Admin" %><%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/30
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta name="theme-color" content="#3f51b5">
    <title>浙江工业大学</title>
    <link rel="stylesheet" type="text/css" href="css/mdui.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/md5.min.js"></script>
    <script src="js/mdui.min.js"></script>
</head>
<jsp:useBean id="person" class="model.Person" scope="session"/>
<jsp:useBean id="admin" class="model.Admin" scope="session"/>
<script type="text/javascript">
    function logout() {
        document.getElementById("logout").submit();
    }
</script>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo   mdui-theme-accent-deep-purple">
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
        <p class="mdui-typo-title mdui-hidden-xs clickable" onclick="logout()">退出登陆</p>
        <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white mdui-hidden-sm-up"
              mdui-tooltip="{content: '退出登陆'}" onclick="logout()">
           <i class="mdui-icon material-icons">exit_to_app</i>
        </span>
    </div>
</header>
<%
    if (admin.equals(new Admin())) {
        response.sendRedirect("adminRouter");
        return;
    }
%>

<div class="mdui-container">

    <div style="height: 24px"></div>
    <div class="mdui-row">
        <div style="padding: 8px" class="mdui-col-md-6 mdui-col-sm-12 ">
            <div class="mdui-card" onclick="window.location.assign('admin_overview.jsp')">
                <div class="mdui-card-media">
                    <img src="image/card.jpg"/>
                    <div class="mdui-card-media-covered">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">信息概览</div>
                            <div class="mdui-card-primary-subtitle">Overview</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="padding: 8px" class="mdui-col-md-6 mdui-col-sm-12">
            <div class="mdui-card" onclick="window.location.assign('admin_punchview.jsp')">
                <div class="mdui-card-media">
                    <img src="image/card.jpg"/>
                    <div class="mdui-card-media-covered">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">打卡情况</div>
                            <div class="mdui-card-primary-subtitle">Punch status</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mdui-row">
        <div style="padding: 8px" class="mdui-col-md-6 mdui-col-sm-12">
            <div class="mdui-card" onclick="window.location.assign('health_code_manager.jsp')">
                <div class="mdui-card-media">
                    <img src="image/card.jpg"/>
                    <div class="mdui-card-media-covered">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">健康码管理</div>
                            <div class="mdui-card-primary-subtitle">Health code</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="padding: 8px"  class="mdui-col-md-6 mdui-col-sm-12">
            <div class="mdui-card" onclick="window.location.assign('information_manager.jsp')">
                <div class="mdui-card-media">
                    <img src="image/card.jpg"/>
                    <div class="mdui-card-media-covered">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">信息管理</div>
                            <div class="mdui-card-primary-subtitle">information manager</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<form id="logout" method="post" action="logOut">
</form>
</body>
<script src="js/script.js"></script>
</html>