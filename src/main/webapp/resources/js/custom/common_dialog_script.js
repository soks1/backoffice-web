//----- 공통 다이얼로그 TITLE 영역 CSS 변경 ----- // 
$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
	_title : function(title) {
		if (!this.options.title) {
			title.html("&#160;");
		} else {
			title.html(this.options.title);
		}
	}
}));

//---------- 비컨그룹선택 다이얼로그 화면 구문 ---------- //
$('#beacon_group_sd').dialog({
	autoOpen : false,
	width : 1024,
	minHeight: 768,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-pencil-square-o'></i> 비컨그룹 선택 </h6></div>",
	buttons : [{
		html : "<i class='fa fa-times'></i>&nbsp; 닫기",
		"class" : "btn btn-default",
		click : function() {
			$('#beacon_group_sd').html('');
			$(this).dialog("close");
		}
	}]
});
//---------- 비컨그룹선택 다이얼로그 호출 ---------- //
function f_openBeaconGroupSD(target) {
	$.ajax({
		url: "/application/common/beaconGroupSD.do",
		type: 'GET',
		async: true,
		cache: false,
		data:{targetTbody : target},
		success: function(data) {
			var $target = $('#beacon_group_sd');
			$target.empty();
			$target.html(data);
		}	
	});
	$('#beacon_group_sd').dialog('open');
}

//---------- 비컨선택 다이얼로그 화면 구문 ---------- //
$('#beacon_sd').dialog({
	autoOpen : false,
	width : 1024,
	minHeight: 768,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-pencil-square-o'></i> 비컨 선택 </h6></div>",
	buttons : [{
		html : "<i class='fa fa-times'></i>&nbsp; 닫기",
		"class" : "btn btn-default",
		click : function() {
			$('#beacon_sd').html('');
			$(this).dialog("close");
		}
	}]
});

//---------- 비컨선택 다이얼로그 호출 ---------- //
function f_openBeaconSD(target) {
	$.ajax({
		url: "/application/common/beaconSD.do",
		type: 'GET',
		async: true,
		cache: false,
		data:{targetTbody : target},
		success: function(data) {
			var $target = $('#beacon_sd');
			$target.empty();
			$target.html(data);
		}	
	});
	$('#beacon_sd').dialog('open');
}

//---------- Zone 선택 다이얼로그 화면 구문 ---------- //
$('#zone_sd').dialog({
	autoOpen : false,
	width : 1024,
	minHeight: 768,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-pencil-square-o'></i> Zone 선택 </h6></div>",
	buttons : [{
		html : "<i class='fa fa-times'></i>&nbsp; 닫기",
		"class" : "btn btn-default",
		click : function() {
			$('#zone_sd').html('');
			$(this).dialog("close");
		}
	}]
});

//---------- Zone 선택 다이얼로그 호출 ---------- //
function f_openZoneSD(target, start_dd, end_dd) {
	$.ajax({
		url: "/application/common/zoneSD.do",
		type: 'GET',
		async: true,
		cache: false,
		data:{
			targetTbody : target,
			evt_start_dd : start_dd,
			evt_end_dd : end_dd
		},
		success: function(data) {
			var $target = $('#zone_sd');
			$target.empty();
			$target.html(data);
		}	
	});
	$('#zone_sd').dialog('open');
}

//---------- 상품선택(멀티) 다이얼로그 화면 구문 ---------- //
$('#product_multi_sd').dialog({
	autoOpen : false,
	width : 1024,
	minHeight: 768,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-pencil-square-o'></i> 상품 선택 </h6></div>",
	buttons : [{
		html : "<i class='fa fa-times'></i>&nbsp; 닫기",
		"class" : "btn btn-default",
		click : function() {
			$(this).dialog("close");
		}
	}]
});

//---------- 상품선택(멀티) 다이얼로그 호출 ---------- //
function f_openProductMultiSD(target) {
	$.ajax({
		url: "/application/common/productMultiSD.do",
		type: 'GET',
		async: true,
		cache: false,
		data:{targetTbody : target},
		success: function(data) {
			var $target = $('#product_multi_sd');
			$target.empty();
			$target.html(data);
		}	
	});
	$('#product_multi_sd').dialog('open');
}

//---------- 상품선택 다이얼로그 화면 구문 ---------- //
$('#product_single_sd').dialog({
	autoOpen : false,
	width : 1024,
	minHeight: 768,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-pencil-square-o'></i> 상품 선택 </h6></div>",
	buttons : [{
		html : "<i class='fa fa-times'></i>&nbsp; 닫기",
		"class" : "btn btn-default",
		click : function() {
			$(this).dialog("close");
		}
	}]
});

