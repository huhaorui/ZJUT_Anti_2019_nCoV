<%@ page import="model.Person" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="conn.DatabaseProvider" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/20
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta name="theme-color" content="#3f51b5">
    <title>浙江工业大学</title>
    <link rel="stylesheet" type="text/css" href="../../css/mdui.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/md5.min.js"></script>
    <script src="../../js/mdui.min.js"></script>
</head>
<jsp:useBean id="person" class="model.Person" scope="session"/>
<%
    if (person.equals(new Person())) {
        response.sendRedirect("../login/student");
        return;
    }
    String id = person.getUid();
    String token = null, used = null;
    Connection conn = DatabaseProvider.getConn();
    Date date = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm");
    String time = (formatter.format(date));
    String color = null;
    try {
        PreparedStatement sql = conn.prepareStatement("select token,used from health_code_token where uid=?");
        sql.setString(1, id);
        ResultSet result = sql.executeQuery();
        if (result.next()) {
            token = result.getString(1);
            used = result.getString(2);
            if (used.equals("true")) {
                conn.close();
                response.sendRedirect("../student/main?error=used");
                return;
            }
        } else {
            conn.close();
            response.sendRedirect("../healthcode/get");
            return;
        }
        result.close();
        sql.close();
        sql = conn.prepareStatement("select color from health_info where uid=?");
        sql.setString(1, id);
        result = sql.executeQuery();
        if (result.next()) {
            color = result.getString(1);
        } else {
            return;
        }
        result.close();
        sql.close();
        switch (color) {
            case "red":
                color = "f08080";
                break;
            case "yellow":
                color = "fca311";
                break;
            case "green":
                color = "02c39a";
                break;
        }
        conn.close();
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    String text = "https://javaweb.huhaorui.com" + request.getContextPath() + "/action/healthcode/check?id=" + id + "&token=" + token;
    text = text + "&black=" + color;
%>

<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo  mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
       <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"
             onclick="window.location.assign('../student/main')">
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
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">健康码</h1>
    <p class="mdui-text-center mdui-text-color-theme" style="font-size: large">
        生成时间:<%=time%>
    </p>
    <img class="mdui-center" style="max-width: 80%" src="../qrcode/get?text=<%=text%>" alt="health code">
    <p class="mdui-text-center mdui-text-color-theme" style="font-size: large">
        姓名: ${person.name}
    </p>
    <p class="mdui-text-center mdui-text-color-theme" style="font-size: large">
        学号: ${person.uid}
    </p>
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script src="../../js/script.js"></script>
</html>
