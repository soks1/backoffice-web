<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page import="com.penta.backoffice.web.common.constant.CommonConstant"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.Enumeration"%>
<%
	HttpSession ses = request.getSession(true);
	String authCd = (String) ses.getAttribute(CommonConstant.SESSION_AUTH_CD);
	
	String strCd = "";
	if ("MCHT".equals(authCd)) {
		strCd = (String) ses.getAttribute(CommonConstant.SESSION_STR_CD);
	}
%>

<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i> </span>
					<h2>공지사항 상세정보</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<form class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">제목</label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="view_title"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">등록자</label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="reg_nm"></span>
									</div>
									<label class="col-md-2 control-label cs-css-05">등록일시</label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="reg_date"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">최종수정자</label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="mod_nm"></span>
									</div>
									<label class="col-md-2 control-label cs-css-05">최종수정일시</label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="mod_date"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">첨부파일</label>
									<div class="col-md-4" id="atch_file_div"></div>
								</div>
								
								<% if (!"MCHT".equals(authCd)) { %>
								<div class="form-group">
									<input type="hidden" id="tot_mcht_list"  value="" />
									<input type="hidden" id="read_mcht_list" value="" />
									
									<label class="col-md-2 control-label cs-css-05">대상 가맹점</label>
									<div class="col-md-10">
										<span class="form-control cs-css-03" id="read_mcht"></span>
										<br/>
										<span class="form-control cs-css-03" id="not_read_mcht"></span>
									</div>
								</div>
								<% } %>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">공지사항 내용</label>
									<div class="col-md-10">
										<textarea class="form-control cs-css-03" id="view_content" rows="5" readonly="readonly"></textarea>
									</div>
								</div>
							</fieldset>
													
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:f_noticeList();" class="btn btn-default">공지사항 목록</a>
										<% if (!"MCHT".equals(authCd)) { %>
										<a href="javascript:f_deleteNotice();"  class="btn btn-danger" style="float:left;">공지사항 삭제</a>
										<a href="javascript:f_goNoticeEdit();" class="btn btn-warning">공지사항 수정</a>
										<% } %>
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

/* ============================================================================================
/* 페이지 정보 설정
/* --------------------------------------------------------------------------------------------
/* 초기 설정 및 필요 UI 컴포넌트 셋팅
/* ============================================================================================ */
var pagefunction = function() {
	var notiId = $("#frmKeepData").find('input[name=noti_id]').val();
	
	$.ajax({
	    url: api_url+"/bo/notice/npmt_bo_02202", //this is the submit URL
	    type: "GET", // GET or POST
	    async: true,
	    cache: true,
	    datatype: 'json',
	    data: "params="+encodeURI(JSON.stringify({"noti_id" : notiId})),
	    beforeSend : function() {},
	    success: function(obj){
	    	var noticeInfo = obj.data.notice_info;
	    	
	    	$('#view_title').html(noticeInfo.view_title);
	    	
	    	$('#read_mcht').html('<i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i>&nbsp;&nbsp;' + noticeInfo.read_mcht);
	    	$('#not_read_mcht').html('<i class="glyphicon glyphicon-eye-close" aria-hidden="true"></i>&nbsp;&nbsp;' + noticeInfo.not_read_mcht);
	    	
	    	$('#tot_mcht_list').val(noticeInfo.mcht_id_list);
	    	$('#read_mcht_list').val(noticeInfo.read_mcht);
	    	
	    	$('#reg_nm').html(noticeInfo.reg_nm);
	    	$('#reg_date').html(noticeInfo.reg_date);
	    	$('#mod_nm').html(noticeInfo.mod_nm);
	    	$('#mod_date').html(noticeInfo.mod_date);
	    	
	    	var tag = '';
	    	if(noticeInfo.view_file_nm != '') {
	    		tag += '<a href="javascript:f_atchDownload(\''+notiId+'\');" id="atch_file_nm">';
	    		tag += noticeInfo.view_file_nm + '&nbsp;&nbsp;<span class="widget-icon"><i class="fa fa-file"></i></span>';
	    		tag += '</a>';
	    	}
	    	else {
	    		tag += '<span class="form-control cs-css-03">없음</span>';
	    	}
	    	
    		$('#atch_file_div').html(tag);
	    	$('#view_content').val(noticeInfo.content);
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
};

function f_goNoticeEdit() {
	var totMchtCnt = 0;
	if($('#tot_mcht_list').val() != '') {
		totMchtCnt = $('#tot_mcht_list').val().split(",").length;
	}
	
	var readMchtCnt = 0;
	if($('#read_mcht_list').val() != '') {
		readMchtCnt = $('#read_mcht_list').val().split(",").length;
	}
	
	var confirmMsg = "설정된 총 " + totMchtCnt + "의 업체 중 " + readMchtCnt + "개의 업체가 공지를 확인 하였습니다.\n해당 공지사항을 수정 하시겠습니까?"
	
	if(confirm(confirmMsg)) {
		f_noticeEdit();
	}
}

function f_deleteNotice() {
	var totMchtCnt = 0;
	if($('#tot_mcht_list').val() != '') {
		totMchtCnt = $('#tot_mcht_list').val().split(",").length;
	}
	
	var readMchtCnt = 0;
	if($('#read_mcht_list').val() != '') {
		readMchtCnt = $('#read_mcht_list').val().split(",").length;
	}
	
	var confirmMsg = "설정된 총 " + totMchtCnt + "의 업체 중 " + readMchtCnt + "개의 업체가 공지를 확인 하였습니다.\n해당 공지사항을 삭제 하시겠습니까?"
	
	if(confirm(confirmMsg)) {
		var data = {
				"noti_id" : $("#frmKeepData").find('input[name=noti_id]').val()
			};
		
		$.ajax({
		    url: api_url+'/bo/notice/npmt_bo_02204',
		    type: 'POST',
		    async: true,
		    cache: false,
		    datatype: 'json',
		    contentType: 'application/json;charset=utf-8',
		    data: JSON.stringify(data),
		    success: function(resultData){
		    	alert("공제사항 삭제가 정상적으로 처리 되었습니다.");
		    	
		    	f_noticeList();
		    },
		    error: function(resultData) {
		    	var serverObj = resultData["responseJSON"];
		    	alert('code:'+serverObj["code"]+'\n'+'message:'+cf_msg(serverObj["message"])+'\n');
		    	return;
		    }
		});
	}
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
loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/grid.locale-en.min.js", pagefunction);
</script>
