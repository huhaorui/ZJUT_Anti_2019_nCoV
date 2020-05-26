<%--
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
    <link rel="stylesheet" type="text/css" href="css/mdui.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/md5.min.js"></script>
    <script src="js/mdui.min.js"></script>
</head>
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

</script>
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
<div class="mdui-col-md12" style="height: 96px">
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">

</div>
<div class="mdui-col-md-4 mdui-col-sm-12  mdui-typo">
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">导入信息</h1>
    <form action="uploadDatabase" method="post" id="form" class="mdui-center" enctype="multipart/form-data">
        <input type="file" name="file" id="file" class="input_file" accept=".xls, .xlsx"
               onchange="getFileName();"/>
    </form>
    <p class="mdui-center mdui-text-color-theme mdui-text-center mdui-typo" id="file_name">
        你还没有选择文件
    </p>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center" onclick="getFile()">
        &nbsp;&nbsp;&nbsp;选择文件&nbsp;&nbsp;&nbsp;
    </button>
    <br>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-center"
            onclick="document.getElementById('form').submit()" disabled="disabled" id="submit">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;上传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </button>
    <br>
    <br>
    <br>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-center"
            onclick="window.location.assign('files/demo.xlsx')">
        下载导入模板
    </button>
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script>const $$ = mdui.JQ;</script>
<script src="js/script.js"></script>
</html>
