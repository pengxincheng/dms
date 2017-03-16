function submitAddNotifyForm(){
	$.ajax({
		url : 'addNotify.do',// 跳转到 action	
		data : {
			"notifyTitle" : $("#notifyTitle").val(),
			"notifyContent":$("#my-editor").html()		
		},
		traditional:true,
		type : "post",
		cache : false,
		dataType : "json",
		success : function(data) {
			if (data.result == "true") {
				alert(data.msg);
				window.location.href="findAllNotifies.do";
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