<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page import="com.penta.backoffice.web.common.controller.CommonController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>

<section id="widget-grid" class=""> 
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-edit"></i> </span>
					<h2>가맹점 신규등록</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body">
						<form class="form-horizontal" id="frmMcht" >
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">가맹점 명 </label>
									<div class="col-md-3">
										<input class="form-control" type="text" name="mcht_nm" data-valid-use="true" data-valid-max='50' data-valid-title="가맹점 명">
									</div>
									<label class="col-md-2 control-label cs-css-05">상태구분 </label>
									<div class="col-md-2">
										<select class="form-control" id="mcht_stts_cd" name="mcht_stts_cd" data-valid-title="상태구분">
											<option value="USE">사용가능</option>
											<option value="STOP">사용중지</option>
											<option value="SEC">탈회</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05 ">대표자 명 </label>
									<div class="col-md-3">
										<input class="form-control" type="text" name="rep_nm" data-valid-use="true" data-valid-max='16' data-valid-title="대표자명">
									</div>
									<label class="col-md-2 control-label cs-css-05">사업자등록번호 </label>
									<div class="col-md-3">
										<input class="form-control" type="number" name="cprt_reg_num" data-valid-use="true" data-valid-min='10' data-valid-max='10' data-valid-num="true" data-valid-title="사업자등록번호">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">대표 전화번호 </label>
									<div class="col-md-3">
										<input class="form-control" type="number" name="rep_tel" data-valid-use="true" data-valid-max='20' data-valid-title="대표전화번호">
									</div>
									<label class="col-md-2 control-label cs-css-05">대표 이메일 </label>
									<div class="col-md-3">
										<input class="form-control" type="email" name="rep_email" data-valid-use="true" data-valid-max='50' data-valid-title="대표이메일">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05" >주소 </label>
									<div class="col-md-2">
										<input class="form-control" type="number" name="zip_code" id="zip_code" data-valid-use="true" data-valid-max='6' data-valid-title="우편번호" onclick="javascript:f_open_find_post_noSD();" disabled="disabled"/>
									</div>	 
									
									<div class="col-md-2">
										<a href="javascript:f_open_find_post_noSD();" class="btn btn-default cs-css-05">우편번호찾기</a>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05" ></label>
									<div class="col-md-4">
										<input class="form-control" type="text" id="address" name="address" data-valid-use="true" data-valid-max='200' data-valid-title="주소" disabled="disabled">
									</div>
									<div class="col-md-4">
										<input class="form-control postcodify_details" type="text" id="address_detail" name="address_detail" maxlength="66" placeholder="상세주소를 입력해 주세요">
									</div>	
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">홈페이지 URL </label>
									<div class="col-md-3">
										<input class="form-control" type="text" name="home_url" maxlength="66" data-valid-title="홈페이지 URL">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">서비스 담당자명 </label>
									<div class="col-md-3">
										<input class="form-control" type="text" name="service_staff_nm" maxlength="50" data-valid-title="서비스 담당자명">
									</div>
									<label class="col-md-2 control-label cs-css-05">긴급 전화번호 </label>
									<div class="col-md-3">
										<input class="form-control" type="number" name="service_staff_tel" maxlength="50" data-valid-title="긴급 전화번호">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">가맹기관 </label>
									<div class="col-md-4">
										<input class="form-control" type="text" id="insti_nm_list" name="insti_nm_list" data-valid-title="가맹기관" disabled="disabled">
										<input class="form-control" type="hidden" id="insti_id_list" name="insti_id_list" value="" />
									</div>	 
									<div class="col-md-2">
										<a href="javascript:f_openInstiListCD();" class="btn btn-default cs-css-05">가맹기관 선택</a>
									</div>
								</div>
							</fieldset>
													
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:f_insertMerchant();" class="btn btn-primary btn_mcht_create">가맹점 신규등록</a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>

<div id="insti_list_cd" style="display: none;"></div>

<form id="frmKeepData">
<%
	Enumeration<?> e = request.getParameterNames();
	while(e.hasMoreElements()){
		String key = (String)e.nextElement();
		String values[] = request.getParameterValues(key);
		for(int i = 0; i < values.length; i++) {
			out.println("<input type=\"hidden\" name=\""+LangUtil.replaceInjection(key)+"\" value=\""+LangUtil.replaceInjection(values[i])+"\" />\n");	
		}
	}
%>
</form>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">

// 가맹기관 선택 팝업
$('#insti_list_cd').dialog({
	autoOpen : false,
	width : 550,
	minHeight: 200,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-eye'></i> 가맹기관 목록 </h6></div>",
	buttons : [{
		html : "<i class='fa fa-times'></i>&nbsp; 닫기",
		"class" : "btn btn-default",
		click : function() {
			$(this).dialog("close");
		}
	}]
});

/**
 * ==================================================================================
 * 페이지 정보 설정
 * ----------------------------------------------------------------------------------
 * 초기 설정 및 필요 UI 컴포넌트 셋팅
 * ==================================================================================
 */
var pagefunction = function() {
}

function f_insertMerchant() {
	// Parameter Validation Check
	if(!$("#frmMcht").formValid()) {
		return;
	}
	
	var params = $('#frmMcht').serializeFormObject();
	
	$.ajax({
	    url: api_url+'/bo/merchant/npmt_bo_02000',
	    type: 'POST',
	    async: true,
	    cache: false,
	    datatype: 'json',
	    contentType: 'application/json;charset=utf-8',
	    data: JSON.stringify(params),
	    success: function(resultData){
	    	alert("가맹점 등록이 정상적으로 처리 되었습니다.");
	    	
	    	$.each($('#menuTree').find('a'), function () {
	    		if($(this).attr('href') == '/application/merchant/merchant/merchantPN.do') {
	    			$(this).click();
	    		}
	    	});
	    },
	    error: function(resultData) {
	    	var serverObj = resultData["responseJSON"];
	    	alert('code:'+serverObj["code"]+'\n'+'message:'+cf_msg(serverObj["message"])+'\n');
	    	return;
	    }
	});
}

/*
 * ==================================================================================
 * 우편번호 검색 팝업 호출
 * ==================================================================================
 */
function f_open_find_post_noSD(){
	daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수
	
	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;
	
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zip_code').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address').value = fullAddr;

	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('address_detail').focus();
	        }
	    }).open();
	});
}


/* ============================================================================================
/* 페이지 셋업 (Don't remove!!!)
/* --------------------------------------------------------------------------------------------
/* 기본 페이지 사용 컴포넌트 호출 및 초기화 작업 진행 
/* ============================================================================================ */
pageSetUp();


/* ============================================================================================
/* 페이지 정보 설정 로드
/* --------------------------------------------------------------------------------------------
/* 컴포넌트 SCRIPT 파일 로드 및 페이지 정보 설정 SCRIPT 로드
/* ============================================================================================ */
// loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/grid.locale-en.min.js", pagefunction);
pagefunction();
</script>