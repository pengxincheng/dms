function initPagination(url,currentPage,totalPages){
	
	var options = {
		    currentPage: 10,//当前页数
		    totalPages: 100,//总页数 注意不是总条数
		    numberOfPages:5,
			bootstrapMajorVersion:3,
			pageUrl: function(type, page, current){
		            if (page==current) {
		                return "javascript:void(0)";
		            } else {
		                return url+page;
		            }
		        }
		}
		$("#pagintor").bootstrapPaginator(options);// $("#pagintor") Bootstrap 是2.X 使用div元素，3.X使用ul元素
}

	