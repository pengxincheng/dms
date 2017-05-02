function initTable() {
	
			$.ajax({
				url : 'getBuildingList.do',// 跳转到 action
				
				  data : { 
					  		"buildingName" : $("#buildingName").val(),
					  		"area.areaName" : $("#areaId").val() 
				  		},			 
				traditional : true,
				type : "post",
				cache : false,
				dataType : "json",
				success : function(data) {
					if(data.length > 0){	
						$('#example').DataTable(
								{
									destroy: true,   //是否允许破坏表,重新建
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
												"data" : "buildingId",
												"render" : function(data,type, full, meta) {
													return '<label class="pos-rel"><input type="checkbox" class="ace" class="ace"  value="'
															+ data
															+ '"/><span class="lbl"></span></label>'
												},

											},
											{
												"data" : "buildingName",
												"class" : "align-center"
											},
											{
												"data" : "area.areaName",
												"class" : "align-center"
											},
											{
												"data" : "managerName",
												"class" : "align-center"
											},
											{
												"data" : "totalStuNum",
												"class" : "align-center"
											},
											{
												"data" : "currentStuNum",
												"class" : "align-center"
											},
											{
												"data" : "startTime",
												"class" : "align-center"
											},
											{
												"data" : "endTime",
												"class" : "align-center"
											},
											{
												"data" : "introduct",
												"class" : "align-center",
												render :function(data,type,row){
													if(row.introduct =='男'){
														return row.introduct='男生宿舍';
													}
													else{
														return row.introduct='女生宿舍';
													}
												},
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
													var id = row.buildingId;
													var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getBuildingDetail.do?buildingId="
															+ id
															+ "'><i class='ace-icon fa fa-edit'></i></a>"
													html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delBuilding("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
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
						alert("暂无该宿舍区！");	
					}
				},			
				error : function() {
					// view("异常！");
					alert("异常！");
				}
			});
}
function delBuilding(id){
	if(confirm("确定删除吗？")){
		location.href = "delBuilding.do?buildingId="+id;
		alert("操作成功！");
	 }
}

