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
					<h2>공지사항 신규등록</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body">
						<form class="form-horizontal" id="frmNoti" >
							<input type="hidden" name="atch_file_yn" value="N" />
							
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">제목 </label>
									<div class="col-md-1">
										<select class="form-control" id="noti_divn_cd" name="noti_divn_cd"></select>
									</div>
									<div class="col-md-5">
										<input class="form-control" type="text" name="title" data-valid-use="true" data-valid-max='200' data-valid-title="제목">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">첨부파일 </label>
									<div class="col-md-3">
										<input class="form-control" type="text" name="atch_file_nm" value="" disabled="disabled" />
									</div>
									<div class="col-md-2">
										<div id="btn_atch_file_choice">
											<span class="btn btn-success fileinput-button">
											    <i class="glyphicon glyphicon-plus"></i>
											    <span>파일선택</span>
											    <input type="file" id="atch_file" name="atch_file">
											</span>
										</div>
										<div id="btn_atch_file_delete" style="display:none;">
											<span class="btn btn-danger fileinput-button file_minus">
											    <i class="glyphicon glyphicon-minus"></i>
											    <span>파일삭제</span>
											</span>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05 ">대상 가맹점 </label>
									<div class="col-md-8">
										<input class="form-control" type="text"   id="mcht_nm_list" name="mcht_nm_list" disabled="disabled"/>
										<input class="form-control" type="hidden" id="mcht_id_list" name="mcht_id_list" />
									</div>
									<div class="col-md-2">
										<a href="javascript:f_openMchtListCD();" class="btn btn-success">가맹점 선택</a>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">내용 </label>
									<div class="col-md-10">
										<textarea class="form-control" name="content" rows="10" data-valid-use='true' data-valid-title="공지내용"></textarea>
									</div>
								</div>
							</fieldset>
													
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:f_noticeList();" class="btn btn-default">취소</a>
										<a href="javascript:f_insertNotice();" class="btn btn-primary btn_noti_create">공지사항 신규등록</a>
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

<div id="mcht_list_cd" style="display: none;"></div>

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

<script type="text/javascript">

// 공지 구분 코드 조회
f_ajaxCommonCode({
	target:"select[name=noti_divn_cd]", 
	cd_divn_id: "NOTI_CD",
	codeId : "",
	fnSuccess : ""
});

/**
* ==================================================================================
* 등록/수정 : 파일 업로드
* ==================================================================================
*/
$('#atch_file').on('change', function (e) {
	var fileNm = $(this).val();
	$('input[name=atch_file_nm]').val(fileNm.substring(fileNm.lastIndexOf("\\")+1, fileNm.length));
	$('input[name=atch_file_yn]').val('Y');
	
	$('#btn_atch_file_choice').hide();
	$('#btn_atch_file_delete').show();
});

$('.file_minus').on('click', function (e) {
	$('input[name=atch_file_nm]').val('');
	$('input[name=atch_file_yn]').val('N');
	
	$('#btn_atch_file_choice').show();
	$('#btn_atch_file_delete').hide();
});

// 가맹기관 선택 팝업
$('#mcht_list_cd').dialog({
	autoOpen : false,
	width : 800,
	minHeight: 200,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-eye'></i> 가맹점 목록 </h6></div>",
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

function f_insertNotice() {
	// Parameter Validation Check
	if(!$("#frmNoti").formValid()) {
		return;
	}
	
	// 폼 객체 생성
	var formData = new FormData();
	var atchFileYn = $('#frmNoti').find('input[name=atch_file_yn]').val();
	
	if(atchFileYn == "Y") {
		var fileData = $('#atch_file')[0].files[0];
		
		if(fileData.name.indexOf('.txt') > -1) {
			alert("텍스트 파일은 첨부파일로 저장 할 수 없습니다.");
			return;
		}
		
		formData.append('file', fileData, encodeURI(fileData.name));
	}
	
	formData.append('access_token', localStorage.getItem("access_token"));
	formData.append('atch_file_yn', $('#frmNoti').find('input[name=atch_file_yn]').val());
	formData.append('noti_divn_cd', $('#frmNoti').find('select[name=noti_divn_cd]').val());
	formData.append('title'		  , $('#frmNoti').find('input[name=title]').val());
	formData.append('mcht_id_list', $('#frmNoti').find('input[name=mcht_id_list]').val());
	formData.append('content'	  , $('#frmNoti').find('textarea[name=content]').val());
	
	if(!confirm("해당 내용으로 공지사항이 등록됩니다.")) {
		return;
	}
	
	$.ajax({
	    url: api_url+'/bo/notice/npmt_bo_02200',
	    type: 'POST',
	    data: formData,
	    async: true,
	    cache: false,
	    dataType: 'json',
		contentType: false,
		processData: false,
	    success: function(resultData){
	    	alert("공지사항 등록이 정상적으로 처리 되었습니다.");
	    	
	    	f_noticeList();
	    },
	    error: function(resultData) {
	    	var serverObj = resultData["responseJSON"];
	    	alert('code:'+serverObj["code"]+'\n'+'message:'+cf_msg(serverObj["message"])+'\n');
	    	return;
	    }
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