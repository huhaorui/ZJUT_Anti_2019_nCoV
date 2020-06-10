<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    @author wcf
--%>
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
</head>
<script type="text/javascript">
    $ = jQuery

    class Table {
        constructor(id, col) {
            this.id = id
            this.col = col
        }

        removeAll() {
            $('#' + this.id + ' tr:not(:first)').remove();
            mdui.updateTables()
        }

        addAll(items) {
            items.forEach((item) => {
                let tr = document.createElement('tr')
                this.col.forEach(key => {
                    let value = item[key]
                    let td = document.createElement('td')
                    td.innerHTML = value
                    tr.appendChild(td)
                })
                $('#' + this.id).append(tr)
            })

            mdui.updateTables()
        }
    }

    class Selector {
        constructor(id) {
            this.id = id
            this.inst = new mdui.Select('#' + this.id)
            this.data = []
        }

        removeAll() {
            // $('#' + this.id + ' option:not(:first)').remove();
            $('#' + this.id).empty()
            this.inst.handleUpdate()
        }

        init() {
            $('#' + this.id).append('<option selected="selected" value="-1">请选择</option>')
            this.data.forEach((item) => {
                $('#' + this.id).append('<option value="' + item.id + '">' + item.name + '</option>')
            })
            this.inst.handleUpdate()
        }

        curr() {
            let target = document.getElementById(this.id)
            let index = target.selectedIndex
            return target.options[index].value
        }

        update(data) {
            this.data = data
            this.removeAll()
            this.init()
        }
    }

    let select_collage
    let select_major
    let select_class

    let table_student
    let table_teacher

    window.onload = () => {
        table_student = new Table('table_students', ['id', 'name', 'personId'])
        table_teacher = new Table('table_teachers', ['id', 'name', 'personId'])
        select_collage = new Selector('collage_selector')
        select_collage.init()
        select_major = new Selector('major_selector')
        select_major.init()
        select_class = new Selector('class_selector')
        select_class.init()
        get_collage()
    }

    function get_collage() {
        collage_selector.selected = -1
        $.ajax({
            url: '../admin/view/collage',
            async: true, cache: false, type: 'post',
            success: (data) => {
                console.log(data)
                select_collage.update(data)
                get_major()
            }
        })
    }

    function get_major() {
        get_teacher()
        select_major.selected = -1
        $.ajax({
            url: '../admin/view/major', data: {collage: select_collage.curr()},
            async: true, cache: false, type: 'post',
            success: (data) => {
                console.log(data)
                select_major.update(data)
                get_clazz()
            }
        })
    }

    function get_clazz() {
        select_class.selected = -1
        $.ajax({
            url: '../admin/view/class', data: {major: select_major.curr()},
            async: true, cache: false, type: 'post',
            success: (data) => {
                console.log(data)
                select_class.update(data)
                get_student()
            }
        })
    }

    function get_student() {
        $.ajax({
            url: '../admin/view/student', data: {class: select_class.curr()},
            async: true, cache: false, type: 'post',
            success: (data) => {
                console.log(data)
                table_student.removeAll()
                table_student.addAll(data)
            }
        })
    }

    function get_teacher() {
        $.ajax({
            url: '../admin/view/teacher', data: {collage: select_collage.curr()},
            async: true, cache: false, type: 'post',
            success: (data) => {
                console.log(data)
                table_teacher.removeAll()
                table_teacher.addAll(data)
            }
        })
    }
</script>
<body class="mdui-appbar-with-toolbar mdui-loaded mdui-theme-primary-indigo mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
    <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"
          onclick="window.location.assign('../admin/router')">
      <i class="mdui-icon material-icons">home</i>
    </span>
        <a href="" class="mdui-typo-headline mdui-hidden-xs"
           style="font-weight: inherit">浙江工业大学</a>
        <a href="" class="mdui-typo-title" style="font-weight: inherit">学生健康信息管理系统</a>
        <div class="mdui-toolbar-spacer"></div>
    </div>
</header>
<div class="mdui-col-md-2 mdui-hidden-sm-down"></div>
<div class="mdui-col-md-8 mdui-col-sm-12 mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">学院信息</h1>

    <label for="collage_selector">学院</label>
    <select id="collage_selector" class="mdui-select" onchange="get_major()"
            mdui-select="{position: 'bottom'}"></select>

    <label for="major_selector">专业</label>
    <select id="major_selector" class="mdui-select" onchange="get_clazz()"
            mdui-select="{position: 'bottom'}"></select>

    <label for="class_selector">班级</label>
    <select id="class_selector" class="mdui-select" onchange="get_student()"
            mdui-select="{position: 'bottom'}"></select>

    <div class="mdui-table-fluid">
        <table id="table_teachers" class="mdui-table mdui-table-hoverable">
            <tr>
                <th>工号</th>
                <th>姓名</th>
                <th>身份证</th>
            </tr>
        </table>
    </div>

    <div class="mdui-table-fluid">
        <table id="table_students" class="mdui-table mdui-table-hoverable">
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>身份证</th>
            </tr>
        </table>
    </div>
</div>
<div class="mdui-col-md-2 mdui-hidden-sm-down"></div>
</body>
<script src="../../js/script.js"></script>
</html>
