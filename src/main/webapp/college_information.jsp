<%@ page import="kotlin.Pair" %>
<%@ page import="model.Major" %>
<%@ page import="model.SQL" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta name="theme-color" content="#3f51b5">
    <title>浙江工业大学</title>
    <link rel="stylesheet" type="text/css" href="css/mdui.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/mdui.min.js"></script>
</head>
<script type="text/javascript">
    window.onload = () => {

    }
</script>
<body class="mdui-appbar-with-toolbar mdui-loaded mdui-theme-primary-indigo mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
    <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"
          onclick="window.location.assign('main.jsp')">
      <i class="mdui-icon material-icons">home</i>
    </span>
        <a href="" class="mdui-typo-headline mdui-hidden-xs"
           style="font-weight: inherit">浙江工业大学</a>
        <a href="" class="mdui-typo-title" style="font-weight: inherit">学生健康信息管理系统</a>
        <div class="mdui-toolbar-spacer"></div>
    </div>
</header>
<%
    SQL sql = new SQL();
    int collegeId = -1;
    try {
        collegeId = Integer.parseInt(request.getParameter("collage"));
    } catch (Exception ignore) {
    }
    
%>
<div class="mdui-col-md-12 mdui-col-sm-12 mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">学院信息</h1>
    <div class="mdui-table-fluid">
        <table id="over_view_table" class="mdui-table mdui-table-hoverable">
            <tr>
                <th id="college">学院</th>
                <th>学号/工号</th>
                <th>姓名</th>
                <th>备注</th>
            </tr>
        </table>
    </div>
</div>
</body>
<script src="js/script.js"></script>
</html>
