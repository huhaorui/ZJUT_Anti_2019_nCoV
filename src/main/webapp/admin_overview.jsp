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
    if (admin.equals(new Admin())) {
        response.sendRedirect("../login/admin");
        return;
    }
    List<Collage> collages = PunchRecordData.availableCollage(admin);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta name="theme-color" content="#3f51b5">
    <title>浙江工业大学</title>
    <link rel="stylesheet" type="text/css" href="../../css/mdui.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/mdui.min.js"></script>
    <script src="../../js/jquery-3.5.1.js"></script>
    <script src="../../js/table.js"></script>
</head>
<script type="text/javascript">
    let $ = jQuery

    class Collage {
        constructor(id, name) {
            this.id = id;
            this.name = name;
        }
    }

    const DEFAULT_COLLAGE = new Collage(-1, '全部')
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

    let filter = {
        red: true,
        yellow: true,
        green: true,
        gray: true,
        lightgray: true,
        aquamarine: true,
        wheat: true
    }

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

    function _filter() {
        overview_table.filter_color(overviews, filter)
    }

    function change_collage() {
        let target = document.getElementById('collage_selector');
        let index = target.selectedIndex
        selected = target.options[index].value
        update()
    }

    function export_data() {
        if (selected > 0) {
            window.location.assign('overview/export?collage=' + selected)
        } else {
            window.location.assign('overview/export')
        }
    }

    function update() {
        let data
        if (selected > 0) {
            data = {collage: selected}
        } else {
            data = {}
        }

        $.ajax({
            url: 'overview',
            data: data,
            async: true, cache: false, type: 'post',
            success: (data) => {
                console.log(data)
                overviews = eval(data)

                overview_table.filter_color(overviews, filter)
            }
        })
    }

</script>
<body class="mdui-appbar-with-toolbar mdui-loaded mdui-theme-primary-indigo mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
    <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"
          onclick="window.location.assign('router')">
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
    <div class="mdui-table-fluid">
        <table id="over_view_table" class="mdui-table mdui-table-hoverable " style="min-width: 1080px">
            <tr>
                <th id="college">学院&nbsp;<i class="mdui-icon material-icons">filter_list</i></th>
                <th>学号/工号</th>
                <th>姓名</th>
                <th id="color">健康码颜色&nbsp;<i class="mdui-icon material-icons">filter_list</i></th>
                <th>备注</th>
            </tr>
        </table>
    </div>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-center"
            onclick="export_data()" style="margin-bottom: 16px">
        导出数据
    </button>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
            onclick="window.location.assign('router')" style="margin-bottom: 16px">
        回到首页
    </button>
</div>
<div class="mdui-dialog" id="dialog" style="min-height: 40%">
    <div class="mdui-container">
        <div style="height: 32px"></div>
        <h2 class="mdui-text-center mdui-text-color-theme-accent">
            筛选信息
        </h2>
        <div class="mdui-col-md-3">

        </div>
        <div class="mdui-col-md-6">
            <div style="display: block">
                <label for="collage_selector">学院</label>
                <select id="collage_selector" class="mdui-select" onchange="change_collage()"
                        mdui-select="{position: 'bottom'}"></select>
            </div>
            <div style="display: block;margin-top: 16px">
                <div class="mdui-container">
                    <div class="mdui-col-md-6">
                        <label class="mdui-checkbox">
                            <input checked id="red_filter"
                                   onchange="filter.red = document.getElementById('red_filter').checked;_filter();"
                                   type="checkbox"/>
                            <i class="mdui-checkbox-icon"></i>
                            红码
                        </label>
                    </div>
                    <div class="mdui-col-md-6">
                        <label class="mdui-checkbox">
                            <input id="yellow_filter" checked
                                   onchange="filter.yellow = document.getElementById('yellow_filter').checked;_filter();"
                                   type="checkbox"/>
                            <i class="mdui-checkbox-icon"></i>
                            黄码
                        </label>
                    </div>
                </div>
            </div>
            <div style="display: block">
                <div class="mdui-container">
                    <div class="mdui-col-md-6">
                        <label class="mdui-checkbox">
                            <input id="green_filter" checked
                                   onchange="filter.green = document.getElementById('green_filter').checked;_filter();"
                                   type="checkbox"/>
                            <i class="mdui-checkbox-icon"></i>
                            绿码
                        </label>
                    </div>
                    <div class="mdui-col-md-6">
                        <label class="mdui-checkbox">
                            <input id="lightgray_filter" checked
                                   onchange="filter.lightgray = document.getElementById('lightgray_filter').checked;_filter();"
                                   type="checkbox"/>
                            <i class="mdui-checkbox-icon"></i>
                            未申报
                        </label>
                    </div>
                </div>
            </div>
            <button class="mdui-btn mdui-color-theme-accent mdui-center" id="close_dialog"
                    style="margin-top: 16px;margin-bottom: 16px">
                确定
            </button>
        </div>
        <div class="mdui-col-md-3">

        </div>
    </div>
</div>
<script type="text/javascript">
    const inst = new mdui.Dialog('#dialog');
    document.getElementById('college').addEventListener('click', function () {
        inst.open();
    });
    document.getElementById('color').addEventListener('click', function () {
        inst.open();
    });
    document.getElementById('close_dialog').addEventListener('click', function () {
        inst.close();
    })
    const dialog = document.getElementById('dialog');

    dialog.addEventListener('open.mdui.dialog', function () {
        console.log('open');
    });

    dialog.addEventListener('opened.mdui.dialog', function () {
        console.log('opened');
    });

    dialog.addEventListener('close.mdui.dialog', function () {
        console.log('close');
    });

    dialog.addEventListener('closed.mdui.dialog', function () {
        console.log('closed');
    });

    dialog.addEventListener('cancel.mdui.dialog', function () {
        console.log('cancel');
    });

    dialog.addEventListener('confirm.mdui.dialog', function () {
        console.log('confirm');
    });

</script>
</body>
<script src="../../js/script.js"></script>
</html>
