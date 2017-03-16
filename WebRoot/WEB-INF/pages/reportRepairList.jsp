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
    <title>Empty Page - Ace Admin</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="../components/font-awesome/css/font-awesome.css"/>

    <!-- page plugin css -->
    <link rel="stylesheet" href="../components/_mod/jquery-ui/jquery-ui.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="../assets/css/ace-part2.css" class="ace-main-stylesheet"/>
    <![endif]-->
    <link rel="stylesheet" href="../assets/css/ace-skins.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="../assets/css/ace-ie.css"/>
    <![endif]-->

    <!--THS CSS 插件-->
    <link rel="stylesheet" href="../assets/css/ths.css"/>

    <!-- 自己写的CSS，请放在这里 -->
    <style type="text/css">

    </style>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="../components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="../components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">

<div class="main-container" id="main-container">
    <div class="main-content">
        <div class="main-content-inner fixed-page-header fixed-40">
            <div id="breadcrumbs" class="breadcrumbs">
                <ul class="breadcrumb">
                    <li class="active"><i class="fa fa-arrow-right"></i> 监测数据</li>
                </ul><!-- /.breadcrumb -->

            </div>
        </div>
        <div class="main-content-inner padding-page-content">
            <div class="page-content">
                <div class="space-4"></div>
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form1" action="index.html" method="post">

                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="txtName">
                                    姓名
                                </label>
                                <div class="col-sm-3">
                                    <span class="input-icon width-100">
                                        <input type="text" class="form-control"
                                               data-validation-engine="validate[required]" placeholder="4个汉字以内"
                                               id="txtName"/>
                                        <i class="ace-icon fa fa-user"> </i>
                                   </span>

                                </div>
                                <label class="col-sm-1 control-label no-padding-right hidden-xs">性别</label>
                                <div class="col-sm-3 hidden-xs">
                                    <div class="control-group">
                                        <div class="radio-inline">
                                            <label>
                                                <input name="gender" type="radio" class="ace" value="male" checked>
                                                <span class="lbl"> 男</span>
                                            </label>
                                        </div>

                                        <div class="radio-inline">
                                            <label>
                                                <input name="gender" type="radio" class="ace" value="female">
                                                <span class="lbl"> 女</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <label class="col-sm-1 control-label no-padding-right hidden-xs"
                                       for="form-field-select-1">
                                    职位
                                </label>
                                <div class="col-sm-3 hidden-xs">
                                    <select class="form-control" id="form-field-select-1">
                                        <option value="">-请选择-</option>
                                        <option value="1">科员</option>
                                        <option value="2">科长</option>
                                        <option value="3">处长</option>
                                        <option value="4">局长</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right hidden-xs"
                                       for="form-field-221">部门</label>
                                <div class="col-sm-6 col-lg-3 col-md-6 hidden-xs">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="" id="form-field-221"
                                               readonly="readonly"/>
                                    <span class="input-group-btn">
                                    <button type="button" class="btn btn-white btn-default">
                                        <i class="ace-icon fa fa-search"></i>
                                        选择
                                    </button>
                                        <button type="button" class="btn btn-white btn-default">
                                            <i class="ace-icon fa fa-remove"></i>
                                        </button>
                                    </span>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-lg-8 col-md-5 align-right">
                                    <div class="space-4 hidden-lg hidden-md hidden-sm"></div>
                                    <button type="button" class="btn btn-info btn-default-ths" id="btnSearch">
                                        <i class="ace-icon fa fa-search"></i>
                                        搜索
                                    </button>
                                    <button type="button" class="btn btn-purple btn-default-ths" id="btnSearchAdv">
                                        <i class="ace-icon fa fa-search-plus"></i>
                                        高级搜索
                                    </button>
                                </div>
                            </div>
                            <hr class="no-margin">
                            <div class="page-toolbar align-right list-toolbar">
                                <button type="button" class="btn btn-xs btn-inverse btn-xs-ths" id="btnAdd" data-ths-href="form1.html">
                                    <i class="ace-icon fa fa-plus"></i>
                                    添加
                                </button>
                                <button type="button" class="btn btn-xs btn-danger btn-xs-ths" id="btnDelete">
                                    <i class="ace-icon fa fa-trash-o"></i>
                                    删除
                                </button>
                                <button type="button" class="btn btn-xs btn-purple btn-xs-ths" id="btnExport">
                                    <i class="ace-icon fa fa-file-excel-o"></i>
                                    导出
                                </button>
                                <div class="btn-group">
                                    <button data-toggle="dropdown"
                                            class="btn btn-xs btn-info btn-xs-ths dropdown-toggle"
                                            aria-expanded="false">
                                        <i class="ace-icon fa fa-wrench"></i>
                                        操作
                                        <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                    </button>

                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li>
                                            <a href="form1.html">
                                                <i class="ace-icon fa fa-plus"></i>
                                                添加
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#"><i class="ace-icon fa fa-trash-o"></i>
                                                删除</a>
                                        </li>

                                        <li>
                                            <a href="#"><i class="ace-icon fa fa-remove align-left"></i>
                                                取消发布</a>
                                        </li>

                                        <li class="divider"></li>

                                        <li>
                                            <a href="#"><i class="ace-icon fa fa-check"></i>
                                                提交</a>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                            <table id="simple-table" class="table  table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th class="hidden-xs"><i class="ace-icon fa fa-map-o"></i>
                                        行政区
                                    </th>
                                    <th><i class="ace-icon fa fa-map-marker"></i>
                                        监测点
                                    </th>
                                    <th class="hidden-xs hidden-sm">
                                        监测时间
                                        <i class="ace-icon fa fa-sort-asc blue pull-right"></i>
                                    </th>

                                    <th class="align-right">PM<sub>2.5</sub>(μg/m<sup>3</sup>)
                                    </th>
                                    <th class="align-right">SO<sub>2</sub>(μg/m<sup>3</sup>)</th>
                                    <th class="align-right">CO(mg/m<sup>3</sup>)</th>
                                    <th class="align-center">达标状态
                                        <i class="ace-icon fa fa-sort-desc blue pull-right"></i></th>
                                    <th class="align-center hidden-xs"><i class="ace-icon fa fa-wrench"></i>
                                        操作
                                    </th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="formDetail.html?id=1"> 极简表单</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                            <span class="label label-sm label-warning arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-exclamation-circle"></i>
                                                预警 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info btn-white btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger btn-white btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="formDetail_02.html"> 带表格的表单</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                            <span class="label label-sm label-success arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-check-circle"></i>
                                                达标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="#"> 金泉两河</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                            <span class="label label-sm label-pink arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-times-circle"></i>
                                                超标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="#"> 金泉两河</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                            <span class="label label-sm label-success arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-check-circle"></i>
                                                达标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="#"> 金泉两河</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                             <span class="label label-sm label-success arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-check-circle"></i>
                                                达标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="#"> 金泉两河</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                            <span class="label label-sm label-success arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-check-circle"></i>
                                                达标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="#"> 金泉两河</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                            <span class="label label-sm label-success arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-check-circle"></i>
                                                达标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="#"> 金泉两河</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                            <span class="label label-sm label-success arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-check-circle"></i>
                                                达标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="#"> 金泉两河</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                             <span class="label label-sm label-success arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-check-circle"></i>
                                                达标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="hidden-xs">
                                        成都市
                                    </td>
                                    <td><a href="#"> 金泉两河</a></td>
                                    <td class="hidden-xs hidden-sm">2015-04-29 00:00</td>
                                    <td class="align-right">150.000</td>

                                    <td class="align-right">
                                        13.000
                                    </td>

                                    <td class="align-right">
                                        1.708
                                    </td>
                                    <td class="align-center">
                                            <span class="label label-sm label-success arrowed-in-right min-width-75">
                                                <i class="ace-icon fa fa-check-circle"></i>
                                                达标 </span>
                                    </td>
                                    <td class="hidden-xs align-center col-op-ths">
                                        <button type="button" class="btn btn-sm btn-info  btn-op-ths" title="编辑">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-sm btn-danger  btn-op-ths"  title="删除">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                            <div class="form-group">
                                <div class="hidden-xs pull-left" style="margin-left: 12px" >
                                    <div class="space-4"></div>
                                    总记录数：100条，每页10条，共15页。
                                </div>
                                <ul class="pagination pull-right" >
                                    <li class="disabled">
                                        <a href="#">
                                            <i class="ace-icon fa fa-angle-double-left"></i>
                                        </a>
                                    </li>
                                <li class="disabled">
                                    <a href="#">
                                        <i class="ace-icon fa fa-angle-left"></i>
                                    </a>
                                </li>

                                <li class="active">
                                    <a href="#">1</a>
                                </li>

                                <li>
                                    <a href="#">2</a>
                                </li>
                                    <li>
                                        <a href="#">3</a>
                                    </li>

                                <li>
                                    <a href="javascript:" class="min-width-75 align-center">...</a>
                                </li>
                                    <li>
                                        <a href="#">13</a>
                                    </li>
                                <li>
                                    <a href="#">14</a>
                                </li>

                                <li>
                                    <a href="#">15</a>
                                </li>
                                    <li>
                                        <a href="#">
                                            <i class="ace-icon fa fa-angle-right"></i>
                                        </a>
                                    </li>
                                <li>
                                    <a href="#">
                                        <i class="ace-icon fa fa-angle-double-right"></i>
                                    </a>
                                </li>
                            </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!--/.main-content-inner-->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="../components/jquery/dist/jquery.js"></script>
