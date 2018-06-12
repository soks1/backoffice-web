/**
 * ==================================================================================
 * 공통 : 다이얼로그  TITLE 영역 CSS 변경
 * ==================================================================================
 */
$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
	_title : function(title) {
		if (!this.options.title) {
			title.html("&#160;");
		} else {
			title.html(this.options.title);
		}
	}
}));


/**
 * ==================================================================================
 * 가맹점 : 리스트 화면 가기
 * ==================================================================================
 */
function f_merchantList() {
	var url = "/application/merchant/merchant/merchantLN.do";
	var method = "POST";
	cf_action(url, method, $("#frmKeepData").serialize());
}


/**
 * ==================================================================================
 * 가맹점 : 상세 화면 가기
 * ==================================================================================
 */
function f_merchantInfo() {
	var url = "/application/merchant/merchant/merchantRN.do";
	var method = "POST";
	cf_action(url, method, $("#frmKeepData").serialize());
}


/**
 * ==================================================================================
 * 가맹점 : 수정 화면 가기
 * ==================================================================================
 */
function f_merchantEdit() {
	var url = "/application/merchant/merchant/merchantEN.do";
	var method = "POST";
	cf_action(url, method, $("#frmKeepData").serialize());
}


/**
 * ==================================================================================
 * 리스트 화면 : 검색 이벤트
 * ==================================================================================
 */
function f_search() {
	
	// ------------------ 검색 벨리데이트 시작 ------------------ //
	var searchType 	  = $("#frmSearch").find('input[name=search_type]');
	var searchKeyword = $("#frmSearch").find('input[name=search_keyword]');

	if(searchKeyword.val() == undefined || searchKeyword.val() == '') {
		alert("검색 조건을 입력해 주세요.");
		return;
	}
	
	// ------------------ 검색 벨리데이트 종료 ------------------ //
	
	// 초기화 버튼 추가
	f_addButton();
	
	// 검색 폼 데이터 추출
	var searchData = $("#frmSearch").serializeFormObject();
	
	// 검색 사용 중으로 변경
	$("#merchant_grid").jqGrid('setGridParam', {search: true});
	
	// 첫 페이지 셋팅
	$("#merchant_grid").jqGrid('setGridParam', {page: 1});
	
	// setGridParam을 이용해서 postData에 새로 설정해준 postData의 search에 설정 후 그리드를 다시 불러온다.
	$("#merchant_grid").jqGrid('setGridParam', {'postData' : {'search_info':searchData} }).trigger('reloadGrid');	
}


/**
 * ==================================================================================
 * 리스트 화면 : 검색 초기화 버튼 추가
 * ==================================================================================
 */
function f_addButton() {
	// 중복 취소 버튼 생성을 막기위한 기존 버튼 삭제
	$("#btn_cancel").remove();
	$("#btn_search").parent().append("<a href=\"javascript:void(0)\" id=\"btn_cancel\" onclick=\"f_cancel();\" class=\"btn btn-warning\"><i class=\"fa fa-remove\"></i> 초기화 </a>");
}


/**
 * ==================================================================================
 * 리스트 화면 : 검색 초기화 이벤트
 * ==================================================================================
 */
function f_cancel() {
	// KeepData 폼 안에 input 태그 삭제
	$("#frmKeepData").empty();
	// 검색 초기화 버튼 삭제
	$("#btn_cancel").remove();
	 
	$("#div-coupon-type-cd").show();
	$("#div-exch-goods").hide();
	
	$("#merchant_grid").jqGrid('setGridParam', {search: false});
	$("#merchant_grid").jqGrid('setGridParam', {page: 1});
	// 검색 데이터 초기화 후 그리드 리로드
	$("#merchant_grid").jqGrid('setGridParam', {'postData' : {'search_info':''} }).trigger('reloadGrid');
	// 검색 폼의 항목들 초기화
	$("#frmSearch").cleanObject();
}

/**
 * ==================================================================================
 * 상세 화면 : 사용자 정보 수정 다이얼로그 호출
 * ==================================================================================
 */
function f_openMchtUserED(id) {
	$.ajax({
		url: '/application/merchant/merchant/popup/merchantUserED.do?id='+id,
		type: 'GET',
		async: true,
		cache: false,
		data : {id : id},
		success: function(data) {
			var $target = $('#mcht_user_ed');
			$target.html(data);
		}	
	});
	
	$('#mcht_user_ed').dialog('open');
}

/**
 * ==================================================================================
 * 상세 화면 : 사용자 정보 추가 다이얼로그 호출
 * ==================================================================================
 */
function f_openMchtUserWD() {
	$.ajax({
		url: '/application/merchant/merchant/popup/merchantUserWD.do',
		type: 'GET',
		async: true,
		cache: false,
		success: function(data) {
			var $target = $('#mcht_user_wd');
			$target.html(data);
		}	
	});
	
	$('#mcht_user_wd').dialog('open');
}

/**
 * ==================================================================================
 * 상세 화면 : 가맹기관 선택 다이얼로그 호출
 * ==================================================================================
 */
function f_openInstiListCD() {
	$.ajax({
		url: '/application/merchant/merchant/popup/institutionCD.do',
		type: 'GET',
		async: true,
		cache: false,
		success: function(data) {
			var $target = $('#insti_list_cd');
			$target.html(data);
		}
	});
	
	$('#insti_list_cd').dialog('open');
}

/**
 * ==================================================================================
 * 상세 화면 : 사용자 정보 추가/수정 비밀번호 형식 확인
 * ==================================================================================
 */
function f_passwordCheck(keyStr, str) {
	// 특수문자
	if(!(/[\@\#\$\%\^\&\*\(\)\_\+\!]/.test(str))) {
		alert(keyStr + "의 형식은 대,소문자 및 특수기호를\n포함하여 12글자를 넘어야 합니다.(특수문자)");
		return false;
	}
	
	// 영문 소문자
	if(!(/[a-z]/.test(str))) {
		alert(keyStr + "의 형식은 대,소문자 및 특수기호를\n포함하여 12글자를 넘어야 합니다.(영문 소문자)");
		return false;
	}
	
	// 영문 대문자 
	if(!(/[A-Z]/.test(str))) {
		alert(keyStr + "의 형식은 대,소문자 및 특수기호를\n포함하여 12글자를 넘어야 합니다.(영문 대문자)");
		return false;
	}
	
	// 숫자
	if(!(/[0-9]/.test(str))) {
		alert(keyStr + "의 형식은 대,소문자 및 특수기호를\n포함하여 12글자를 넘어야 합니다.(숫자)");
		return false;
	}
	
	// length
	if(str.length < 12) {
		alert(keyStr + "의 형식은 대,소문자 및 특수기호를\n포함하여 12글자를 넘어야 합니다.(길이)");
		return false;
	}
	
	return true;
}