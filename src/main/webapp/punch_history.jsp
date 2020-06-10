<%@ page import="java.sql.Connection" %>
<%@ page import="conn.DatabaseProvider" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.PunchRecord" %>
<%@ page import="model.Record" %>
<%@ page import="model.Person" %><%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/30
  Time: 22:07
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
    Connection conn = DatabaseProvider.getConn();
    ArrayList<Record> record = new ArrayList<>();
    String tip = "";
    try {
        PreparedStatement sql = conn.prepareStatement("select * from punch_record where uid=? order by date desc");
        sql.setString(1, person.getUid());
        ResultSet result = sql.executeQuery();
        while (result.next()) {
            record.add(new Record(result.getString("uid"), result.getDate("date"), result.getTime("time"), result.getInt("status"), result.getString("color")));
        }
        sql = conn.prepareStatement("select color from health_info where uid=?");
        sql.setString(1, person.getUid());
        result = sql.executeQuery();
        if (result.next()) {
            switch (result.getString("color")) {
                case "green": {
                    tip = "";
                    break;
                }
                case "yellow": {
                    tip = "你的健康码还是黄色的，连续完成七天健康上报，再来看看吧。";
                    break;
                }
                case "red": {
                    tip = "你的健康码还是红色的，连续完成14天健康上报，再来看看吧。";
                    break;
                }
            }
        } else {
            tip = "先去完成健康上报吧";
        }
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
%>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo  mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
       <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"
             onclick="window.location.assign('main')">
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
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">健康信息</h1>
    <p class="mdui-text-center"><%=tip%>
    </p>
    <table class="mdui-table mdui-table-hoverable">
        <tr>
            <td>日期</td>
            <td>时间</td>
            <td>健康码颜色</td>
        </tr>
        <%
            for (Record r : record) {
        %>
        <tr>
            <td><%=r.getDate()%>
            </td>
            <td>
                <%=r.getTime()%>
            </td>
            <td style="color: <%=r.getColor()%>">████████</td>
        </tr>
        <%
            }
            if (record.isEmpty()) {
        %>
        <td colspan="3">你还没有打卡记录哦</td>
        <%
            }
        %>
    </table>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
            onclick="window.location.assign('main')">
        回到首页
    </button>
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script>const $$ = mdui.JQ;</script>
<script src="../../js/script.js"></script>
</html>