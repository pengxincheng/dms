function initTable() {
			$.ajax({
				url : 'getAllManager.do',// 跳转到 action
				
				  data : { 
					  		"name" : $("#name1").val(),
					  		"gender":$("#genderWeifen").val(),
					  		"roleId" : 2
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
												"data" : "gender",
												"class" : "align-center",
												
											},
											{
												"data" : "age",
												"class" : "align-center",
											},
											{
												"data" : "room.building.buildingName",
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
												"targets" : 5,// 操作按钮目标列
												"data" : null,
												"render" : function(data,
														type, row) {
													var id = row.userId;
													var html = " <a type='button' class='btn btn-sm btn-info btn-white btn-op-ths' title='编辑' href='getManagerDetail.do?userId="
															+ id
															+ "'><i class='ace-icon fa fa-edit'></i></a>"
													html += "<button type='button' class='btn btn-sm btn-danger btn-white btn-op-ths'  title='删除' onclick='delManager("+ id+ ")'><i class='ace-icon fa fa-trash-o'></i></button>"
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
function delManager(id){
	if(confirm("确定删除吗？")){
		location.href = "delManager.do?userId="+id;
		alert("操作成功！");
	 }
}

function getBuilding(buildingId){
	$("#buildingId").html("");
	$.ajax({
		url : 'getBuildingList.do',// 跳转到 action  
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
			url : 'batchDeleteManager.do',// 跳转到 action
			
			  data : { 
				  		"ids" :ids
			  		},			 
			traditional : true,
			type : "post",
			cache : false,
			dataType : "json",
			success : function(data){
				alert("操作成功");
				window.location.href="goToManagerList.do";
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



