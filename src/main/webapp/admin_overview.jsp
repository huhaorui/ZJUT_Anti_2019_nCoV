<%@ page import="model.*" %>
<%@ page import="servlet.PunchRecordData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
    @author wcf
--%>

<jsp:useBean id="admin" scope="session" class="model.Admin"/>
<%
    List<Collage> collages = PunchRecordData.availableCollage(admin);
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
    <script src="js/jquery-3.5.1.js"></script>
    <script src="js/table.js"></script>
</head>
<script type="text/javascript">
    let $ = jQuery

    class Collage {
        constructor(id, name) {
            this.id = id;
            this.name = name;
        }
    }

    const DEFAULT_COLLAGE = new Collage(-1, '未选择')
    let collages = [DEFAULT_COLLAGE]

    <%
        for (Collage collage: collages) {
    %>
    collages.push(new Collage(<%=collage.getId()%>, '<%=collage.getName()%>'))
    <%
        }
    %>

    let selected = -1
    let overviews = []
    let overview_table
    let collage_selector

    window.onload = () => {
        overview_table = new Table('over_view_table', 5)
        collage_selector = new mdui.Select('#collage_selector');
        collages.forEach((item) => {
            console.log(item)
            if (item.id === selected) {
                $('#collage_selector').append('<option selected="selected" value="' + item.id + '">' + item.name + '</option>')
            } else {
                $('#collage_selector').append('<option value="' + item.id + '">' + item.name + '</option>')
            }
        })
        collage_selector.handleUpdate()
        update(selected)
    }

    function change_collage() {
        let target = document.getElementById('collage_selector');
        let index = target.selectedIndex
        let collage = target.options[index].value
        update(collage)
    }

    function update(collage = -1, date = new Date()) {
        let data
        if (collage > 0) {
            data = {collage: collage, date: date}
        } else {
            data = {date: date}
        }

        $.ajax({
            url: 'action/punch_record',
            data: data,
            async: true, cache: false, type: 'post',
            success: (data) => {
                console.log(data)
                overview_table.removeAll()
                overview_table.addAll(eval(data))
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
        <a href="" class="mdui-typo-title" style="font-weight: inherit">学生健康信息管理系统</a>
        <div class="mdui-toolbar-spacer"></div>
    </div>
</header>
<div class="mdui-col-md-12 mdui-col-sm-12 mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">健康信息</h1>
    <p class="mdui-text-center">健康码概览</p>
    <p class="mdui-text-color-grey">筛选</p>
    <label for="collage_selector">学院</label>
    <select id="collage_selector" class="mdui-select" onchange="change_collage()"
            mdui-select="{position: 'bottom'}"></select>
    <br>
    <label for="date_selector">日期</label>
    <input id="date_selector" type="date">
    <div class="mdui-table-fluid">
        <table id="over_view_table" class="mdui-table mdui-table-hoverable " style="min-width: 1080px">
            <tr>
                <th>学院</th>
                <th>学号/工号</th>
                <th>姓名</th>
                <th>健康码颜色</th>
                <th>备注</th>
            </tr>
        </table>
    </div>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
            onclick="window.location.assign('main.jsp')" style="margin-bottom: 16px">
        回到首页
    </button>
</div>
</body>
<script src="js/script.js"></script>
</html>
