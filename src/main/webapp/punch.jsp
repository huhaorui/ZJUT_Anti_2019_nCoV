<%--
  Created by IntelliJ IDEA.
  User: HHR
  Date: 2020/5/19
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <meta name="theme-color" content="#2196f3">
    <title>浙江工业大学</title>
    <link rel="stylesheet" type="text/css" href="css/mdui.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/md5.min.js"></script>
    <script src="js/mdui.min.js"></script>
</head>
<jsp:useBean id="person" class="model.Person" scope="session"/>
<script type="text/javascript">
    window.onload = function () {
        checkIfEmpty();
    }

    function submit_form() {
        document.getElementById("form").submit()
    }

    function a() {
        alert("99")
    }

    function check() {
        if (document.getElementById("promise").checked !== true) {
            mdui.dialog({
                title: '请承诺信息属实',
                buttons: [
                    {
                        text: '确认'
                    }
                ],
                history: false,
            });
            return false
        }
        mdui.dialog({
            title: '是否确认提交？',
            buttons: [
                {
                    text: '确认',
                    onClick: function (inst) {
                        submit_form()
                    }
                }, {
                    text: '取消'
                }
            ],
            history: false,
        });
        return false
    }
</script>
<body class="mdui-appbar-with-toolbar  mdui-loaded mdui-theme-primary-indigo  mdui-theme-accent-deep-purple">
<header class="mdui-appbar mdui-appbar-fixed" id="header">
    <div class="mdui-toolbar mdui-color-theme">
       <span class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"
             onclick="window.location.assign('index.jsp')">
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
    <h1 class="mdui-center mdui-text-color-theme mdui-text-center">健康申报</h1>
    <form action="uploadPunch" id="form" method="post">
        <div class="mdui-textfield mdui-textfield-floating-label">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">姓名</label>
            <input class="mdui-textfield-input" type="text" disabled
                   value="<jsp:getProperty name="person" property="name"/>"/>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">身份证号</label>
            <input class="mdui-textfield-input" type="text" disabled
                   value="<jsp:getProperty name="person" property="personId"/>"/>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">学号/工号</label>
            <input class="mdui-textfield-input" type="text" disabled
                   value="<jsp:getProperty name="person" property="uid"/>"/>
        </div>
        <input type="hidden" name="name" value="<jsp:getProperty name="person" property="name"/>">
        <input type="hidden" name="id" value="<jsp:getProperty name="person" property="uid"/>">
        <input type="hidden" name="person_id" value="<jsp:getProperty name="person" property="personId"/>">
        <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-not-empty">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">我在14天内去过湖北等其他危险地区</label>
            <label class="mdui-radio" style="visibility: hidden">
                <input type="radio"/>
                <i class="mdui-radio-icon"></i>
                我
            </label>
            <label class="mdui-radio">
                <input type="radio" name="danger14" value="true"/>
                <i class="mdui-radio-icon"></i>
                是
            </label>
            &nbsp;&nbsp;
            <label class="mdui-radio">
                <input type="radio" name="danger14" checked value="false"/>
                <i class="mdui-radio-icon"></i>
                否
            </label>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-not-empty">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">我在14天内出过国</label>
            <label class="mdui-radio" style="visibility: hidden">
                <input type="radio"/>
                <i class="mdui-radio-icon"></i>
                我
            </label>
            <label class="mdui-radio">
                <input type="radio" name="aboard14" value="true"/>
                <i class="mdui-radio-icon"></i>
                是
            </label>
            &nbsp;&nbsp;
            <label class="mdui-radio">
                <input type="radio" name="aboard14" checked value="false"/>
                <i class="mdui-radio-icon"></i>
                否
            </label>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-not-empty">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">我在14天接触过新冠确诊病人或疑似病人</label>
            <label class="mdui-radio" style="visibility: hidden">
                <input type="radio"/>
                <i class="mdui-radio-icon"></i>
                我
            </label>
            <label class="mdui-radio">
                <input type="radio" name="touch14" value="true"/>
                <i class="mdui-radio-icon"></i>
                是
            </label>
            &nbsp;&nbsp;
            <label class="mdui-radio">
                <input type="radio" name="touch14" checked value="false"/>
                <i class="mdui-radio-icon"></i>
                否
            </label>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-not-empty">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">我被卫生部门确认为新冠肺炎确诊病例或疑似病例</label>
            <label class="mdui-radio" style="visibility: hidden">
                <input type="radio"/>
                <i class="mdui-radio-icon"></i>
                我
            </label>
            <label class="mdui-radio">
                <input type="radio" name="ill14" value="true"/>
                <i class="mdui-radio-icon"></i>
                是
            </label>
            &nbsp;&nbsp;
            <label class="mdui-radio">
                <input type="radio" name="ill14" checked value="false"/>
                <i class="mdui-radio-icon"></i>
                否
            </label>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-not-empty">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">我可能存在健康问题</label>
            <label class="mdui-radio" style="visibility: hidden">
                <input type="radio"/>
                <i class="mdui-radio-icon"></i>
                我
            </label>
            <label class="mdui-radio">
                <input type="radio" name="problem" value="true"
                       onclick="document.getElementById('health_problem').style.display='block'"/>
                <i class="mdui-radio-icon"></i>
                是
            </label>
            &nbsp;&nbsp;
            <label class="mdui-radio">
                <input type="radio" name="problem" checked value="false"
                       onclick="document.getElementById('health_problem').style.display='none'"/>
                <i class="mdui-radio-icon"></i>
                否
            </label>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-not-empty" id="health_problem"
             style="display: none ">
            <i class="mdui-icon material-icons" style="display: none">account_circle</i>
            <label class="mdui-textfield-label">我可能有这些健康问题：</label>
            <label class="mdui-radio" style="visibility: hidden">
                <input type="radio"/>
                <i class="mdui-radio-icon"></i>
                我
            </label>
            <label class="mdui-checkbox">
                <input type="checkbox" name="status" value="发烧"/>
                <i class="mdui-checkbox-icon"></i>
                发烧&nbsp;
            </label>
            <label class="mdui-checkbox">
                <input type="checkbox" name="status" value="乏力"/>
                <i class="mdui-checkbox-icon"></i>
                乏力&nbsp;
            </label>
            <label class="mdui-checkbox">
                <input type="checkbox" name="status" value="干咳"/>
                <i class="mdui-checkbox-icon"></i>
                干咳&nbsp;
            </label>
            <br>
            <label class="mdui-radio" style="visibility: hidden">
                <input type="radio"/>
                <i class="mdui-radio-icon"></i>
                我
            </label>
            <label class="mdui-checkbox">
                <input type="checkbox" name="status" value="鼻塞"/>
                <i class="mdui-checkbox-icon"></i>
                鼻塞&nbsp;
            </label>
            <label class="mdui-checkbox">
                <input type="checkbox" name="status" value="咽痛"/>
                <i class="mdui-checkbox-icon"></i>
                咽痛&nbsp;
            </label>
            <label class="mdui-checkbox">
                <input type="checkbox" name="status" value="流涕"/>
                <i class="mdui-checkbox-icon"></i>
                流涕&nbsp;
            </label>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label mdui-textfield-not-empty">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">我承诺填报信息属实</label>
            <label class="mdui-radio" style="visibility: hidden">
                <input type="radio"/>
                <i class="mdui-radio-icon"></i>
                我
            </label>
            <label class="mdui-radio">
                <input type="radio" name="promise" id="promise" value="true"/>
                <i class="mdui-radio-icon"></i>
                是
            </label>
            &nbsp;&nbsp;
            <label class="mdui-radio">
                <input type="radio" name="promise" checked value="false"/>
                <i class="mdui-radio-icon"></i>
                否
            </label>
        </div>
        <button class="mdui-btn mdui-ripple mdui-center mdui-color-theme-accent" onclick="return check()">
            确定提交
        </button>
    </form>
</div>
<div class="mdui-col-md-4 mdui-col-sm-12">
</div>
</body>
<script>const $$ = mdui.JQ;</script>
<script src="js/script.js"></script>
</html>

