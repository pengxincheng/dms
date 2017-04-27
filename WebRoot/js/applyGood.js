function initTableWaitSubmit() {
			$.ajax({
				url : 'getAllApplyGoods.do',// 跳转到 action
				
				  data : { 
					  		"status":"待提交"
				  		},			 
				traditional : true,
				type : "post",
				cache : false,
				dataType : "json",
				success : function(data) {
					if(data.length > 0){
						$('#waitSubmitTable tbody').html("");
						$('#waitSubmitTable').DataTable(
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
												"data" : "id",
												"render" : function(data,type, full, meta) {
													return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
															+ data
															+ '"/><span class="lbl"></span></label>'
												},

											},
											{
												"data" : "applyer",
												"class" : "align-center"
											},
											{
												"data" : "room",
												"class" : "align-center"
											},
											{
												"data" : "good",
												"class" : "align-center"
											},
											{
												"data" : "remark",
												"class" : "align-center"
											},
											{
												"data" : "status",
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
												"targets" : 6,// 操作按钮目标列
												"data" : null,
												"render" : function(data,
														type, row) {
													var id = row.id;
													var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getApplyGoodDetail.do?id="
															+ id
															+ "'><i class='ace-icon fa fa-edit'></i></a>"
													html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delApplyGood("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
													html +=	"<button type='button' class='btn btn-sm btn-success btn-white btn-op-ths' title='提交' onclick='submitApplyGood("+ id+ ")' ><i class='ace-icon fa fa-check'></i>提交</button>"
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
function delApplyGood(id){
	if(confirm("确定删除吗？")){
		location.href = "delApplyGood.do?id="+id;
		alert("操作成功！");
	 }
}

function submitApplyGood(id){
	if(confirm("确定提交申请？")){
		location.href = "submitApplyGood.do?id="+id;
		alert("操作成功！");
	 }
}



function initTableWaitAudit() {
	$.ajax({
		url : 'getAllApplyGoods.do',// 跳转到 action
		
		  data : { 
			  		"status":"待审核"
		  		},			 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if(data.length > 0){
				$('#waitAuditTable tbody').html("");
				$('#waitAuditTable').DataTable(
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
										"data" : "id",
										"render" : function(data,type, full, meta) {
											return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
													+ data
													+ '"/><span class="lbl"></span></label>'
										},

									},
									{
										"data" : "applyer",
										"class" : "align-center"
									},
									{
										"data" : "room",
										"class" : "align-center"
									},
									{
										"data" : "good",
										"class" : "align-center"
									},
									{
										"data" : "applyTime",
										"class" : "align-center"
									},
									{
										"data" : "auditMan",
										"class" : "align-center"
									},
									{
										"data" : "remark",
										"class" : "align-center"
									},
									{
										"data" : "status",
										"class" : "align-center",
										
									}
									 ],
							columnDefs : [// 设置列的属性，此处设置第一列不排序
									{
										"bSortable" : false,
										"aTargets" : [ 0 ]
									},
									{
										"class" : "tn",
										"targets" : [ 0 ]
									}
									],
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


function initTableAutdited() {
	$.ajax({
		url : 'getAllApplyGoods.do',// 跳转到 action
		
		  data : { 
			  		"status":"通过"
		  		},			 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if(data.length > 0){
				$('#autidedTable tbody').html("");
				$('#autidedTable').DataTable(
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
										"data" : "id",
										"render" : function(data,type, full, meta) {
											return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
													+ data
													+ '"/><span class="lbl"></span></label>'
										},

									},
									{
										"data" : "applyer",
										"class" : "align-center"
									},
									{
										"data" : "room",
										"class" : "align-center"
									},
									{
										"data" : "good",
										"class" : "align-center"
									},
									{
										"data" : "applyTime",
										"class" : "align-center"
									},
									{
										"data" : "auditMan",
										"class" : "align-center"
									},
									{
										"data" : "auditOpinion",
										"class" : "align-center"
									},
									{
										"data" : "auditTime",
										"class" : "align-center"
									},
									{
										"data" : "status",
										"class" : "align-center",
										
									}
									 ],
							columnDefs : [// 设置列的属性，此处设置第一列不排序
									{
										"bSortable" : false,
										"aTargets" : [ 0 ]
									},
									{
										"class" : "tn",
										"targets" : [ 0 ]
									}
									],
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



function initTableAutditedForManager() {
	$.ajax({
		url : 'getAllApplyGoods.do',// 跳转到 action
		
		  data : { 
			  		"status":"待审核"
		  		},			 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if(data.length > 0){
				$('#waitAuditTable tbody').html("");
				$('#waitAuditTable').DataTable(
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
										"data" : "id",
										"render" : function(data,type, full, meta) {
											return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
													+ data
													+ '"/><span class="lbl"></span></label>'
										},

									},
									{
										"data" : "applyer",
										"class" : "align-center"
									},
									{
										"data" : "room",
										"class" : "align-center"
									},
									{
										"data" : "good",
										"class" : "align-center"
									},
									{
										"data" : "applyTime",
										"class" : "align-center"
									},
									{
										"data" : "auditMan",
										"class" : "align-center"
									},
									{
										"data" : "remark",
										"class" : "align-center"
									},
									{
										"data" : "status",
										"class" : "align-center",
										
									},
									{
										"data" : null,
										"class" : "hidden-xs align-center col-op-ths"
									} 
									 ],
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
											var id = row.id;
											var html =	"<button type='button' class='btn btn-sm btn-success btn-white btn-op-ths'  title='审核' onclick='audit("+ id+ ")' ><i class='ace-icon fa fa-check'></i>审核</button>";
											return html;
										}
									} 
									],
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

function audit(id){
	
	$('#myModal').modal();
	
	$("#submitApply").click(function(){
		var status = $('input:radio[name="status"]:checked').val();
		var auditOponion = $("#auditOponion").val();
		location.href="auditApplyGood.do?id="+id+"&status="+status+"&auditOponion="+auditOponion;
		alert("操作成功！");
		
	});
	
}


