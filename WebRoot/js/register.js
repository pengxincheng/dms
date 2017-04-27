function initTable() {
	
			$.ajax({
				url : 'getAllRegisters.do',// 跳转到 action
				
				  data : { 
					  		"name" : $("#name").val(),
					  		"type":"晚归",
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
												"data" : "id",
												"render" : function(data,type, full, meta) {
													return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
															+ data
															+ '"/><span class="lbl"></span></label>'
												},

											},
											{
												"data" : "stu.name",
												"class" : "align-center"
											},
											{
												"data" : "stu.stuNo",
												"class" : "align-center"
											},
											{
												"data" : "stu.stuClass",
												"class" : "align-center"
											},
											{
												"data" : "stu.room.roomSn",
												"class" : "align-center"
											},
											{
												"data" : "registerDate",
												"class" : "align-center"
											},
											{
												"data" : "returnTime",
												"class" : "align-center"
											},
											{
												"data" : "reasion",
												"class" : "align-center"
											},
											{
												"data" : "remark",
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
												"targets" : 9,// 操作按钮目标列
												"data" : null,
												"render" : function(data,
														type, row) {
													var id = row.id;
													var html = "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delRegister("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
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
function delRegister(id){
	if(confirm("确定删除吗？")){
		location.href = "delRegister.do?id="+id;
		alert("操作成功！");
	 }
}

function goToRegisterListFroQueQin(id){
	if(confirm("确定删除吗？")){
		location.href = "delRegisterForQueQin.do?id="+id;
		alert("操作成功！");
	 }
}

function checkStuIsExistByStuNo(){

	$.ajax({
		url : 'checkStuIsExistByStuNo.do',// 跳转到 action
		
		  data : { 
			  		"stuNo" : $("#stuNo").val() 			  		
		  		},			 
		traditional : true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if(data.result){
				if ($('#addRegister').validationEngine('validate')) {
		            alert("操作成功");
		            $('#addRegister').submit();
		        }
			}
			else{
				alert(data.msg);
			}
		},
	});
}

function initTable1() {
	
	$.ajax({
		url : 'getAllRegisters.do',// 跳转到 action
		
		  data : { 
			  		"name" : $("#name").val(),
			  		"type":"缺勤",
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
										"data" : "id",
										"render" : function(data,type, full, meta) {
											return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
													+ data
													+ '"/><span class="lbl"></span></label>'
										},

									},
									{
										"data" : "stu.name",
										"class" : "align-center"
									},
									{
										"data" : "stu.stuNo",
										"class" : "align-center"
									},
									{
										"data" : "stu.stuClass",
										"class" : "align-center"
									},
									{
										"data" : "stu.room.roomSn",
										"class" : "align-center"
									},
									{
										"data" : "registerDate",
										"class" : "align-center"
									},
									{
										"data" : "returnTime",
										"class" : "align-center"
									},
									{
										"data" : "reasion",
										"class" : "align-center"
									},
									{
										"data" : "remark",
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
										"targets" : 9,// 操作按钮目标列
										"data" : null,
										"render" : function(data,
												type, row) {
											var id = row.id;
											var html = "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='goToRegisterListFroQueQin("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
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