//---------- 상품선택 다이얼로그 호출 ---------- //
function f_openProductSingleSD(target) {
	$.ajax({
		url: "/application/common/productSingleSD.do",
		type: 'GET',
		async: true,
		cache: false,
		data:{targetTbody : target},
		success: function(data) {
			var $target = $('#product_single_sd');
			$target.empty();
			$target.html(data);
		}	
	});
	$('#product_single_sd').dialog('open');
}

//---------- 쿠폰북선택 다이얼로그 호출 ---------- //
function f_openCpBookSD(target) {
	$.ajax({
		url: "/application/common/couponBookSD.do",
		type: 'GET',
		async: true,
		cache: false,
		data:{targetTbody : target},
		success: function(data) {
			var $target = $('#cpbook_sd');
			$target.empty();
			$target.html(data);
			if(target == 'half_compensation_tbody' || target == 'full_compensation_tbody' || target == 'groupbuy_cpb_tbody'|| target.indexOf('groupbuy_cpb_tbody') == 0 || target == 'cpbook_tbody' || target.indexOf('pedometer_cpb_tbody') == 0) {
				$("select[name=cpbook_type_cd] option[value=A]").prop("selected", true);
				$("select[name=cpbook_type_cd]").attr("disabled", "disabled");
			}
			
			if(target == 'couponBook_tbody') {
				$("select[name=cpbook_type_cd] option[value=D]").remove();
			}
		}	
	});
	$('#cpbook_sd').data("targetTbody", target).dialog('open');
}
//---------- 쿠폰북선택 다이얼로그 호출 ---------- //
function f_openLpotCpBookSD(target) {
	$.ajax({
		url: "/application/common/lpotCouponBookSD.do",
		type: 'GET',
		async: true,
		cache: false,
		data:{targetTbody : target},
		success: function(data) {
			var $target = $('#cpbook_sd');
			$target.empty();
			$target.html(data);
			
			$("select[name=cpbook_type_cd] option[value=A]").prop("selected", true);
			$("select[name=cpbook_type_cd]").attr("disabled", "disabled");
		}	
	});
	$('#cpbook_sd').data("targetTbody", target).dialog('open');
}
//---------- 엘팟 존선택 다이얼로그 호출 ---------- //
function f_openLpotZoneSD(target) {
	if($("input[name=prgs_start_date").val() == "" || $("input[name=prgs_end_date").val() == "") {
		alert("이벤트 기간을 선택 하세요");
		return;
	} else if($("#lpot_custgp").text() == "") {
		alert("고객군을 선택 하세요.");
		return;
	} else {
		$.ajax({
			url: "/application/common/lpotEventZoneSD.do",
			type: 'GET',
			async: true,
			cache: false,
			data:{targetTbody : target},
			success: function(data) {
				var $target = $('#lpot_zone_sd');
				$target.empty();
				$target.html(data);
			}	
		});
		$('#lpot_zone_sd').data("targetTbody", target).dialog('open');
	}
}
//---------- 엘팟 팝업 선택 다이얼로그 호출 ---------- //
function f_openLpotPopupSD(target) {
	if($("#lpot_custgp").text() == "") {
		alert("고객군을 선택 하세요.");
		return;
	}else {
		$.ajax({
			url: "/application/common/lpotEventPopupSD.do",
			type: 'GET',
			async: true,
			cache: false,
			data:{targetTbody : target},
			success: function(data) {
				var $target = $('#popup_sd');
				$target.empty();
				$target.html(data);
			}	
		});
		$('#popup_sd').data("targetTbody", target).dialog('open');
	}
}

//---------- 쿠폰진선택 다이얼로그 호출 ---------- //
function f_openCpZineContentsSD(target) {
	$.ajax({
		url: "/application/common/couponZineContentsSD.do",
		type: 'GET',
		async: true,
		cache: false,
		data:{targetTbody : target},
		success: function(data) {
			var $target = $('#cpzine_contents_sd');
			$target.empty();
			$target.html(data);
		}	
	});
	$('#cpzine_contents_sd').data("targetTbody", target).dialog('open');
}


