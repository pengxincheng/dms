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
                    <li class="active"><i class="fa fa-arrow-right"></i>申领物品列表</li>
                </ul><!-- /.breadcrumb -->
            </div>
        </div>
        <div class="main-content-inner padding-page-content">
            <div class="page-content">
               <div class="" style="padding-bottom: 20px;">
                	 <ul class="nav nav-tabs" id="myTab2">
                          <li class="active">
                               <a data-toggle="tab" href="#waitAudit">待审核</a>
                          </li>
                          <li class="">
                               <a data-toggle="tab" href="#audited">已审核</a>
                          </li>
                      </ul>
                </div>
              <div id="tapContent" class="tab-content">
              	
                <div id="waitAudit" class="tab-pane fade in active">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form1" action="index.html" method="post">
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="applyer">申请人</label>
                                <div class="col-sm-3">
                                      <input type="text" class="form-control" placeholder="申请人" id="applyer" name="applyer"/>
                                </div>
                                
                                 <label class="col-sm-1 control-label no-padding-right" for="room">宿舍</label>
                                <div class="col-sm-3">
                                      <input type="text" class="form-control" placeholder="宿舍" id="room" name="room"/>
                                </div>
                          		<div class="col-sm-4">
                                    <div class="space-4 hidden-lg hidden-md hidden-sm"></div>
                                    <button type="button" class="btn btn-info btn-default-ths" id="btnSearch" onclick="initTableAutditedForManager()">
                                        <i class="ace-icon fa fa-search"></i>
                                        搜索
                                	</button>
                            </div>
                            </div>
                            <hr class="no-margin">
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- div.table-responsive -->

                                    <!-- div.dataTables_borderWrap table-striped -->
                                    <div>
                                        <table id="waitAuditTable" class="table table-striped  table-bordered table-hover" width="100%">
                                            <thead>
                                            <tr>
                                               <th class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th class="align-center">申请人</th>
                                                <th class="align-center">申请宿舍</th>
                                                <th class="align-center">申请物品</th>
                                                <th class="align-center">申请时间</th>
                                                <th class="align-center">审核人</th>
                                                <th class="align-center">备注</th>
                                                <th class="align-center">状态</th>
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
                </div><!-- waitAudit -->
                 <div id="audited" class="tab-pane fade">
                  	<div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form2" action="index.html" method="post">
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="applyer1">申请人</label>
                                <div class="col-sm-3">
                                      <input type="text" class="form-control" placeholder="申请人" id="applyer1" name="applyer1"/>
                                </div>
                                
                                 <label class="col-sm-1 control-label no-padding-right" for="room1">宿舍</label>
                                <div class="col-sm-3">
                                      <input type="text" class="form-control" placeholder="宿舍" id="room1" name="room1"/>
                                </div>
                          		<div class="col-sm-4">
                                    <div class="space-4 hidden-lg hidden-md hidden-sm"></div>
                                    <button type="button" class="btn btn-info btn-default-ths" id="btnSearch" onclick="initTableAutdited()">
                                        <i class="ace-icon fa fa-search"></i>
                                        搜索
                                	</button>
                            </div>

                            </div>
                            
                           
                            <hr class="no-margin">
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- div.table-responsive -->

                                    <!-- div.dataTables_borderWrap table-striped -->
                                    <div>
                                        <table id="autidedTable" class="table table-striped  table-bordered table-hover" width="100%">
                                            <thead>
                                            <tr>
                                               <th class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th class="align-center">申请人</th>
                                                <th class="align-center">申请宿舍</th>
                                                <th class="align-center">申请物品</th>
                                                <th class="align-center">申请时间</th>
                                                <th class="align-center">审核人</th>
                                                <th class="align-center">审核意见</th>
                                                <th class="align-center">审核时间</th>
                                                <th class="align-center">状态</th>
                                            </tr>
                                            </thead>                                           
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                 </div>
                </div><!-- tapContent -->
            </div>
        </div><!--/.main-content-inner-->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					申领物品审核
				</h4>
			</div>
			<div class="modal-body col-xs-12">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">是否通过</label>
	                 <div class="col-sm-10">
	                     <div class="control-group">
	                         <div class="radio-inline">
	                             <label>
	                                 <input name="status" type="radio" class="ace" value="审核通过" checked="checked">
	                                 <span class="lbl">是</span>
	                             </label>
	                         </div>
	                         <div class="radio-inline">
	                             <label>
	                                 <input name="status" type="radio" class="ace" value="审核不通过">
	                                 <span class="lbl">否</span>
	                             </label>
	                         </div>
	                     </div>
                     </div>
                     <div class="form-group">
                     	<label class="col-sm-2 control-label no-padding-right" for="auditOponion">审核意见</label>
                          <div class="col-sm-10">
                                <textarea class="form-control" id="auditOponion" name="auditOponion" placeholder="审核意见"
                                       style="width: 356px; height: 66px;"></textarea>
                          </div>      
                     </div>
                 </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="submitApply">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
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
<script src="js/applyGood.js"></script>
<script type="text/javascript">
	initTableAutditedForManager()
	initTableAutdited();
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
		/* 待审核  全选 反选 */
        //And for the first simple table, which doesn't have TableTools or dataTables
        //select/deselect all rows according to table header checkbox
        var active_class = 'active';
        $('#waitAuditTable > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
            var th_checked = this.checked;//checkbox inside "TH" table header

            $(this).closest('table').find('tbody > tr').each(function(){
                var row = this;
                if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            });
        });

        //select/deselect a row when the checkbox is checked/unchecked
        $('#waitAuditTable').on('click', 'td input[type=checkbox]' , function(){
            var $row = $(this).closest('tr');
//            if($row.is('.detail-row ')) return;
            if(this.checked) $row.addClass(active_class);
            else $row.removeClass(active_class);
        });
       /*  已审核  全选反选*/
        $('#autidedTable > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
            var th_checked = this.checked;//checkbox inside "TH" table header

            $(this).closest('table').find('tbody > tr').each(function(){
                var row = this;
                if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            });
        });

        //select/deselect a row when the checkbox is checked/unchecked
        $('#autidedTable').on('click', 'td input[type=checkbox]' , function(){
            var $row = $(this).closest('tr');
//            if($row.is('.detail-row ')) return;
            if(this.checked) $row.addClass(active_class);
            else $row.removeClass(active_class);
        });
    });
    
</script>
</body>
</html>
