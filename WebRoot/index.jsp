<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>学生宿舍管理系统</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="components/font-awesome/css/font-awesome.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.css" class="ace-main-stylesheet"/>
    <![endif]--
    <link rel="stylesheet" href="assets/css/ace-skins.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.css"/>
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ths-menu.css"/>

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

<body class="no-skin">
<!--新增条-->
<div class="ths-toolbar">
    <div class="row">
        <div class="col-sm-4 hidden-xs">欢迎您，管理员</div>
        <div class="col-xs-12 col-sm-8 ">
            <ul class=" pull-right" data-level="top">
                <li>
                    <div class="inline pos-rel">
                        <a href="#" class="dropdown-toggle dropdown-hover" data-toggle="dropdown">
                            <i class="ace-icon fa fa-windows grey bigger-110" title="常用菜单"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-light dropdown-caret dropdown-closer ths-toolbar-quickmenu">
                            <li> <a href="#" class="grey"><i class="ace-icon fa fa-angle-double-right blue"></i> 常用模块一</a> </li>
                            <li> <a href="#" class="grey"><i class="ace-icon fa fa-angle-double-right blue"></i> 常用模块二</a> </li>
                            <li> <a href="#" class="grey"><i class="ace-icon fa fa-angle-double-right blue"></i> 常用模块三</a> </li>
                            <li> <a href="#" class="grey"><i class="ace-icon fa fa-angle-double-right blue"></i> 常用模块四</a> </li>
                            <li> <a href="#" class="grey"><i class="ace-icon fa fa-angle-double-right blue"></i> 常用模块五</a> </li>
                        </ul>
                    </div>

                </li>
                <li><i class="ace-icon fa fa-file-o grey bigger-100" title="待办事项"></i><span class="badge badge-warning">99</span></li>
                <li><i class="ace-icon fa fa-bullhorn grey bigger-110" title="通知"></i><span class="badge badge-success">2</span></li>
                <li><i class="ace-icon fa fa-envelope-o grey bigger-110" title="未读邮件"></i><span class="badge badge-important">5</span></li>

                <li><i class="ace-icon fa fa-user grey bigger-110" title="我的工作台"></i></li>
                <li><i class="ace-icon fa fa-search grey bigger-110" title="搜索"></i></li>
                <li> <i class="ace-icon fa fa-gears grey bigger-110" title="设置"></i></li>
                <li> <i class="ace-icon fa fa-power-off grey bigger-110" title="注销"></i></li>
            </ul>
        </div>
    </div>
</div>
<!--新增条-->
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default ths-top-menu">
    <div class="navbar-container " id="navbar-container">
        <!-- #section:basics/sidebar.mobile.toggle 移动端 菜单选项-->

        <button data-target="#sidebarTop" data-toggle="collapse" type="button"
                class="pull-left navbar-toggle collapsed">
            <span class="sr-only">菜单</span>

            <i class="ace-icon fa fa-th white bigger-175"></i>
        </button>

        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">模块</span>

            <i class="ace-icon fa fa-navicon white bigger-175"></i>
        </button>

    </div>


    <!-- /section:basics/sidebar.mobile.toggle -->
    <div class="navbar-header pull-left">
        <!-- #section:basics/navbar.layout.brand -->
        <a href="#" class="navbar-brand navbar-brand-line no-padding">
            <small>
                <i class="width_34"><img src="../assets/images/logo.png"></i>
                <span>学生宿舍管理系统</span>
            </small>
        </a>
        <!-- /section:basics/navbar.toggle -->
    </div>

    <!-- #section:basics/navbar.dropdown -->


    <div class="navbar-buttons navbar-header pull-right" role="navigation">
        <!--注释蒋欣-->
        <!--<ul class="nav ace-nav">
              <li class="light-blue dropdown-modal">
                  <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                      <img class="nav-user-photo" src="../assets/avatars/avatar2.png" alt=""/>
                                  <span class="user-info">
                                      <small>Hi,</small>
                                      蒋欣
                                  </span>

                      <i class="ace-icon fa fa-caret-down"></i>
                  </a>

                  <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
                      <li>
                          <a href="#">
                              <i class="ace-icon fa fa-cog"></i>
                              个人设置
                          </a>
                      </li>

                      <li class="divider"></li>

                      <li>
                          <a href="#">
                              <i class="ace-icon fa fa-power-off"></i>
                              注销
                          </a>
                      </li>
                  </ul>
          </ul>
        <!--注释蒋欣-->
    </div>
   <!-- .sidebar -->
    <!-- /section:basics/navbar.dropdown -->
