//jquery tree
$(function() {
	$("#tree").treeview({
		collapsed : false,
		animated : "medium",
		control : "#sidetreecontrol",
		persist : "location"
	});
});

// 아이디 중복 체크
function check_id() {

	var idCheck = 0;

	var inputed = $('input#idzon').val();
	console.log(inputed);

	$.ajax({
		data : inputed,
		url : "idCheck",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			var result = JSON.parse(data);
			// console.log(result.check);
			// console.log(data.check);

			if (result.check > 0) {
				$("#idzon").css("background-color", "#FFCECE");
				$(".id-text").css("margin-bottom", "16px");
				$(".id-text").css("color", "rgb(255, 120, 203)");
				$(".id-text").css("text-align", "center");
				$(".id-text").text("이미 사용 중인 아이디입니다.");
				$("button#joinSubmit").attr("disabled", "true");
			} else if (result.check == 0) {
				$("#idzon").css("background-color", "#B0F6AC");
				$(".id-text").css("margin-bottom", "16px");
				$(".id-text").css("color", "#34aadc");
				$(".id-text").css("text-align", "center");
				$(".id-text").text("사용 가능한 아이디입니다.");
				$("button#joinSubmit").removeAttr("disabled");
			}
		}
	});
};

// 패스워드 체크
function check_pw() {

	var pw = $('input#pw').val();
	var checkPw = $('input#checkPw').val();

	if (pw != "" || pw != null) {
		$(".pw-text").css("margin-bottom", "16px");
		$(".pw-text").css("color", "rgb(255, 120, 203)");
		$(".pw-text").css("text-align", "center");
		$(".pw-text").text("↓ 비밀번호를 한 번 더 입력해주세요.");
	};
	if (pw == checkPw) {
		$("input[name=pw]").css("background-color", "#B0F6AC");
		$(".ok-text").css("margin-bottom", "16px");
		$(".ok-text").css("color", "#34aadc");
		$(".ok-text").css("text-align", "center");
		$(".ok-text").text("사용 가능한 비밀번호입니다.");
		$("button#joinSubmit").removeAttr("disabled");
	} else if (pw != checkPw) {
		$("input[name=pw]").css("background-color", "#FFCECE");
		$(".ok-text").css("margin-bottom", "16px");
		$(".ok-text").css("color", "rgb(255, 120, 203)");
		$(".ok-text").css("text-align", "center");
		$(".ok-text").text("비밀번호를 확인해주세요.");
		$("button#joinSubmit").attr("disabled", "true");
	};
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

var dept_name;
var rank_name;

// 부서 클릭
function click_dept(name, value) {

	var deptNum = name;
	var deptName = value;

	$.ajax({
		data : deptNum,
		url : "join/selectDeptName",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			var result = JSON.parse(data);
			$(".result-dept").html("<" + result.deptname);
			$("input#dept").val(deptNum);
			dept_name = deptName;
		}
	});
};

// 직급 클릭
function click_rank(name, value) {

	var rankNum = name;
	var rankName = value;
	$.ajax({
		data : rankNum,
		url : "join/selectRankName",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			var result = JSON.parse(data);
			$(".result-rank").html(result.rankname + ">");
			$("input#rank").val(rankNum);
			rank_name = rankName;
		}
	});
};

// 확인 버튼
function click_Ok() {
	var realDept = $("input#dept").val();
	var realRank = $("input#rank").val();
	var deptName = $("input#deptName").val();
	var rankName = $("input#rankName").val();

	$("input#realDept").val(realDept);
	$("input#realRank").val(realRank);

	$(".group-text").css("margin-bottom", "16px");
	$(".group-text").css("color", "#34aadc");
	$(".group-text").css("text-align", "center");
	$(".group-text").text(dept_name + "/" + rank_name);

	$('#popupGroup').hide();
	$(".login-wrap").show();

};

// 닫기 버튼
function close_group() {
	$('#popupGroup').hide();
	$(".login-wrap").show();
};

//사용자 입력값 검사
function formCheck() {
	var id = document.joinForm.id.value;
	var name = document.joinForm.name.value;
	var dept = document.joinForm.formDept.value;
	var rank = document.joinForm.formRank.value;
	var pw = $('input#pw').val();
	var repw = $('input#checkPw').val();

	if (id == "" || id == null) {
		alert("아이디를 입력해 주세요.");
		document.joinForm.id.focus();
		return false;
	}
	if (name == "" || name == null) {
		alert("이름을 입력해 주세요.");
		document.joinForm.name.focus();
		return false;
	}
	if (dept == "" || dept == null) {
		alert("부서를 선택해 주세요.");
		document.joinForm.group.focus();
		return false;
	}
	if (rank == "" || rank == null) {
		alert("직급을 선택해 주세요.");
		document.joinForm.group.focus();
		return false;
	}
	if (pw == "" || pw == null) {
		alert("비밀번호를 입력해 주세요.");
		pw.focus();
		return false;
	}
	if (repw == "" || repw == null) {
		alert("비밀번호를 확인해 주세요.");
		repw.focus();
		return false;
	}
	;

	alert("관리자에게 승인 후 이용 가능합니다.")
};
