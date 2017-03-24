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
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="components/font-awesome/css/font-awesome.css"/>

    <!-- page plugin css -->
    <link rel="stylesheet" href="components/_mod/jquery-ui/jquery-ui.css" />
    

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
                    <li class="active"><i class="fa fa-arrow-right"></i>通知公告</li>
                </ul><!-- /.breadcrumb -->

            </div>
        </div>
        <div class="main-content-inner padding-page-content">
            <div class="page-content">
                <div class="space-4"></div>
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="searchForm" name="searchForm" action="findAllNotifiesForUser.do" method="post">
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="notifyTitle">
                                    	标题
                                </label>
                                <div class="col-sm-3">
									<input type="text" class="form-control" placeholder="标题" id="notifyTitle" name="notifyTitle" />
								</div>  
								
								<label class="col-sm-1 control-label no-padding-right"
                                       for="form-field-select-1">
                                    	类型
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" id="type" name="type">
                                        <option value="">-请选择-</option>
                                        <option value="tzgg">通知公告</option>
                                        <option value="swzl">失物招领</option>
                                    </select>
                                </div> 
                              
                                <div class="col-sm-4 col-lg-8 col-md-4 align-center">
                                    <div class="space-4 hidden-lg hidden-md hidden-sm"></div>
                                    <button type="submit" class="btn btn-info btn-default-ths" id="btnSearch">
                                        <i class="ace-icon fa fa-search"></i>
                                       	 搜索
                                    </button>                                    
                                </div>                                                
                            </div>
                            </form>
                            <div class="form-group">                    
                              
                                
                            </div>
                            <hr class="no-margin">
                            <div class="page-toolbar align-right list-toolbar">
                                <button type="button" class="btn btn-xs btn-inverse btn-xs-ths" id="btnAdd" data-ths-href="goToAddNotifyPage.do">
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
                                    <th class="align-center">标题</th>
									<th class="align-center">类型</th>
									<th class="align-center">发布人</th>
									<th class="align-center">发布时间</th>
                                    <th class="align-center hidden-xs"><i class="ace-icon fa fa-wrench"></i>
                                        操作
                                    </th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${notifies}" var="notify">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" id="notifyId" name="notifyId" value="${notify.notifyId}"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td class="align-center">                                   
                                      ${notify.notifyTitle} 
                                    </td>
                                    <td class="align-center">
                                    <c:if test="${notify.type eq 'tzgg'}">通知公告</c:if>
                                    <c:if test="${notify.type eq 'swzl'}">失物招领</c:if>                                                                    
                                    </td>
                                     <td class="align-center">                                   
                                      ${notify.user.name} 
                                    </td>
                                     <td class="align-center">                                   
                                       <fmt:formatDate value="${notify.publishTime}" type="both"/>
                                    </td>
                                    
                                    <td class="hidden-xs align-center col-op-ths">
                                        <a type="button" class="btn btn-sm btn-info btn-white btn-op-ths" title="编辑" href="getNotifyDetail.do?notifyId=${notify.notifyId}">
                                            <i class="ace-icon fa fa-edit"></i>
                                        </a>
                                        <a type="button" class="btn btn-sm btn-danger btn-white btn-op-ths"  title="删除" href="delNotify.do?notifyId=${notify.notifyId}">
                                            <i class="ace-icon fa fa-trash-o"></i>
                                        </a>
                                    </td>
                                </tr>                              
								</c:forEach>
                                </tbody>
                            </table>
                            <div class="form-group">                        
                                <div class="pagination pull-right">
	                                <ul class="pagination pull-right" id="pagintor">                             
	                            	</ul>
                            	</div>
                            </div>                     
                    </div>
                </div>
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
<!--表单验证jquery.validationEngine-->
<script src="components/_mod/jQuery-Validation-Engine/jquery.validationEngine-zh_CN.js" type="text/javascript"
        charset="utf-8"></script>
<script src="components/_mod/jQuery-Validation-Engine/jquery.validationEngine.js" type="text/javascript"
        charset="utf-8"></script>
<!--日期控件-->
<script src="components/My97DatePicker/WdatePicker.js"></script>

<!-- page specific plugin scripts -->
<script src="components/jquery-ui/jquery-ui.js"></script>
<script src="components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>


<!--ace script-->
<script src="assets/js/src/ace.js"></script>

<!--THS script-->
<script src="assets/js/ths.js"></script>



<!--分页的js-->
<script src="js/myPagination.js"></script>
<script src="js/bootstrap-paginator.js"></script>


<!-- 自己写的JS，请放在这里 -->
<script type="text/javascript">

    jQuery(function ($) {

  		initPagination('findAllNotifiesForUser.do',${currentPage},${totalPages});
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
