function initTable() {
			$.ajax({
				url : 'getAllStus.do',// 跳转到 action
				
				  data : { 
					  		"name" : $("#name").val(),
					  		"gender":$("#genderYifen").val(),
					  		"roleId" : 3
				  		},			 
				traditional : true,
				type : "post",
				cache : false,
				dataType : "json",
				success : function(data) {
					if(data.length > 0){
						$('#example tbody').html("");
						$('#example').DataTable(
								{
									destroy: true,   //是否允许破坏表
									pageLength : 6,// 每页显示多少条记录
									searching : false,
									lengthChange : true,
									data : data,
									info : false,
									lengthMenu : [ 6, 10, 15, 20 ],
									pagingType : "full_numbers",
									dom : "t<'ths-page'fl><'ths-pager'p>",
									columns : [
											{

												"sClass" : "align-center",
												"data" : "userId",
												"render" : function(data,type, full, meta) {
													return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
															+ data
															+ '"/><span class="lbl"></span></label>'
												},

											},
											{
												"data" : "name",
												"class" : "align-center"
											},
											{
												"data" : "stuNo",
												"class" : "align-center"
											},
											{
												"data" : "stuGrade",
												"class" : "align-center"
											},
											{
												"data" : "stuClass",
												"class" : "align-center"
											},
											{
												"data" : "gender",
												"class" : "align-center",
												
											},
											{
												"data" : "age",
												"class" : "align-center",
											},
											{
												"data" : "room.roomSn",
												"class" : "align-center",
											},
											
											{
												"data" : null,
												"class" : "hidden-xs align-center col-op-ths"
											} ],
									columnDefs : [// 设置列的属性，此处设置第一列不排序
											{
												"bSortable" : false,
												"aTargets" : [ 0 ]
											},
											{
												"class" : "tn",
												"targets" : [ 0 ]
											},
											{
												// 定义操作列,######以下是重点########
												"targets" : 8,// 操作按钮目标列
												"data" : null,
												"render" : function(data,
														type, row) {
													var id = row.userId;
													var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getStuDetail.do?userId="
															+ id
															+ "'><i class='ace-icon fa fa-edit'></i></a>"
													html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delStu("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
													return html;
												}
											} ],

									/*
									 * scrollX:500, fixedColumns: {
									 * leftColumns: 2 },
									 */
									/*
									 * "order": [[ 3, 'asc' ], [ 4, 'desc'
									 * ]],
									 */
									language : {
										paginate : {
											next : "下一页",
											previous : "上一页",
											first : "首页",
											last : "尾页"
										},
										lengthMenu : "每页 _MENU_ 条",
										zeroRecords : "没有找到相关记录。"
									}
								});
					}
					else{
						alert("暂无记录！");	
					}
				},			
				error : function() {
					// view("异常！");
					alert("异常！");
				}
			});
}
function delStu(id){
	if(confirm("确定删除吗？")){
		location.href = "delStu.do?userId="+id;
		alert("操作成功！");
	 }
}

function getBuildingByAreaId(buildingId){
	$("#buildingId").html("");
	$.ajax({
		url : 'getBuildingList.do',// 跳转到 action  
		data : {
			"areaId" : $("#areaId").val(),
		},
		type : "post",
		cache : false,
		async: false,
		dataType : "json",
		success : function(data) {
			var temp = "<option value='' selected='selected'>-请选择-</option>";
			 $.each(data,function(i,n){
				 if(buildingId){
					 if(buildingId == n.buildingId){
						 temp += "<option selected='selected' value='"+n.buildingId+"'>"+n.buildingName+"</option>"						 
					 }
					 else{
						 temp += "<option value='"+n.buildingId+"'>"+n.buildingName+"</option>";
					 }
				 }
				 else{
					 temp += "<option value='"+n.buildingId+"'>"+n.buildingName+"</option>";
				 }
			});
			 $("#buildingId").append(temp);
		},
		error : function() {
			// view("异常！");  
			alert("异常！");
		}
	});
}



function initTableWeifen() {
	$.ajax({
		url : 'getAllStusNotAlloted.do',// 跳转到 action
		  data : { 
			  		"name" : $("#name1").val(),
			  		"gender":$("#genderWeifen").val(),
			  		"roleId" : 3,
			  		"isAlloted":"0"
		  		},			 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if(data.length > 0){
				$('#example1 tbody').html("");
				$('#example1').DataTable(
						{
							destroy: true,   //是否允许破坏表
							pageLength : 6,// 每页显示多少条记录
							searching : false,
							lengthChange : true,
							data : data,
							info : false,
							lengthMenu : [ 6,10, 15, 20 ],
							pagingType : "full_numbers",
							dom : "t<'ths-page'fl><'ths-pager'p>",
							columns : [
									{

										"sClass" : "align-center",
										"data" : "userId",
										"render" : function(data,type, full, meta) {
											return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
													+ data
													+ '"/><span class="lbl"></span></label>'
										},

									},
									{
										"data" : "name",
										"class" : "align-center"
									},
									{
										"data" : "stuNo",
										"class" : "align-center"
									},
									{
										"data" : "stuGrade",
										"class" : "align-center"
									},
									{
										"data" : "stuClass",
										"class" : "align-center"
									},
									{
										"data" : "gender",
										"class" : "align-center",
										
									},
									{
										"data" : "age",
										"class" : "align-center",
									},
									{
										"data" : null,
										"class" : "hidden-xs align-center col-op-ths"
									} ],
							columnDefs : [// 设置列的属性，此处设置第一列不排序
									{
										"bSortable" : false,
										"aTargets" : [ 0 ]
									},
									{
										"class" : "tn",
										"targets" : [ 0 ]
									},
									{
										// 定义操作列,######以下是重点########
										"targets" : 7,// 操作按钮目标列
										"data" : null,
										"render" : function(data,
												type, row) {
											var id = row.userId;
											var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getStuDetail.do?userId="
													+ id
													+ "'><i class='ace-icon fa fa-edit'></i></a>"
											html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delStu("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
											return html;
										}
									} ],

							/*
							 * scrollX:500, fixedColumns: {
							 * leftColumns: 2 },
							 */
							/*
							 * "order": [[ 3, 'asc' ], [ 4, 'desc'
							 * ]],
							 */
							language : {
								paginate : {
									next : "下一页",
									previous : "上一页",
									first : "首页",
									last : "尾页"
								},
								lengthMenu : "每页 _MENU_ 条",
								zeroRecords : "没有找到相关记录。"
							}
						});
			}
			else{
				alert("暂无记录！");	
			}
		},			
		error : function() {
			// view("异常！");
			alert("异常！");
		}
	});
}




function initTableForManager() {
	
	$.ajax({
		url : 'getAllStusForManager.do',// 跳转到 action
		
		  data : { 
			  		"name" : $("#name").val(),
			  		"roleId" : 3
		  		},			 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if(data.length > 0){
				$('#example tbody').html("");
				$('#example').DataTable(
						{
							destroy: true,   //是否允许破坏表
							pageLength : 6,// 每页显示多少条记录
							searching : false,
							lengthChange : true,
							data : data,
							info : false,
							lengthMenu : [ 6, 10, 15, 20 ],
							pagingType : "full_numbers",
							dom : "t<'ths-page'fl><'ths-pager'p>",
							columns : [
									{

										"sClass" : "align-center",
										"data" : "userId",
										"render" : function(data,type, full, meta) {
											return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
													+ data
													+ '"/><span class="lbl"></span></label>'
										},

									},
									{
										"data" : "name",
										"class" : "align-center"
									},
									{
										"data" : "stuNo",
										"class" : "align-center"
									},
									{
										"data" : "stuGrade",
										"class" : "align-center"
									},
									{
										"data" : "stuClass",
										"class" : "align-center"
									},
									{
										"data" : "gender",
										"class" : "align-center",
										
									},
									{
										"data" : "age",
										"class" : "align-center",
									},
									{
										"data" : "room.roomSn",
										"class" : "align-center",
									},
									
									{
										"data" : null,
										"class" : "hidden-xs align-center col-op-ths"
									} ],
							columnDefs : [// 设置列的属性，此处设置第一列不排序
									{
										"bSortable" : false,
										"aTargets" : [ 0 ]
									},
									{
										"class" : "tn",
										"targets" : [ 0 ]
									},
									{
										// 定义操作列,######以下是重点########
										"targets" : 8,// 操作按钮目标列
										"data" : null,
										"render" : function(data,
												type, row) {
											var id = row.userId;
											var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getStuDetail.do?userId="
													+ id
													+ "'><i class='ace-icon fa fa-edit'></i></a>"
											html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delStu("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
											return html;
										}
									} ],
							language : {
								paginate : {
									next : "下一页",
									previous : "上一页",
									first : "首页",
									last : "尾页"
								},
								lengthMenu : "每页 _MENU_ 条",
								zeroRecords : "没有找到相关记录。"
							}
						});
			}
			else{
				alert("暂无记录！");	
			}
		},			
		error : function() {
			// view("异常！");
			alert("异常！");
		}
	});
}

/*导入学生*/
$("#btnImport").click( function () { 
	$('#myModal').modal(); 
});


//JS校验form表单信息  
function checkData(){  
   var fileDir = $("#stuExcell").val();  
   var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
   if("" == fileDir){  
       alert("选择需要导入的Excel文件！");  
       return false;  
   }  
   if(".xls" != suffix && ".xlsx" != suffix ){  
       alert("选择Excel格式的文件导入！");  
       return false;  
   }  
   return true;  
}  





jQuery(function($) {
	// And for the first simple table, which doesn't have TableTools or
	// dataTables
	// select/deselect all rows according to table header checkbox
	var active_class = 'active';
	$('#example > thead > tr > th input[type=checkbox]').eq(0).on('click',
		function() {
			var th_checked = this.checked;// checkbox inside "TH" table// header
			$(this).closest('table').find('tbody > tr').each(function() {
					var row = this;
						if (th_checked)
							$(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
							else
								$(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
						});
			});

	// select/deselect a row when the checkbox is checked/unchecked
	$('#example').on('click', 'td input[type=checkbox]', function() {
		var $row = $(this).closest('tr');
		// if($row.is('.detail-row ')) return;
		if (this.checked)
			$row.addClass(active_class);
		else
			$row.removeClass(active_class);
	});
	
	$('#example1 > thead > tr > th input[type=checkbox]').eq(0).on('click',function() {
				var th_checked = this.checked;// checkbox inside "TH" table// header
				$(this).closest('table').find('tbody > tr').each(function() {
						var row = this;
							if (th_checked)
								$(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
								else
									$(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
							});
				});

		// select/deselect a row when the checkbox is checked/unchecked
		$('#example1').on('click', 'td input[type=checkbox]', function() {
			var $row = $(this).closest('tr');
			// if($row.is('.detail-row ')) return;
			if (this.checked)
				$row.addClass(active_class);
			else
				$row.removeClass(active_class);
		});
});

function getSelectedIds(){
	var checkBoxes = new Array();
	var ids = new Array();
	var j = 0;
	checkBoxes = $('#example1 > tbody > tr > td input[type=checkbox]');
	for(var i=0;i<checkBoxes.length;i++){
		if(checkBoxes[i].checked){
			ids[j] = checkBoxes[i].value;
			j++;
		}
	}
	return ids;
}
//批量删除
$('#btnDelete').click(function(){
	var ids = getSelectedIds();
	if(ids.length != 0){
		$.ajax({
			url : 'batchDeleteStu.do',// 跳转到 action
			
			  data : { 
				  		"ids" :ids
			  		},			 
			traditional : true,
			type : "post",
			cache : false,
			dataType : "json",
			success : function(data){
				alert("操作成功");
				window.location.href="goToStuList.do";
			},
			error:function(){
				alert("系统异常");
			}
		});
	}
	else{
		alert("请先选择！");
	}	
});
//批量分配宿舍
$('#btnAllot').click(function(){
	$('#allot').modal();
	$.ajax({
		url : 'findAllAreas.do',// 跳转到 action	 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data){
			document.getElementById("areaId").options.length=0;
			$("#areaId").append("<option value='' selected='selected'>-请选择-</option>");
			$.each(data,function(n,value){
				$("#areaId").append("<option value="+value.id+">"+value.areaName+"</option>");
			});
		},
		error:function(){
			alert("系统异常");
		}
	});
});

$('#btnSubmitAllot').click(function(){
	var ids = getSelectedIds();
	if(ids.length != 0){
		$.ajax({
			url : 'autoAllot.do',// 跳转到 action
			
			  data : { 
				  		"ids" :ids,
				  		"areaId" :$('#areaId').val()
			  		},			 
			traditional : true,
			type : "post",
			cache : false,
			dataType : "json",
			success : function(data){
				alert("自动分配成功！共选择"+data.total+"人,"+data.alloted+"人已分配");
				window.location.href="goToStuList.do";
			},
			error:function(){
				alert("系统异常");
			}
		});
	}
	else{
		alert("请先选择学生！");
	}	
});