//---------- 상품선택(멀티) 다이얼로그 화면 구문 ---------- //
//이벤트ID
//EX) f_openRequestCheckSD('PR0000000000086','${sessionScope.sessionEmpno}','0')  // 0:승인요청, 1:승인
function f_openRequestCheckSD(evntId,empno,gbn){
	if(evntId.length == 0){
		alert("유효하지 않은 이벤트ID 입니다.");
		return;	
	}
	
	var dupCheck = "";
	var msg = "";
	msg = "<section id='widget-grid' class='''>";
	msg += "<div class='row' style='padding:0 0 0 20px'>";
	msg += "행사 상품중복여부 확인 결과 아래와 같습니다.<br/><br/>";
	
	var data = {
			empno: empno,
			evnt_id: evntId
		};

	var dupChk = "";
	$.ajax({
		url: api_url+"/backoffice/common/product/request/dupcheck",
		type: "GET", // GET or POST
		async: false,
		cache: true,
		datatype: 'json',
		data: encodeURI("params="+JSON.stringify(data)),
		beforeSend : function() {},	
	    success: function(obj){
	    	//$("#dupCheck").val(obj.data.dupcase);
	    	dupChk = obj.data.dupcase;
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
	//dupCheck = $("#dupCheck").val();
	dupCheck = dupChk;
	
	var aprvNm = "승인요청";
	
	if(gbn == "1"){
		aprvNm = "승인";
	}
	
	$("#dupCheck").val("0");	// 초기화
	// Dialog Btn Controll
	if(dupCheck == "1"){
	 	msg += "오퍼행사 상품 중복 : X<br/>";
	 	msg += "M쿠폰 상품 중복 : X<br/><br/>";
	 	msg += "확인을 클릭하면 " + aprvNm + "이 진행됩니다.";
	}else if(dupCheck == "2"){
	 	msg += "오퍼행사 상품 중복 : O<br/>";
	 	msg += "M쿠폰 상품 중복 : X<br/><br/>";
	 	msg += "확인을 클릭하면 " + aprvNm + "이 진행됩니다.<br/>";
	 	msg += "중복상품은 파일을 다운로드 하시기 바랍니다.";
	}else if(dupCheck == "3"){
	 	msg += "오퍼행사 상품 중복 : O<br/>";
	 	msg += "M쿠폰 상품 중복 : O<br/><br/>";
	 	//msg += "M쿠폰 상품 중복의 경우 " + aprvNm + " 하실수 없습니다.<br/>";
	 	msg += "확인을 클릭하면 " + aprvNm + "이 진행됩니다.<br/>";
	 	msg += "중복된 상품목록은 파일을 다운로드 하여 확인하시기 바랍니다.";
	}else if(dupCheck == "4"){
	 	msg += "오퍼행사 상품 중복 : X<br/>";
	 	msg += "M쿠폰 상품 중복 : O<br/><br/>";
	 	//msg += "M쿠폰 상품이 중복된 경우  " + aprvNm + " 하실수 없습니다.<br/>";
	 	msg += "확인을 클릭하면 " + aprvNm + "이 진행됩니다.<br/>";
	 	msg += "중복된 상품목록은 파일을 다운로드 하여 확인하시기 바랍니다.";
	}else{
		msg += "상품중복체크 중 오류가 발생하였습니다.";
	}
	msg += "</div>";
	msg += "</section>";
	
	$('#request_check').empty();
	
	//alert(msg);
	
	$('#request_check').dialog({
		autoOpen : false,
		width : 400,
		minHeight: 250,
		resizable : false,
		modal : true,
		title : "<div class='widget-header'><h6><i class='fa fa-pencil-square-o'></i> 상품중복체크 결과 </h6></div>"
	});
	
	var myButtons = [
		{
			html : "<i class='fa fa-times'></i>&nbsp; 다운로드",
			"class" : "btn btn-default",
			click : function() {
				var url = api_url+"/backoffice/common/product/request/dupdown?";
				var params = encodeURI("params="+JSON.stringify(data));
				$.fileDownload(url + params);
				$(this).dialog("close");
			}
		}
		,{
			html : "<i class='fa fa-times'></i>&nbsp; 확인",
			"class" : "btn btn-default",
			click : function() {
				f_approve_proc(gbn);		// 승인요청 메소드
				$(this).dialog("close");
			}
		}
		,{
			html : "<i class='fa fa-times'></i>&nbsp; 취소",
			"class" : "btn btn-default",
			click : function() {
				$(this).dialog("close");
			}
		}
	];
	
	if(dupCheck == "1"){
		myButtons.splice(0,1);
	}else if(dupCheck == "2"){
		
	}else if(dupCheck == "3" || dupCheck == "4"){
		//myButtons.splice(1,1);
	}else{
		myButtons.splice(0,2);
	}
	$('#request_check').dialog('option', 'buttons', myButtons);
	$('#request_check').html(msg);
	if(dupCheck != "0"){
		$('#request_check').dialog('open');
	}
}


