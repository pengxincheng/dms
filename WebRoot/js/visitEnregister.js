function initTable() {
	
			$.ajax({
				url : 'getAllVisitEnregisters.do',// 跳转到 action
				
				  data : { 
					  		"name" : $("#name").val(),
					  		"isLeave" : $("#isLeave").val(),
					  		"inTime" : $("#inTime").val(),
					  		"outTime" : $("#outTime").val()
				  		},			 
				traditional : true,
				type : "post",
				cache : false,
				dataType : "json",
				async:false,
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
									dom: 'Bfrtip',
									buttons: [ {
										
										extend: 'excelHtml5',
										customize: function ( xlsx ){
											var sheet = xlsx.xl.worksheets['sheet1.xml'];

											// jQuery selector to add a border
											$('row c[r*="10"]', sheet).attr( 's', '25' );
										}
									} ],
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
												"data" : "name",
												"class" : "align-center"
											},
											{
												"data" : "gender",
												"class" : "align-center"
											},
											{
												"data" : "tel",
												"class" : "align-center"
											},
											{
												"data" : "visitReasion",
												"class" : "align-center"
											},
											{
												"data" : "startTime",
												"class" : "align-center"
											},
											{
												"data" : "isLeave",
												"class" : "align-center"
											},
											{
												"data" : "endTime",
												"class" : "align-center",
												render: function (data, type, row, meta) {
													if(row.isLeave == '已离开'){
														data = data;
													}
													else{
														data = '';
													}
													 return data;
													}
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
													var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getVisitEnregisterDetail.do?id="
															+ id
															+ "'><i class='ace-icon fa fa-edit'></i></a>"
													html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delVisitEnregister("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
													if(row.isLeave == '未离开'){
														html += "<button type='button' class='btn btn-sm btn-success btn-white btn-op-ths' title='离开' onclick='visitorLeave("+ id+ ")' ><i class='ace-icon fa fa-check'></i>离开</button>";
													}
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
function delVisitEnregister(id){
	if(confirm("确定删除吗？")){
		location.href = "delVisitEnregister.do?id="+id;
		alert("操作成功！");
	 }
}

/*来访者离开*/
function visitorLeave(id){
	if(confirm("确定已离开？")){
		location.href = "visitorLeave.do?id="+id;
		alert("操作成功！");
	 }
}