</div><!-- /.navbar-container -->

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- #section:basics/sidebar -->
    <div id="sidebar" class="sidebar responsive  sidebar-fixed" >

        <ul class="nav nav-list">
            <li class="active open">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-th-large"></i>
                    <span class="menu-text">学生</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>
				
                <ul class="submenu">
                    <li class="active">
                        <a href="findAllNotifies.do" target="main">
                            <i class="menu-icon fa fa-laptop"></i>
                            通知公告
                            <span class="badge badge-warning">5</span>
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="goToRepairTasksList.do" target="main">
                            <i class="menu-icon fa fa-bar-chart"></i>
                            上报维修
                            <span class="badge badge-success">2</span>
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a href="goToStuApplyGoodsList.do" target="main">
                            <i class="menu-icon fa fa-legal"></i>
                            申领物品
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a href="portal-main.html" target="main">
                            <i class="menu-icon fa fa-area-chart"></i>
                            卫生评比
                        </a>

                        <b class="arrow"></b>
                    </li>
					
					 <li class="">
                        <a href="portal-main.html" target="main">
                            <i class="menu-icon fa fa-area-chart"></i>
                            调换宿舍
                        </a>

                        <b class="arrow"></b>
                    </li>
					
					<li class="">
                        <a href="portal-main.html" target="main">
                            <i class="menu-icon fa fa-area-chart"></i>
                            迁出宿舍
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-reorder"></i>
                    <span class="menu-text">我的宿舍管理员</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>
                <b class="arrow"></b>
                <ul class="submenu">

                    <li class="">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-th"></i>
                            <span class="menu-text">登记管理</span>
                            <b class="arrow fa fa-angle-down"></b>
                        </a>

                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="">
                                <a href="goToVisitEnregisterList.do" target="main">
                                    <i class="menu-icon fa fa-list"></i>
                                    	来访登记
                                </a>

                                <b class="arrow"></b>
                            </li>
                            
                            <li class="">
                                <a href="goToRegisterList.do" target="main">
                                    <i class="menu-icon fa fa-list"></i>
                                   		 晚归登记
                                </a>

                                <b class="arrow"></b>
                            </li>
                            
                            <li class="">
                                <a href="goToRegisterListFroQueQin.do" target="main">
                                    <i class="menu-icon fa fa-list"></i>
                                   		 缺勤登记
                                </a>

                                <b class="arrow"></b>
                            </li>
                        </ul>

                    </li>
                    <li class="">
                        <a href="#">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                            	宿舍管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a href="#">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                           		卫生管理
                        </a>

                        <b class="arrow"></b>
                    </li>      
                    <li class="">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-th"></i>
                            <span class="menu-text">通知公告</span>
                            <b class="arrow fa fa-angle-down"></b>
                        </a>

                        <b class="arrow"></b>
                        <ul class="submenu">
                            <li class="">
                                <a href="findAllNotifies.do" target="main">
                                    <i class="menu-icon fa fa-list"></i>
                                    	通知公告
                                </a>
                                <b class="arrow"></b>
                            </li>                           
                            <li class="">
                                <a href="findAllNotifiesForUser.do" target="main">
                                    <i class="menu-icon fa fa-list"></i>
                                   		 通知公告列表
                                </a>
                                <b class="arrow"></b>
                            </li>                                                       
                        </ul>

                    </li>
                     <li class="">
                        <a href="goToRepairTasksListForManager.do" target="main">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                           		维修处理
                        </a>

                        <b class="arrow"></b>
                    </li>   
                    <li class="">
                        <a href="#">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                           		迁入迁出
                        </a>

                        <b class="arrow"></b>
                    </li>  
                    <li class="">
                        <a href="goToStuApplyGoodsListForManager.do" target="main">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                           		物品发放
                        </a>

                        <b class="arrow"></b>
                    </li>                                                                             
                </ul>
            </li>
            
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-reorder"></i>
                    <span class="menu-text">管理员</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>
                <b class="arrow"></b>
                <ul class="submenu">
                    <li class="">
                        <a href="goToListPage.do" target="main">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                            	宿舍区管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a href="goToBuildingList.do" target="main">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                           		楼宇管理
                        </a>

                        <b class="arrow"></b>
                    </li>                 
                     <li class="">
                        <a href="goToRoomList.do" target="main">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                           		宿舍管理
                        </a>

                        <b class="arrow"></b>
                    </li>   
                    <li class="">
                        <a href="goToStuList.do" target="main">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                           		学生管理
                        </a>

                        <b class="arrow"></b>
                    </li>  
                    <li class="">
                        <a href="#">
                            <i class="menu-icon fa fa-arrow-circle-right"></i>
                           		物品发放
                        </a>

                        <b class="arrow"></b>
                    </li>                                                                             
                </ul>
            </li>
        </ul><!-- /.nav-list -->

        <!-- #section:basics/sidebar.layout.minimize -->
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left "
               data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>

        <!-- /section:basics/sidebar.layout.minimize -->
    </div>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div id="main-content-inner" class="main-content-inner">
            <iframe id="main-content-iframe" name="main" frameBorder="0"
                    style="width:100%;border: none;overflow-x: hidden; overflow-y:auto"
                    scrolling="auto" src="portal.html"></iframe>

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
