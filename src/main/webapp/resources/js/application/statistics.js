/**
 * ==================================================================================
 * 통계 공통: 검색  이벤트
 * ==================================================================================
 */
function f_search() {	
	if($('#frmSearch').formValid() && checkTypeCheckboxCnt()){

		// TODO : 검색 조건에 대한 밸리데이션 체크!
		$("#btn_cancel").remove();	// 중복 취소 버튼 생성을 막기위한 기존 버튼 삭제
		$("#btn_search").parent().append("<a href=\"javascript:void(0)\" id=\"btn_cancel\" onclick=\"f_cancel();\" class=\"btn btn-warning\"><i class=\"fa fa-remove\"></i> 초기화 </a>");

		f_ajaxSubmit();	
	}
}

/**
 * ==================================================================================
 * 통계 공통: 검색 초기화 이벤트
 * ==================================================================================
 */
function f_cancel() {
	// 검색 폼의 항목들 초기화
	$("#frmSearch").cleanObject();

	f_resetCalendar();
	
	$("#frmSearch input:checkbox").prop("checked", true);
	
	f_ajaxSubmit();
	
	$("#btn_cancel").remove();
}


function checkTypeCheckboxCnt() {
	if ($('#frmSearch input:checkbox:checked').length < 1) {
		alert("결제유형(요청,대기,승인,취소,오류) 중 최소한 하나 이상 체크해야 합니다.");
		return false;
	}
	return true;
}
/**
 * ==================================================================================
 * csv 다운로드 
 * ==================================================================================
 */
function f_statCsvDownload(type) {
	
	var url = api_url;
	
	if(type == 'hour') {
		url += "/bo/statistics/npmt_bo_07001";
	} else if(type == 'day') {
		url += "/bo/statistics/npmt_bo_07003";
	} else if(type == 'month') {
		url += "/bo/statistics/npmt_bo_07005";
	} else {
		alert("비정상적인 호출");
		return null;
	}
	
	current_search_data['access_token'] = localStorage.getItem('access_token');
	
	var params = "?" + encodeURI('params='+JSON.stringify(current_search_data));

	$.fileDownload(url + params);
	
}


/**
 * ==================================================================================
 * 기관검색 팝업 호출
 * ==================================================================================
 */
function f_instiSearchRD(){
	$.ajax({
		url: "/application/common/institutionLL.do",
		type: 'GET',
		async: true,
		cache: false,
		success: function(data) {
			var $target = $('#instiSearchRD');
			$target.empty();
			$target.html(data);
		}
	});
	$('#instiSearchRD').dialog('open');
} 


/**
 * ==================================================================================
 * 기관검색 다이얼 로그 설정
 * ----------------------------------------------------------------------------------
 * 다이얼 로그 오픈클릭 이벤트와 다이얼 로그 정보로 구성 함
 * ==================================================================================
 */
 $('#instiSearchRD').dialog({
		autoOpen : false,
		width : 1000,
		minHeight: 600,
		resizable : false,
		position : "top",
		modal : true
	}); 

 
 
 /**
  * ==================================================================================
  * 가맹점 검색 팝업 호출
  * ==================================================================================
  */
 function f_mchtSearchRD(){
 	$.ajax({
 		url: "/application/common/merchantLL.do",
 		type: 'GET',
 		async: true,
 		cache: false,
 		success: function(data) {
 			var $target = $('#mchtSearchRD');
 			$target.empty();
 			$target.html(data);
 		}
 	});
 	$('#mchtSearchRD').dialog('open');
 } 


 /**
  * ==================================================================================
  * 가맹점 검색 다이얼 로그 설정
  * ----------------------------------------------------------------------------------
  * 다이얼 로그 오픈클릭 이벤트와 다이얼 로그 정보로 구성 함
  * ==================================================================================
  */
  $('#mchtSearchRD').dialog({
 		autoOpen : false,
 		width : 1000,
 		minHeight: 600,
 		resizable : false,
 		position : "top",
 		modal : true
 	}); 


