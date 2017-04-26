<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!DOCTYPE html>
<html lang="en">
<head>
<!--浏览器兼容性设置-->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>学生宿舍管理系统</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="assets/css/bootstrap.css" />
<link rel="stylesheet"
	href="components/font-awesome/css/font-awesome.css" />

<!-- ace styles -->
<link rel="stylesheet" href="assets/css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.css" class="ace-main-stylesheet"/>
    <![endif]--
    <link rel="stylesheet" href="assets/css/ace-skins.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.css"/>
    <![endif]-->
<link rel="stylesheet" href="assets/css/ths-menu.css" />

<!-- 自己写的CSS，请放在这里 -->
<style type="text/css">
</style>

<!-- ace settings handler -->
<script src="assets/js/ace-extra.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
    <script src="/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<form method="POST"  enctype="multipart/form-data" action="testExcell.do" name="test" id="test">
		<div class="col-sm-3">
			<!-- #section:custom/file-input -->
			<!-- <label class="ace-file-input">  -->
			<input type="file"id="stuExcell" name="stuExcell"> 
				<!-- <span class="ace-file-container"data-title="浏览 .."> 
				<span class="ace-file-name"data-title="选择文件..."> 
					<i class=" ace-icon fa fa-upload"></i>
				</span> -->
			</span>
			</label>
		</div>
		<div class="col-sm-3">
			<input type="submit" value="提交">
		</div>
	</form>
</body>
<!-- basic scripts -->

<!--[if !IE]> -->
<script src="components/jquery/dist/jquery.js"></script>
<!-- <![endif]-->

<!--[if IE]>
<script src="components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='../components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>" + "<" + "/script>");
</script>
<script src="components/bootstrap/dist/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->

<!-- ace scripts -->
<script src="assets/js/src/elements.scroller.js"></script>
<script src="assets/js/src/ace.js"></script>
<script src="assets/js/src/ace.basics.js"></script>
<script src="assets/js/src/ace.sidebar.js"></script>
<script src="assets/js/src/ace.sidebar-scroll-1.js"></script>
<script src="assets/js/src/ace.submenu-hover.js"></script>

<!--
<script src="assets/js/src/ace.settings.js"></script>
-->

<!-- 自己写的JS，请放在这里 -->
<script type="text/javascript">
    function resizeIframe() {
        var browser=navigator.appName;
        var trim_Version=navigator.appVersion.split(";")[1].replace(/[ ]/g,"");
        var height = document.documentElement.clientHeight;
        if(browser=="Microsoft Internet Explorer"&& (trim_Version=="MSIE6.0" || trim_Version=="MSIE7.0"))
        {
            //不支持此IE版本，请升级浏览器
            //TODO: 提示用户升级
        }
        else
        {
            height -= document.getElementById('main-content-inner').offsetTop;
        }

        height -= 5;//边框的高度之和
        /* whatever you set your body bottom margin/padding to be */
        document.getElementById('main-content-iframe').style.height = height + "px";
    }

    document.getElementById('main-content-iframe').onload = resizeIframe;
    window.onresize = resizeIframe;


    jQuery(function ($) {
        /*
         //隐藏/显示左菜单
         $("#sidebar").removeClass("sidebar").hide();
         window.setTimeout(function () {
         $("#sidebar").addClass("sidebar").show();
         },3000);
         */
    });
</script>


</body>
</html>
