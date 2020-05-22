<%@ page import="model.Person" %>
<%@ page import="conn.DatabaseProvider" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/20
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="person" class="model.Person" scope="session"/>
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
    </div>
</header>
<%
    if (person.equals(new Person())) {
        response.sendRedirect("main.jsp");
    }
    Connection conn = DatabaseProvider.getConn();
    try {
        PreparedStatement sql = conn.prepareStatement("select * from health_info where uid=?");
        sql.setString(1, person.getUid());
        ResultSet result = sql.executeQuery();
        if (!result.next()) {
            response.sendRedirect("main.jsp?error=noPunched");
        }
        sql.close();
        result.close();
        sql = conn.prepareStatement("select * from health_code_token where uid=?");
        sql.setString(1, person.getUid());
        result = sql.executeQuery();
        if (result.next()) {
            response.sendRedirect("main.jsp?error=got");
            return;
        }
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

%>
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '你确定要申领健康码嘛？',
            buttons: [
                {
                    text: '取消',
                    onClick: function (inst) {
                        window.location.assign("main.jsp")
                    }
                },
                {
                    text: '确认',
                    onClick: function (inst) {
                        document.getElementById("form").submit()
                    }
                }
            ],
            history: false,
        });
    }
</script>
<form action="getHealthCode" method="post" id="form">
    <input type="hidden" name="name" value="${person.name}">
    <input type="hidden" name="id" value="${person.uid}">
    <input type="hidden" name="person_id" value="${person.personId}">
</form>
</body>
</html>
