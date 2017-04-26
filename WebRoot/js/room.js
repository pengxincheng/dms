function initTable() {
	
			$.ajax({
				url : 'getAllRooms.do',// 跳转到 action
				
				  data : { 
					  		"roomSn" : $("#roomSn").val() 			  		
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
												"data" : "roomId",
												"render" : function(data,type, full, meta) {
													return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
															+ data
															+ '"/><span class="lbl"></span></label>'
												},

											},
											{
												"data" : "roomSn",
												"class" : "align-center"
											},
											{
												"data" : "building.area.areaName",
												"class" : "align-center"
											},
											{
												"data" : "building.buildingName",
												"class" : "align-center"
											},
											{
												"data" : "type",
												"class" : "align-center",
												render: function (data, type, row, meta) {
													       
													if(data == '4'){
														data = '四人间';
													}
													else{
													    data = '六人间';
													}
													    return data;
												}
											},
											{
												"data" : "isfiled",
												"class" : "align-center",
												 render: function (data, type, row, meta) {
												       
													 if(data == '0'){
														 data = '已住满';
													 }
													 else{
														 data = '未住满';
													 }
												        return data;
												    }
													
											},
											{
												"data" : "introduct",
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
												"targets" : 7,// 操作按钮目标列
												"data" : null,
												"render" : function(data,
														type, row) {
													var id = row.roomId;
													var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getRoomDetail.do?roomId="
															+ id
															+ "'><i class='ace-icon fa fa-edit'></i></a>"
													html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delRoom("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
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
						alert("暂无该宿舍区！");	
					}
				},			
				error : function() {
					// view("异常！");
					alert("异常！");
				}
			});
}
function delRoom(id){
	if(confirm("确定删除吗？")){
		location.href = "delRoom.do?roomId="+id;
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



function initTableForManager() {
	
	$.ajax({
		url : 'getAllRoomsForManager.do',// 跳转到 action
		
		  data : { 
			  		"roomSn" : $("#roomSn").val() 			  		
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
										"data" : "roomId",
										"render" : function(data,type, full, meta) {
											return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
													+ data
													+ '"/><span class="lbl"></span></label>'
										},

									},
									{
										"data" : "roomSn",
										"class" : "align-center"
									},
									{
										"data" : "building.area.areaName",
										"class" : "align-center"
									},
									{
										"data" : "building.buildingName",
										"class" : "align-center"
									},
									{
										"data" : "type",
										"class" : "align-center",
										render: function (data, type, row, meta) {
											       
											if(data == '4'){
												data = '四人间';
											}
											else{
											    data = '六人间';
											}
											    return data;
										}
									},
									{
										"data" : "isfiled",
										"class" : "align-center",
										 render: function (data, type, row, meta) {
										       
											 if(data == '0'){
												 data = '已住满';
											 }
											 else{
												 data = '未住满';
											 }
										        return data;
										    }
											
									},
									{
										"data" : "introduct",
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
										"targets" : 7,// 操作按钮目标列
										"data" : null,
										"render" : function(data,
												type, row) {
											var id = row.roomId;
											var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getRoomDetail.do?roomId="
													+ id
													+ "'><i class='ace-icon fa fa-edit'></i></a>"
											html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delRoom("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
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
