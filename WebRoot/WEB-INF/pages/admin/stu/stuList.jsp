<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <!-- page plugin css -->

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

    </style>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">

<div class="main-container" id="main-container">
    <div class="main-content">
        <div class="main-content-inner fixed-page-header fixed-40">
            <div id="breadcrumbs" class="breadcrumbs">
                <ul class="breadcrumb">
                    <li class="active"><i class="fa fa-arrow-right"></i>学生列表</li>
                </ul><!-- /.breadcrumb -->
            </div>
        </div>
        <div class="main-content-inner padding-page-content">
            <div class="page-content">
                <div class="" style="padding-bottom: 20px;">
                	 <ul class="nav nav-tabs" id="myTab2">
                          <li class="active">
                               <a data-toggle="tab" href="#weifen">未分配宿舍</a>
                          </li>

                          <li class="">
                               <a data-toggle="tab" href="#yifen">已分配宿舍</a>
                          </li>
                      </ul>
                </div>
              <div id="tapContent" class="tab-content">
                <div id="yifen" class="tab-pane fade">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form1" action="index.html" method="post">
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="name">
                               	     学生姓名
                                </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="学生姓名" id="name" name="name"/>
                                       
                                </div>
                                
                                 <label class="col-sm-1 control-label no-padding-right" for="gender">性别</label>
                                <div class="col-sm-3">
                                   <select class="form-control" id="genderYifen" name="genderYifen" data-validation-engine="validate[required]">
                                        <option value="" selected="selected">-请选择-</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>
                          		<div class="col-sm-4 align-right">
                                    <div class="space-4 hidden-lg hidden-md hidden-sm"></div>
                                    <button type="button" class="btn btn-info btn-default-ths" id="btnSearch" onclick="initTable()">
                                        <i class="ace-icon fa fa-search"></i>
                                        搜索
                                	</button>
                            </div>

                            </div>
                            
                           
                            <hr class="no-margin">
                          <!--   <div class="page-toolbar align-right list-toolbar">
                                <button type="button" class="btn btn-xs btn-inverse btn-xs-ths" id="btnAdd" data-ths-href="goToAddStu">
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
                            </div> -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- div.table-responsive -->

                                    <!-- div.dataTables_borderWrap table-striped -->
                                    <div>
                                        <table id="example" class="table table-striped  table-bordered table-hover" width="100%"> 
                                            <thead>
                                            <tr>
                                               <th class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th class="align-center">姓名</th>
                                                <th class="align-center">学号</th>
                                                <th class="align-center">年级</th>
                                                <th class="align-center">班级</th>
                                                <th class="align-center">性别</th>
                                                <th class="align-center">年龄</th>
                                                <th class="align-center">宿舍</th>
                                                <th class="align-center hidden-xs"><i class="ace-icon fa fa-wrench"></i>
                                       				 操作
                                    			</th>                                        
                                            </tr>
                                            </thead>                                           
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                </div>  <!-- yifen -->
                <div id="weifen" class="tab-pane fade in active">
                   	<div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form2" action="index.html" method="post">
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="name1">
                               	     学生姓名
                                </label>
                                <div class="col-sm-3">
                                   <input type="text" class="form-control" placeholder="学生姓名" id="name1" name="name1"/>
                                </div>
                                 <label class="col-sm-1 control-label no-padding-right" for="gender">性别</label>
                                <div class="col-sm-3">
                                   <select class="form-control" id="genderWeifen" name="genderWeifen" data-validation-engine="validate[required]">
                                        <option value="" selected="selected">-请选择-</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>
                          		<div class="col-sm-4 align-right">
                                    <div class="space-4 hidden-lg hidden-md hidden-sm"></div>
                                    <button type="button" class="btn btn-info btn-default-ths" id="btnSearch" onclick="initTableWeifen()">
                                        <i class="ace-icon fa fa-search"></i>
                                        搜索
                                	</button>
                            </div>

                            </div>
                            
                           
                            <hr class="no-margin">
                            <div class="page-toolbar align-right list-toolbar">
                            <button type="button" class="btn btn-xs btn-success btn-xs-ths" id="btnAllot">
                                    <i class="ace-icon fa fa-plus"></i>
                                    自动分配
                                </button>
                                <button type="button" class="btn btn-xs btn-inverse btn-xs-ths" id="btnAdd" data-ths-href="goToAddStu">
                                    <i class="ace-icon fa fa-plus"></i>
                                    添加
                                </button>
                                <button type="button" class="btn btn-xs btn-danger btn-xs-ths" id="btnDelete">
                                    <i class="ace-icon fa fa-trash-o"></i>
                                    删除
                                </button>
                                <button type="button" class="btn btn-xs btn-purple btn-xs-ths" id="btnImport">
                                    <i class="ace-icon fa fa-file-excel-o"></i>
                                    导入
                                </button>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- div.table-responsive -->

                                    <!-- div.dataTables_borderWrap table-striped -->
                                    <div>
                                        <table id="example1" class="table table-striped  table-bordered table-hover" width="100%"> 
                                            <thead>
                                            <tr>
                                               <th class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th class="align-center">姓名</th>
                                                <th class="align-center">学号</th>
                                                <th class="align-center">年级</th>
                                                <th class="align-center">班级</th>
                                                <th class="align-center">性别</th>
                                                <th class="align-center">年龄</th>
                                                <th class="align-center hidden-xs"><i class="ace-icon fa fa-wrench"></i>
                                       				 操作
                                    			</th>                                        
                                            </tr>
                                            </thead>                                           
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                </div><!--weifen  -->
                </div><!--tabContent  -->
            </div>
        </div><!--/.main-content-inner-->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<form method="post" id="importStu" name="importStu" enctype="multipart/form-data" action="importStu.do">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">从Excell导入</h4>
				</div>
				
				<div class="modal-body col-xs-12">
					<div class="form-group">
						<div class="col-sm-3">
							<input type="file" id="stuExcell" name="stuExcell"> 
						</div>
					</div>
				
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary" 
					id="btnImport1" onclick="return checkData()">导入</button>
			</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
	
	<div class="modal fade" id="allot" tabindex="-1" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<form method="post" id="selectArea" name="selectArea">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">自动分配宿舍</h4>
				</div>
				
				<div class="modal-body col-xs-12">
					<div class="form-group">
						<div class="col-sm-6">
							<label class="col-sm-6 control-label no-padding-right" for="stuGrade">选择宿舍区</label>
							<select class="form-control" id="areaId" name="areaId" data-validation-engine="validate[required]">
                                <option value="" selected="selected">-请选择-</option>
                            </select>
						</div>
					</div>
				
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" id="btnSubmitAllot">确定</button>
			</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	
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
<script src="components/datatables/jquery.dataTables.min.js"></script>
<script src="components/datatables/dataTables.bootstrap.min.js"></script>
<script src="components/datatables/dataTables.fixedColumns.min.js"></script>
<script src="components/datatables/dataTables.fixedHeader.min.js"></script>
<script src="components/datatables/dataTables.select.min.js"></script>
<script src="components/datatables/dataTables.responsive.min.js"></script>

<!--ace script-->
<script src="assets/js/src/ace.js"></script>

<!-- 自己写的JS，请放在这里 -->
<script src="js/stu.js"></script>
<script type="text/javascript">
	initTable();
	initTableWeifen();
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

        
    });
    
</script>
</body>
</html>