<!-- <![endif]-->

<!--[if IE]>
<script src="../components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='../components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>" + "<" + "/script>");
</script>
<script src="../components/bootstrap/dist/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->
<script src="../components/jquery-ui/jquery-ui.js"></script>
<script src="../components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>

<!--ace script-->
<script src="../assets/js/src/ace.js"></script>

<!--THS script-->
<script src="../assets/js/ths.js"></script>

<!-- 自己写的JS，请放在这里 -->
<script type="text/javascript">

    jQuery(function ($) {
        //为工具条添加点击事件
        $(".page-toolbar>button").on(ace.click_event,function (e) {
            if($(this).data("ths-href"))
            {
                window.location.href = ($(this).data("ths-href"));
            }
        });

        //为表格操作列添加点击事件
        $(".col-op-ths>button").on(ace.click_event,function(e){
            if($(this).data("ths-href"))
            {
                window.location.href = ($(this).data("ths-href"));
            }
        });

        //为表格添加排序事件
        $("#simple-table>thead>tr>th").on(ace.click_event, function (e) {
            var $i = $(this).find("i");
            //console.log($i.hasClass("fa-sort-asc"));
            if ($i && $i.hasClass("fa-sort-asc")) {
                $i.removeClass("fa-sort-asc").addClass("fa-sort-desc");
            }
            else if ($i && $i.hasClass("fa-sort-desc")) {
                $i.removeClass("fa-sort-desc").addClass("fa-sort-asc");
            }
        })

        //And for the first simple table, which doesn't have TableTools or dataTables
        //select/deselect all rows according to table header checkbox
        var active_class = 'active';
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
            var th_checked = this.checked;//checkbox inside "TH" table header

            $(this).closest('table').find('tbody > tr').each(function(){
                var row = this;
                if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            });
        });

        //select/deselect a row when the checkbox is checked/unchecked
        $('#simple-table').on('click', 'td input[type=checkbox]' , function(){
            var $row = $(this).closest('tr');
//            if($row.is('.detail-row ')) return;
            if(this.checked) $row.addClass(active_class);
            else $row.removeClass(active_class);
        });
    });
</script>
</body>
</html>
