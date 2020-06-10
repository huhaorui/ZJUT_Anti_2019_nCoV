<%@ page import="model.Admin" %><%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/22
  Time: 22:57
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
<jsp:useBean id="admin" class="model.Admin" scope="session"/>
<%
    if (admin.equals(new Admin())) {
        response.sendRedirect("../login/admin");
        return;
    }
%>
<script type="text/javascript">
    function getFileName() {
        try {
            document.getElementById('file_name').innerText = document.getElementById('file').files[0].name
        } catch (e) {

        }
        if (document.getElementById("file_name").innerText !== "") {
            document.getElementById("submit").disabled = false
        }
    }

    function getFile() {
        document.getElementById('file').click()
    }

    function check() {
        mdui.dialog({
            title: '警告',
            content: '此操作会重置所有应用数据，你确定要这么做吗？',
            buttons: [
                {
                    text: '我再想想',
                    onClick: function () {
                        return false;
                    }
                },
                {
                    text: '确认!',
                    onClick: function () {
                        mdui.prompt_2('请再次输入你的密码', '校验',
                            function (value) {
                                const xmlHttp = new XMLHttpRequest();
                                xmlHttp.onreadystatechange = function () {
                                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                                        document.getElementsByName("id")[0].value = '${admin.id}';
                                        document.getElementsByName("password")[0].value = md5(value + "wcfnb");
                                        mdui.prompt('请输入邮件验证码', '校验',
                                            function (value) {
                                                const xmlHttp = new XMLHttpRequest();
                                                xmlHttp.onreadystatechange = function () {
                                                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                                                        document.getElementsByName("captcha")[0].value = value;
                                                        document.getElementById("form").submit()
                                                    } else if (xmlHttp.readyState === 4 && xmlHttp.status === 403) {
                                                        mdui.dialog({
                                                            title: '你的验证码输入有误',
                                                            buttons: [
                                                                {
                                                                    text: '确认',
                                                                }
                                                            ],
                                                            history: false,
                                                        });
                                                    }
                                                }
                                                xmlHttp.open("POST", "../captcha/check", true);
                                                xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                xmlHttp.send("captcha=" + value);
                                            }
                                        ), function (value) {
                                            return false
                                        }, {
                                            history: false
                                        }
                                    } else if (xmlHttp.readyState === 4 && xmlHttp.status === 403) {
                                        mdui.dialog({
                                            title: '密码错误',
                                            buttons: [
                                                {
                                                    text: '确认',
                                                }
                                            ],
                                            history: false,
                                        });
                                    }
                                }
                                xmlHttp.open("POST", "../captcha/get", true);
                                xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xmlHttp.send("id=${admin.id}&password=" + md5(value + "wcfnb") + "&email=${admin.email}");
                            },
                            function (value) {
                                return false;
                            }, {
                                type: 'password',
                                history: false,
                                confirmText: '确定',
                                cancelText: '取消'
                            },
                        );
                    }
                }
            ],
            history: false,
        });

    }

</script>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo  mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
       <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"
             onclick="window.location.assign('../admin/router')">
            <i class="mdui-icon material-icons">home</i>
        </span>
        <a href="" class="mdui-typo-headline mdui-hidden-xs"
           style="font-weight: inherit">浙江工业大学</a>
        <a href="" class="mdui-typo-title " style="font-weight: inherit">学生健康信息管理系统</a>
        <div class="mdui-toolbar-spacer"></div>

    </div>
</header>
<div class="mdui-col-md12" style="height: 96px">
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
<div class="mdui-col-md-4 mdui-col-sm-12  mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">导入信息</h1>
    <form action="database" method="post" id="form" enctype="multipart/form-data">
        <input type="file" name="data" id="file" class="input_file" accept=".xls, .xlsx"
               onchange="getFileName();"/>
        <input type="hidden" name="captcha">
        <input type="hidden" name="id">
        <input type="hidden" name="password">
    </form>
    <p class="mdui-center mdui-text-color-theme mdui-text-center mdui-typo" id="file_name">
        你还没有选择文件
    </p>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center" onclick="getFile()">
        &nbsp;&nbsp;&nbsp;选择文件&nbsp;&nbsp;&nbsp;
    </button>
    <br>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
            onclick="check()" disabled="disabled" id="submit">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </button>
    <br>
    <br>
    <br>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-center"
            onclick="window.location.assign('../../files/demo.xlsx')">
        下载导入模板
    </button>
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script src="../../js/script.js"></script>
</html>
