//添加notify通知公告
function submitAddNotifyForm(){
	$.ajax({
		url : 'addNotify.do',// 跳转到 action	
		data : {
			"notifyTitle" : $("#notifyTitle").val(),
			"type" : $("#type").val(),
			"notifyContent":$("#my-editor").html()		
		},
		traditional:true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if (data.result == "true") {
				alert(data.msg);
				window.location.href="findAllNotifiesForUser.do";
			} else {
				alert(data.msg);
			}
		},
		error : function() {
			// view("异常！");  
			alert("异常！");
		}
	});
}

//修改通知公告
function submitEditNotifyForm(){
	$.ajax({
		url : 'editNotify.do',// 跳转到 action	
		data : {
			"notifyId" : $("#notifyId").val(),
			"notifyTitle" : $("#notifyTitle").val(),
			"type" : $("#type").val(),
			"notifyContent":$("#my-editor").html()		
		},
		traditional:true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if (data.result == true) {
				alert(data.msg);
				window.location.href="findAllNotifiesForUser.do";
			} else {
				alert(data.msg);
			}
		},
		error : function() {
			// view("异常！");  
			alert("异常！");
		}
	});
}