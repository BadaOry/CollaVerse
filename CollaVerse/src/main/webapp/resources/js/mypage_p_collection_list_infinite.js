let currentPage=1;
let isLoding=false;

$(window).on("scroll", function(){
	let scrollTop=$(window).scrollTop();
	let windowHeight=$(window).height();
	let documentHeight=$(document).height();
	let isBottom=scrollTop+windowHeight + 10 >= documentHeight;
	
	if(isBottom){
		if(currentPage == ${totalPageCount} || isLoading){
			return;
		}
		
		isLoading=true;
		
		$(".back-drop").show();
		
		currentPage++;
		
		console.log("inscroll"+currentPage);
		GetList(currentPage);
		
	}
});

const GetList = function(currentPage){
	console.log("inGetList"+currentPage);
	
	$.ajax({
		url:"ajax_page.do",
		method:"GET",
		data:"pageNum="+currentPage,
		success:function(data){
			console.log(data);
			$(".card-list-container").append(data);
			$(".back-drop").hide();
			
			isLoading=false;
			console.log("ajax")
		}
	});
	
	$(document).ready(function(){
		GetList(1)
	});
