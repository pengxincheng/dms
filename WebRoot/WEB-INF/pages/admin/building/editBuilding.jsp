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
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="components/font-awesome/css/font-awesome.css"/>

    <!-- page plugin css -->
    <link rel="stylesheet" href="components/_mod/jQuery-Validation-Engine/validationEngine.jquery.css"/>
    <link rel="stylesheet" href="components/_mod/jQuery-Validation-Engine/template.css"/>

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
        <div class="main-content-inner fixed-page-header fixed-82">
            <div id="breadcrumbs" class="breadcrumbs">
                <ul class="breadcrumb">
                    <li class="active"><i class="fa fa-arrow-right"></i>更新楼栋</li>
                </ul><!-- /.breadcrumb -->

            </div>
        </div>
        <div class="main-content-inner padding-page-content">
            <div class="page-content">
                <div class="space-4"></div>
                <div class="row">
                    <div class=" col-xs-12">
                        <form class="form-horizontal" role="form" id="editBuilding" name="editBuilding" action="updateBuilding.do" method="post">
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="buildingName">楼栋名称</label>
                                <div class="col-sm-3"> 
                                    <input type="text" data-validation-engine="validate[required]" class="form-control" placeholder="名称" id="buildingName" name="buildingName" value="${building.buildingName }"/>
                                </div> 
                                 
                                <label class="col-sm-1 control-label no-padding-right" for="totalStuNum">可住人数</label>
                                <div class="col-sm-3">
                                    <input type="text" data-validation-engine="validate[required]" class="form-control" placeholder="可住人数" id="totalStuNum" name="totalStuNum" value="${building.totalStuNum }"/>
                                </div> 
                            </div>
							<div class="form-group">
								<label class="col-sm-1 control-label no-padding-right" for="areaId">所属宿舍区</label>
                                <div class="col-sm-3">
                                    <select class="form-control" id="areaId" name="areaId">
                                        <option value="" selected="selected">-请选择-</option>
                                        <c:forEach var="area" items="${areas }">
                                        	<option ${area.id eq building.areaId ? 'selected':''} value="${area.id}">${area.areaName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
		
                               <label class="col-sm-1 control-label no-padding-right" for="managerName">宿舍管理员</label>
                                <div class="col-sm-3">
                                    <select class="form-control" id="managerName" name="managerName" data-validation-engine="validate[required]">
                                       <option value="" selected="selected">-请选择-</option>
                                        <c:forEach var="user" items="${users}">
                                        	<option ${user.name eq building.managerName ? 'selected':''} value="${user.name}">${user.name}</option>
                                        </c:forEach>
                                    </select>
                                </div> 
                            </div>	
                            <div class="form-group">
                            	 <label class="col-sm-1 control-label no-padding-right" for="introduct">男生OR女生</label>
                                <div class="col-sm-3">
                                    <select class="form-control" id="introduct" name="introduct" data-validation-engine="validate[required]">
                                       <option value="" >-请选择-</option>
                                       <option ${building.introduct eq '男' ? 'selected':''} value="男">男生宿舍</option>
                                       <option ${building.introduct eq '女' ? 'selected':''} value="女">女生宿舍</option>
                                    </select>
                                </div> 
                            </div>	
                            <input type="hidden" name="buildingId" id="buildingId" value="${building.buildingId}">					
                        </form>
						<div class="align-right">
								
								<button type="button" class="btn btn-xs btn-primary btn-xs-ths" id="btnSave">
									<i class="ace-icon fa fa-save"></i>
									保存
								</button>
								
								<button type="button" class="btn btn-xs btn-danger btn-xs-ths" id="btnReturn">
									<i class="ace-icon fa fa-reply"></i>
									返回
								</button>               
							</div>
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
<!--轻量级HTMl文本编辑器wysiwyg-->
<script src="components/jquery.hotkeys/index.js"></script>
<script src="components/_mod/bootstrap-wysiwyg/bootstrap-wysiwyg.js"></script>

<!--表单验证jquery.validationEngine-->
<script src="components/_mod/jQuery-Validation-Engine/jquery.validationEngine-zh_CN.js" type="text/javascript"
        charset="utf-8"></script>
<script src="components/_mod/jQuery-Validation-Engine/jquery.validationEngine.js" type="text/javascript"
        charset="utf-8"></script>
<!--日期控件-->
<script src="components/My97DatePicker/WdatePicker.js"></script>


<!--ace script-->
<script src="assets/js/src/ace.js"></script>
<script src="assets/js/ace-elements.js"></script>
<script src="js/building.js"></script>



<!-- 自己写的JS，请放在这里 -->
<script type="text/javascript">
    jQuery(function ($) {
        //日期控件使用示例，详细文档请参考http://www.my97.net/dp/demo/index.htm
        $("#divBirthday").on(ace.click_event, function () {
            WdatePicker({el: 'buildTime'});
        });

        //wysiwyg编辑器初始化
        $('#my-editor').ace_wysiwyg().prev().addClass('wysiwyg-style1');

        //表单验证组件初始化，详细文档请参考http://code.ciaoca.com/jquery/validation-engine/ 或官网文档http://posabsolute.github.io/jQuery-Validation-Engine/
        $("#addBuilding").validationEngine({
            scrollOffset: 98,//必须设置，因为Toolbar position为Fixed
            promptPosition: 'bottomLeft',
            autoHidePrompt: true
        });

        $("#btnSubmit").on(ace.click_event, function () {
            //console.log("validate begin..");
            //console.log($('#addNotify').validationEngine('validate'));
            if ($('#editBuilding').validationEngine('validate')) {
                //submit
            }
        });
        $("#btnSave").on(ace.click_event, function () {
            //console.log("validate begin..");
            //console.log($('#addNotify').validationEngine('validate'));
            if ($('#editBuilding').validationEngine('validate')) {
            	alert("操作成功");
                $('#editBuilding').submit();
            }
        });
        $("#btnReturn").on(ace.click_event, function () {
            window.history.go(-1);
        });
    });
</script>
</body>
</html>
