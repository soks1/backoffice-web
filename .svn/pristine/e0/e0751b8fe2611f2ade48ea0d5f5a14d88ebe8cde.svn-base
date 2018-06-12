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
조회 기준 시간 (오늘, 어제) (YYYY-MM-DD hh:mm) 
 * ==================================================================================
 */
function f_getTargetDate() {
	var to = new Date();
	
	var todayDate = to.getFullYear() + "-" + ("0" + (to.getMonth()+1)).slice(-2) + "-" + ("0" + to.getDate()).slice(-2);
	var currentTime = ("0" + to.getHours()).slice(-2) + ":" + ("0" + to.getMinutes()).substr(-2,1) + "0";
	
	to.setDate(to.getDate()-1); //하루 전
	var yesterdayDate = to.getFullYear() + "-" + ("0" + (to.getMonth()+1)).slice(-2) + "-" + ("0" + to.getDate()).slice(-2);
	
	result = { 
			start_date : yesterdayDate + " " + currentTime 
			, end_date : todayDate + " " + currentTime 
		};
	
	return result;
}

/**
 * ==================================================================================
 * 실시간 거래내역 목록 화면 호출
 * ==================================================================================
 */
function f_realLN() {
	var url = '/application/payment/real/paymentRealPN.do';
	var method = 'POST';
	cf_action(url, method, '');
}

/**
 * ==================================================================================
 * 실시간 거래내역 grid 화면 : 검색 이벤트
 * ==================================================================================
 */
function f_search() {
	
	var postdata = $("#tran_jqgrid").jqGrid('getGridParam', 'postData');
	postdata.search_info.pmt_req_type_cd =[];
	
	// 검색 폼 데이터 추출
	var searchData = $("#frmSearch").serializeFormObject();
	
	// checkbox 데이터 추출
	var checkVals = [];
	$('[name=pmt_req_type_cd]:checked').each(function() {
		checkVals.push($(this).val());
	});
	if( checkVals.length > 0) {
		searchData['pmt_req_type_cd'] = checkVals;
	} else {
		searchData['pmt_req_type_cd'] = "";
	}
	
	// ------------------ 검색 벨리데이트 시작 ------------------ //
	if($("#frmSearch").searchValid() != true && checkVals.length < 0 ){
		alert("검색 조건을 입력해 주세요.");
		return;
	}
	// ------------------ 검색 벨리데이트 종료 ------------------ //
	// 초기화 버튼 추가
	f_addButton();
	
	// 검색 사용 중으로 변경
	$("#tran_jqgrid").jqGrid('setGridParam', {search: true});
	
	// 첫 페이지 셋팅
	$("#tran_jqgrid").jqGrid('setGridParam', {page: 1});
	
	// setGridParam을 이용해서 postData에 새로 설정해준 postData의 search에 설정 후 그리드를 다시 불러온다.
	$("#tran_jqgrid").jqGrid('setGridParam', {'postData' : {'search_info':searchData} }).trigger('reloadGrid');
}

/**
 * ==================================================================================
 * 리스트 화면 : 검색 초기화 버튼 추가
 * ==================================================================================
 */
function f_addButton() {
	// 중복 취소 버튼 생성을 막기위한 기존 버튼 삭제
	$("#btn_cancel").remove();
	$("#btn_search").parent().append("<a href=\"javascript:void(0)\" id=\"btn_cancel\" onclick=\"f_searchCancel();\" class=\"btn btn-warning\"><i class=\"fa fa-remove\"></i> 초기화 </a>");
}


/**
 * ==================================================================================
 * 리스트 화면 : 검색 초기화 이벤트
 * ==================================================================================
 */
