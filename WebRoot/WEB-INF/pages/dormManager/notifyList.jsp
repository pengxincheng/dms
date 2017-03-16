<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!--浏览器兼容性设置-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Empty Page - Ace Admin</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="components/font-awesome/css/font-awesome.css"/>

    <!-- 自定义的内联样式表请写这里 -->

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.css" class="ace-main-stylesheet"/>
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.css"/>
    <![endif]-->

    <!--THS CSS 插件-->
    <link rel="stylesheet" href="assets/css/ths.css"/>

    <!-- 自己写的CSS，请放在这里 -->
    <style type="text/css">
        .list-unstyled li {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .alert{
            margin-bottom: 10px;
        }
    </style>


    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row ">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="" id="main-widget-container">


                            <div class="row">
                            </div><!-- /.span -->


                                <div class="col-sm-6 widget-container-col" id="widget-container-col-15">
                                    <!-- #section:custom/widget-box.options.transparent -->
                                    <div class="widget-box transparent" id="widget-box-15">
                                        <div class="widget-header">
                                            <h4 class="widget-title lighter orange">
                                                <i class="menu-icon fa fa-bullhorn"></i>
                                               	 通知公告
                                            </h4><div class="widget-toolbar no-border">
                                                <a href="#" data-action="collapse">
                                                    <span class="smaller-70">more</span>
                                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                                </a>
                                            </div>

                                             
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main no-padding-left no-padding-right">
                                               <c:forEach var="notify" items="${notifies}">
                                               	<c:if test="${notify.type eq 'tzgg'}">
                                                <p class="alert alert-info">
                                                    <i class="ace-icon fa bigger-130 fa-volume-down">
                                                    	<a href="#" title=" ${notify.notifyContent}"> ${notify.notifyTitle}</a>
                                                    </i>
                                                </p>
                                                </c:if>
                                               </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /section:custom/widget-box.options.transparent -->
                                </div>
								
								 <!-- #section:custom/widget-box.options.transparent -->
                                    <div class="col-sm-6 widget-box transparent" id="widget-box-04">
                                        <div class="widget-header">
                                            <h4 class="widget-title lighter green">失物招领信息</h4>

                                            <div class="widget-toolbar no-border">
                                                <a href="#" data-action="collapse">
                                                    <span class="smaller-70">more</span>
                                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="widget-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <ul class="list-unstyled spaced">
                                                    	<c:forEach items="${notifies}" var="notify">
                                                    	<c:if test="${notify.type eq 'swzl'}">
                                                        <li>
                                                            <i class="ace-icon fa fa-caret-right dark"></i>
                                                            <a href="#" title=" ${notify.notifyContent}"> ${notify.notifyTitle}</a>
                                                        </li>
                                                        </c:if>
                                                        </c:forEach>
                                                     </ul>                                                                                                                                             
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            <!--
                            <div class="text-center">
                                <button type="reset" id="reset-widgets" class="btn btn-danger btn-white btn-bold btn-round">Reset Position/State</button>
                            </div>
                            -->
                        </div><!-- PAGE CONTENT ENDS -->
                    </div>
                </div><!-- /.row -->
            </div>
        </div><!--/.main-content-inner-->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="components/jquery/dist/jquery.js"></script>
<!-- <![endif]-->

<!--[if IE]>
<script src="components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>" + "<" + "/script>");
</script>
<script src="components/bootstrap/dist/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->
<script src="components/_mod/jquery-ui.custom/jquery-ui.custom.js"></script>
<script src="components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>

<!-- 自己写的JS，请放在这里 -->
<script type="text/javascript">

</script>
</body>
</html>
