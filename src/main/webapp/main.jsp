<%@ page import="model.Person" %><%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/18
  Time: 16:14
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
<jsp:useBean id="person" class="model.Person" scope="session"/>
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
        <p class="mdui-typo-title mdui-hidden-xs" onclick="logout()">退出登陆</p>
        <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white mdui-hidden-sm-up"
              mdui-tooltip="{content: '退出登陆'}" onclick="logout()">
           <i class="mdui-icon material-icons">exit_to_app</i>
        </span>
    </div>
</header>
<script type="text/javascript">
    function logout() {
        document.getElementById("logout").submit();
    }
</script>
<%
    if (person.equals(new Person())) {
        response.sendRedirect("index.jsp");
    }
    if (request.getParameter("error") != null && request.getParameter("error").equals("punched")) {
%>
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '你已经完成申报了',
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
} else if (request.getParameter("error") != null && request.getParameter("error").equals("noPunched")) {
%>
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '请先完成健康打卡',
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
} else if (request.getParameter("error") != null && request.getParameter("error").equals("got")) {
%>
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '你已经拥有健康码了',
            buttons: [
                {
                    text: '确认',
                    onClick: function (inst) {
                        window.location.assign("view_health_code.jsp")
                    }
                }
            ],
            history: false,
        });
    }
</script>
<%
} else if (request.getParameter("ok") != null && request.getParameter("ok").equals("punch")) {
%>
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '信息填报成功',
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
} else if (request.getParameter("error") != null && request.getParameter("error").equals("used")) {
%>
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '你的健康码已被使用',
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
        mdui.snackbar({
            message: "欢迎你, <jsp:getProperty name="person" property="name"/>"
        });
    }
</script>
<%
    }
%>
<div class="mdui-container">

    <div style="height: 24px"></div>
    <div class="mdui-row">
        <div class="mdui-col-md-6 mdui-col-sm-12 ">
            <div class="mdui-card" onclick="window.location.assign('punch.jsp')">
                <div class="mdui-card-media">
                    <img src="image/card.jpg"/>
                    <div class="mdui-card-media-covered">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">健康打卡</div>
                            <div class="mdui-card-primary-subtitle">Health Punch</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mdui-hidden-sm-up" style="height: 16px"></div>

        <div class="mdui-col-md-6 mdui-col-sm-12">
            <div class="mdui-card" onclick="window.location.assign('get_health_code.jsp')">
                <div class="mdui-card-media">
                    <img src="image/card.jpg"/>
                    <div class="mdui-card-media-covered">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">健康码申领</div>
                            <div class="mdui-card-primary-subtitle">Get health code</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="height: 16px"></div>
    <div class="mdui-row">
        <div class="mdui-col-md-6 mdui-col-sm-12">
            <div class="mdui-card" onclick="window.location.assign('view_health_code.jsp')">
                <div class="mdui-card-media">
                    <img src="image/card.jpg"/>
                    <div class="mdui-card-media-covered">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">健康码查看</div>
                            <div class="mdui-card-primary-subtitle">View health code</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mdui-hidden-sm-up" style="height: 16px"></div>

        <div class="mdui-col-md-6 mdui-col-sm-12">
            <div class="mdui-card" onclick="window.location.assign('punch_history.jsp')">
                <div class="mdui-card-media">
                    <img src="image/card.jpg"/>
                    <div class="mdui-card-media-covered">
                        <div class="mdui-card-primary">
                            <div class="mdui-card-primary-title">打卡历史</div>
                            <div class="mdui-card-primary-subtitle">Punch history</div>
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
<script>const $$ = mdui.JQ;</script>
<script src="js/script.js"></script>
</html>