function f_searchCancel() {
	// 검색 폼의 항목들 초기화
	$("#frmSearch").cleanObject();

	$('input[name=search_start_date]').val(cf_termDate(-1));
	$('input[name=search_end_date]').val(cf_termDate(-1));
	
	$("#frmSearch input:checkbox").prop("checked", true);
	
	// 검색 폼 데이터 추출
	var searchData = $("#frmSearch").serializeFormObject();
	
	// checkbox 데이터 추출
	var checkVals = [];
	$('[name=pmt_req_type_cd]:checked').each(function() {
		checkVals.push($(this).val());
	});
	if( checkVals.length > 0) {
		searchData['pmt_req_type_cd'] = checkVals;
	} else {
		searchData['pmt_req_type_cd'] = "";
	}
	
	$("#tran_jqgrid").jqGrid('setGridParam', {search: true});
	$("#tran_jqgrid").jqGrid('setGridParam', {page: 1});
	// 검색 데이터 초기화 후 그리드 리로드
	$("#tran_jqgrid").jqGrid('setGridParam', {'postData' : {'search_info':searchData} }).trigger('reloadGrid');
	
	$("#btn_cancel").remove();

}

/**
 * ==================================================================================
 * 실시간 거래 정보 셋팅(상세 화면에서 사용)
 * ==================================================================================
 */
function f_realInfoRN() {
	$.ajax({
	    url: api_url + '/bo/transaction/npmt_bo_04002',
	    type: 'GET',
	    async: true,
	    cache: true,
	    datatype: 'json',
	    headers: {'AJAX':true},
	    data: "params="+encodeURI(JSON.stringify($("#frmKeepData").serializeFormObject())),
		beforeSend : function() {
			
		},
		success: function(obj) {
			
			$('.form-horizontal').find('.read-cont').html('&nbsp;');	
			
			// 기본정보
			$('#npmt_order_id').append(obj.data.npmt_order_id);
	    	$('#client_id').append(obj.data.client_id);
	    	$('#card_mcht_no').append(obj.data.card_mcht_no);
	    	$('#pmt_amt').append(cf_setComma(obj.data.pmt_amt)+' 원');
	    	$('#pmt_req_type_cd_nm').append(obj.data.pmt_req_type_cd_nm);
	    	$('#insti_nm').append(obj.data.insti_nm);
	    	$('#insti_id').append(obj.data.insti_id);
	    	$('#mcht_id_nm').append(obj.data.insti_id);
	    	$('#pmt_mthd_id_nm').append(obj.data.mcht_id_nm);
	    	$('#npmt_trs_id').append(obj.data.npmt_trs_id);
	    	$('#appr_no').append(obj.data.appr_no);
	    	$('#reg_date').append(obj.data.reg_date);
	    	$('#appr_date').append(obj.data.appr_date);
	    	if(obj.data.cnl_yn == 'N'){
	    		$("#cnl_yn").append('<a href="javascript:void(0);" class="btn btn-default" onclick="f_cancle(\''+obj.data.npmt_trs_id+'\',\''+obj.data.npmt_order_id+'\');">거래취소</a>');
	    	}else{
	    		if(obj.data.pmt_req_type_cd == 'M_P_CNL_CONF'){
	    			$("#cnl_yn").append(obj.data.reg_date);
	    		}
	    	}
		},
		error: function(obj) {
			cf_errMsg(obj);
	    	return;
	    },
	    complete: function() {
	    	
	    }
	});
}

/**
 * ==================================================================================
 * 거래내역 취소 호출
 * ==================================================================================
 */
function f_cancle(trsId,odrId) {
	if(confirm("승인된 거래내역이 취소됩니다.\n일정 기간이 지난 거래는 취소되지 않을수\n" +
			   "있으니 취소 버튼 클릭후 확인을\n부탁드립니다.")) {
	
		var send_data = $('#frmKeepData').serializeFormObject();
		send_data['npmt_trs_id'] = trsId;
		send_data['npmt_order_id'] = odrId;
		// 실제 데이터 전송
		$.ajax({
			url: api_url + '/bo/transaction/npmt_bo_04006',
		    type: 'POST',
		    async: true,
		    cache: false,
		    datatype: 'json',
		    headers: {'AJAX':true},
		    contentType: 'application/json;charset=utf-8',
		    data: JSON.stringify(send_data),
		    beforeSend : function() {
		    },
		    success: function(obj){
		    	alert("정상 처리 되었습니다.");
		    	f_realLN();
		    },
		    error: function(obj) {
		    	var serverObj = obj["responseJSON"];
		    	alert('code:'+serverObj["code"]+'\n'+'message:'+cf_msg(serverObj["message"])+'\n');
		    	return;
		    }
		});
	}
}








