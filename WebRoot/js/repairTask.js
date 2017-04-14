function initTable() {
	
			$.ajax({
				url : 'getAllRepairTasks.do',// 跳转到 action
				
				  data : { 
					  		"repairTaskName" : $("#repairTaskName").val(),
					  		"status":"待修理"
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
									pageLength : 10,// 每页显示多少条记录
									searching : false,
									lengthChange : true,
									data : data,
									info : false,
									lengthMenu : [ 10, 15, 20 ],
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
												"data" : "reporter",
												"class" : "align-center"
											},
											{
												"data" : "address",
												"class" : "align-center"
											},
											{
												"data" : "problemDes",
												"class" : "align-center"
											},
											{
												"data" : "reportTime",
												"class" : "align-center"
											},
											{
												"data" : "dealMan",
												"class" : "align-center"
											},
											{
												"data" : "status",
												"class" : "align-center"
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
						alert("暂无该记录！");	
					}
				},			
				error : function() {
					// view("异常！");
					alert("异常！");
				}
			});
}
function delRepairTask(id){
	if(confirm("确定删除吗？")){
		location.href = "delRepairTask.do?id="+id;
		alert("操作成功！");
	 }
}

function initTableRepaired() {
	
	$.ajax({
		url : 'getAllRepairTasks.do',// 跳转到 action
		
		  data : { 
			  		"repairTaskName" : $("#repairTaskName").val(),
			  		"status":"已修理"
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
							pageLength : 10,// 每页显示多少条记录
							searching : false,
							lengthChange : true,
							data : data,
							info : false,
							lengthMenu : [ 10, 15, 20 ],
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
										"data" : "reporter",
										"class" : "align-center"
									},
									{
										"data" : "address",
										"class" : "align-center"
									},
									{
										"data" : "problemDes",
										"class" : "align-center"
									},
									{
										"data" : "reportTime",
										"class" : "align-center"
									},
									{
										"data" : "dealMan",
										"class" : "align-center"
									},
									{
										"data" : "repairTime",
										"class" : "align-center"
									},
									{
										"data" : "status",
										"class" : "align-center"
									}],
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
				alert("暂无该记录！");	
			}
		},			
		error : function() {
			// view("异常！");
			alert("异常！");
		}
	});
}

function initTableWaitSubmit() {
	
	$.ajax({
		url : 'getAllRepairTasks.do',// 跳转到 action
		
		  data : { 
			  		"repairTaskName" : $("#repairTaskName").val(),
			  		"status":"待提交"
		  		},			 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if(data.length > 0){
				$('#example2 tbody').html("");
				$('#example2').DataTable(
						{
							destroy: true,   //是否允许破坏表
							pageLength : 10,// 每页显示多少条记录
							searching : false,
							lengthChange : true,
							data : data,
							info : false,
							lengthMenu : [ 10, 15, 20 ],
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
										"data" : "reporter",
										"class" : "align-center"
									},
									{
										"data" : "address",
										"class" : "align-center"
									},
									{
										"data" : "problemDes",
										"class" : "align-center"
									},
									{
										"data" : "status",
										"class" : "align-center"
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
										"targets" : 5,// 操作按钮目标列
										"data" : null,
										"render" : function(data,
												type, row) {
											var id = row.id;
											var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getRepairTaskDetail.do?id="
													+ id
													+ "'><i class='ace-icon fa fa-edit'></i></a>"
												html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delRepairTask("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
												html +=	"<button type='button' class='btn btn-sm btn-success btn-white btn-op-ths' title='提交' onclick='submitRepairTask("+ id+ ")' ><i class='ace-icon fa fa-check'></i>提交</button>"
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
				alert("暂无该记录！");	
			}
		},			
		error : function() {
			// view("异常！");
			alert("异常！");
		}
	});
}

function initTableForManagerWaitDeal(){

	$.ajax({
		url : 'getAllRepairTasks.do',
		
		  data : { 
			  		"repairTaskName" : $("#repairTaskName").val(),
			  		"status":"待修理"
		  		},			 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if(data.length > 0){
				$('#example tbody').html("");
				$('#managerWaitDeal').DataTable(
						{
							destroy: true,   //是否允许破坏表
							pageLength : 10,// 每页显示多少条记录
							searching : false,
							lengthChange : true,
							data : data,
							info : false,
							lengthMenu : [ 10, 15, 20 ],
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
										"data" : "reporter",
										"class" : "align-center"
									},
									{
										"data" : "address",
										"class" : "align-center"
									},
									{
										"data" : "problemDes",
										"class" : "align-center"
									},
									{
										"data" : "reportTime",
										"class" : "align-center"
									},
									{
										"data" : "dealMan",
										"class" : "align-center"
									},
									{
										"data" : "status",
										"class" : "align-center"
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
										"targets" : 7,// 操作按钮目标列
										"data" : null,
										"render" : function(data,type, row) {
											var id = row.id;
											var html = "";
											html +=	"<button type='button' class='btn btn-sm btn-success btn-white btn-op-ths' title='修理' onclick='repair("+ id+ ")' ><i class='ace-icon fa fa-check'></i>修理</button>"
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
				alert("暂无该记录！");	
			}
		},			
		error : function() {
			// view("异常！");
			alert("异常！");
		}
	});
}

function submitRepairTask(id){
	if(confirm("确定提交吗？")){
		location.href = "submitRepairTask.do?id="+id;
		alert("操作成功！");
	 }
}

function repair(id){
	if(confirm("确定已修好？")){
		location.href = "repair.do?id="+id;
		alert("操作成功！");
	 }
}
