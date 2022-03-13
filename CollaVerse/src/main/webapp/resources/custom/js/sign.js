//jquery tree
$(function() {
	$("#tree").treeview({
		collapsed : false,
		animated : "medium",
		control : "#sidetreecontrol",
		persist : "location"
	});
});

//signForm 결재경로 지정 클릭
function click_signPath() {
	var url = "signPopup";
	var name = "signPopup";
	var option = "width = 945, height = 460 left = 200, top=30,location=no";
	window.open(url,name,option)
};

// 부서/직급 선택하기 클릭
function click_group() {
	if ($("#popupGroup").css("display") == "none") {
		$(".login-wrap").hide();
		$('#popupGroup').show();
	} else {
		$('#popupGroup').hide();
		$(".login-wrap").show();
	}
};

//부서 클릭
function click_dept(name, value) {
	$(".rank-list").load("selectDeptShowMember?dept_no="+name);
};

//직원 클릭
function click_rank(name, value) {
	//var deptname = $('input#popup-deptname').val();
	//var dept = $('input#popup-dept').val();
	
	var signUser = JSON.stringify({name:name, id:value});
	
	 $.ajax({
			url : 'selectSignUser',
			type : "POST",
			data : signUser,
			dataType : 'json',
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				console.log(data);
				var result = data.list;

				$('#signFinal').append("<tr id = 'tr'><td><select>" +
							"<option value = '1' selected>결재</option>"+
							"<option value = '2'>합의</option>"+
							"<option value = '3'>협의</option>"+
							"<td class='signFinal-dept'>"+
							"<button class='path-button' name='buttondept' value="+result.dept_no+">"+result.deptDto[0].dept_name+"</button>"+
							"</td><td class='signFinal-name'>"+
							"<button class='path-button' name='buttonname' value="+result.name+">"+result.name+"</button>"+
							"</td><td class='signFinal-rank'>"+
							"<button class='path-button' name='buttonrank' value="+result.rank_no+">"+result.rankDto[0].rank_name+"</button>"+
							"</td><td><button type='button' class='cancle-button' onclick='cancle(name);'>취소</buttom>"+
							"</td></tr>"		
				);

				$('div#sign-zone').append(
						"<input type = 'hidden' id = 'member_id' name = 'id' value = "+result.id+">"
						);
				
			}
		});
};

//확인 클릭
function click_Ok() {	
	
	$("#sign-add",opener.document).append(
								"<li>"+
									"<div class = 'sign-left'>"+
	                    				"결<br>재" +
	                    			"</div>"+
	                    		"</li>");
	
	$("button[name=buttonname]").each(function(idx){
			var eqValue = $("button[name=buttonname]:eq("+idx+")").val();
		$('#sign-add',opener.document).append(
								"<li>" +
									"<div class='sign'>" +
										"<div class='sign-top'>"+eqValue+"</div>" +
										"<div class='sign-middle'></div>" +
										"<div class='sign-bottom'></div>" +
									"</div>"+
								"</li>");
		$('div#hidden-sign',opener.document).append(
				"<input type = 'hidden' name = 'signname' value = "+eqValue+">");
		});
	
	$("input#member_id").each(function(idx){
		var eqValue = $("input#member_id:eq("+idx+")").val();
		
		$('div#hidden-sign',opener.document).append(
				"<input type = 'hidden' name = 'sign_id' value = "+eqValue+">");
		});
	
	$("button[name=buttondept]").each(function(idx){
		var eqValue = $("button[name=buttondept]:eq("+idx+")").val();

		$('div#hidden-sign',opener.document).append(
				"<input type = 'hidden' name = 'dept_no' value = "+eqValue+">");
		});
	
	$("button[name=buttonrank]").each(function(idx){
		var eqValue = $("button[name=buttonrank]:eq("+idx+")").val();

		$('div#hidden-sign',opener.document).append(
				"<input type = 'hidden' name = 'rank_no' value = "+eqValue+">");
		});


	window.close();
};

//결재 경로 취소
function cancle(name) {
	$('#tr'+name).remove();
};

//결재 하기
function click_signOK(name){
	
	var sign_no = $('input#sign_no').val();
	
	var signOkValue = JSON.stringify({sign_no:sign_no, id:name});
	
	$.ajax({
		url : "signOK",
		data : signOkValue,
		type : "POST",
		dataType : 'json',
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			alert("결재가 완료되었습니다.");
			location.href="signStay";
			
		}
	});
};