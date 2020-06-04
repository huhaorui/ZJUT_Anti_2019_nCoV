<%@ page import="servlet.PunchRecordData" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Collage" %>
<%@ page import="model.PunchRecord" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" scope="session" type="model.Admin"/>
<%List<PunchRecordData.OverView> overViews = PunchRecordData.overViewDataByAdmin(admin, null);%>
<%List<Collage> collages = PunchRecordData.availableCollage(admin);%>
<%
    var target = request.getParameter("collage");

    if (target == null) {

    } else {

    }
%>
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
    let $$ = mdui.JQ
    window.onload = () => {

    }

    class Collage {
        constructor(id, name) {
            this.id = id;
            this.name = name;
        }
    }

    function update(collage) {
        $.ajax({
            url: 'action/punch_record',
            data: {
                collage: collage
            },
            async: true, cache: false, type: 'post',
            success: (data) => {
                console.log(data)
                let table = document.getElementById('over_view_table')

            }
        })
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
        <a href="" class="mdui-typo-title " style="font-weight: inherit">学生健康信息管理系统</a>
        <div class="mdui-toolbar-spacer"></div>
    </div>
</header>
<div class="mdui-col-md-3 mdui-col-sm-12"></div>
<div class="mdui-col-md-6 mdui-col-sm-12 mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">健康信息</h1>
    <p class="mdui-text-center">打卡记录概览</p>
    <p class="mdui-text-color-grey">筛选</p>
    <label for="collage_selector">学院</label>
    <select id="collage_selector" class="mdui-select" mdui-select="{position: 'bottom'}">
        <%
            for (Collage collage : collages) {
        %>
        <option id="<%=collage.getId()%>"><%=collage.getName()%>
        </option>
        <%
            }
        %>
    </select>
    <br>
    <label for="date_selector">日期</label>
    <input id="date_selector" type="date" class="mdui-select" mdui-select="{position: 'bottom'}">
    <table id="over_view_table" class="mdui-table mdui-table-hoverable mdui-table-fluid">
        <tr>
            <th>学院</th>
            <th>学号/工号</th>
            <th>姓名</th>
            <th>打卡时间</th>
            <th>联系电话</th>
            <th>打卡状况</th>
        </tr>
    </table>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
            onclick="window.location.assign('main.jsp')">
        回到首页
    </button>
</div>
<div class="mdui-col-md-3 mdui-col-sm-12"></div>
</body>
<script src="js/script.js"></script>
</html>
