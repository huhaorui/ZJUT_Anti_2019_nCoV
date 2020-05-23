<%@ page import="conn.DatabaseProvider" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/20
  Time: 22:39
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
<script type="text/javascript">
    function check() {
        mdui.dialog({
            title: '注意，该操作不可逆',
            buttons: [
                {
                    text: '确认',
                    onClick: function () {
                        document.getElementById("form").submit()
                    }
                }, {
                    text: '取消'
                }
            ],
            history: false,
        });
    }
</script>
<jsp:useBean id="admin" class="model.Admin" scope="session"/>
<%
    String id = request.getParameter("id");
    String token = request.getParameter("token");
    Connection conn = DatabaseProvider.getConn();
    boolean permission = false;
    String collage = null, major = null, clazz = null, name = null, color = null, used = "used", type = "教师", person_id = null;
    try {
        PreparedStatement sql = conn.prepareStatement("select level from admin where id=? and password=?");
        sql.setString(1, admin.getId());
        sql.setString(2, admin.getPassword());
        ResultSet result = sql.executeQuery();
        if (result.next() && result.getInt(1) % 2 == 1) {
            permission = true;
        }

        sql = conn.prepareStatement("select * from health_code_token where uid=? and token=?");
        sql.setString(1, id);
        sql.setString(2, token);
        result = sql.executeQuery();
        if (result.next()) {
            used = result.getString("used");
            sql.close();
            result.close();
            sql = conn.prepareStatement("select * from view_teacher_student_full where id=?");
            sql.setString(1, id);
            result = sql.executeQuery();
            if (result.next()) {
                collage = result.getString("collage");
                major = result.getString("major");
                clazz = result.getString("class");
                name = result.getString("name");
                type = result.getString("type");
                person_id = result.getString("person_id");
            }
            sql.close();
            result.close();
        } else {
            response.sendRedirect("error_code.jsp");
        }
        sql = conn.prepareStatement("select color from health_info where uid=?");
        sql.setString(1, id);
        result = sql.executeQuery();
        if (result.next()) {
            color = result.getString("color");
        }
        if (!permission) {
            name = addStar(name);
            person_id = addStar(person_id);
            id = addStar(id);
        }
        sql.close();
        result.close();
        conn.close();
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    if (!used.equals("false") && permission) {

%>
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '该健康码已被使用',
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
} else if (!permission) {
%>
<script type="text/javascript">
    window.onload = function () {
        mdui.dialog({
            title: '请以管理员账号登陆',
            content: '为了保证你的安全，非管理员用户只能看见部分信息',
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
    }
%>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo  mdui-theme-accent-deep-purple">
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
<div class="mdui-col-md12 mdui-hidden-md-down" style="height: 64px">
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">

</div>
<div class="mdui-col-md-4 mdui-col-sm-12  mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">健康信息</h1>
    <table class="mdui-table mdui-table-hoverable">
        <tr>
            <td>健康码</td>
            <td style="color: <%=color%>">███████████████</td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><%=name%>
            </td>
        </tr>
        <tr>
            <td>身份证号</td>
            <td><%=person_id%>
            </td>
        </tr>
        <tr>
            <td>学号</td>
            <td><%=id%>
            </td>
        </tr>
        <tr>
            <td>学院</td>
            <td><%=collage%>
            </td>
        </tr>
        <%
            assert type != null;
            if (type.equals("学生")) {
        %>
        <tr>
            <td>专业</td>
            <td><%=major%>
            </td>
        </tr>
        <tr>
            <td>班级</td>
            <td><%=clazz%>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        if ("green".equals(color) && "false".equals(used) && permission) {
    %>
    <button class="mdui-center mdui-btn mdui-ripple  mdui-color-theme-accent"
            onclick="check()">
        确认入校
    </button>
    <form id="form" action="DestroyHealthCode" method="post">
        <input type="hidden" name="id" value="<%=id%>">
        <input type="hidden" name="token" value="<%=token%>">
    </form>
    <%
    } else if (permission) {
    %>
    <button class="mdui-center mdui-btn mdui-ripple  mdui-color-theme-accent" disabled>
        禁止入校
    </button>
    <%
    } else {
    %>
    <button class="mdui-center mdui-btn mdui-ripple  mdui-color-theme-accent"
            onclick="window.location.assign('login.jsp?user=admin')">
        管理员登陆
    </button>
    <%
        }
    %>
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script>const $$ = mdui.JQ;</script>
<script src="js/script.js"></script>
</html>
<%!
    private String addStar(String name) {
        if (name.length() == 2) {
            return name.substring(0, 1) + "*";
        }
        String p1 = name.substring(0, name.length() / 3);
        String p2 = name.substring(name.length() / 3 * 2);
        return p1 + "*".repeat(Math.max(0, (name.length() - p1.length() - p2.length()))) + p2;
    }
%>