<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page import="com.penta.backoffice.web.common.controller.CommonController"%>
<%@page import="com.penta.backoffice.web.common.constant.CommonConstant"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%
HttpSession ses = request.getSession(true);
String authCd = (String) ses.getAttribute(CommonConstant.SESSION_AUTH_CD);
%>

<section id="widget-grid" class=""> 
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget" id="wid-id-0" 
				data-widget-colorbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i> </span>
					<h2>거래내역상세정보</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body">
						<form class="form-horizontal">
							<input type="hidden" id="aprv_sts_cd" name="aprv_sts_cd">
							<input type="hidden" id="saved_end_hhmm" name="saved_end_hhmm">
							<input type="hidden" id="evnt_id">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05 ">N-PMT 주문 ID :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="npmt_order_id"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05 ">고객ID :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="client_id"></span>
									</div>
									<% if ("SVC".equals(authCd) || "ADM".equals(authCd)) { %>
									<label class="col-md-1 control-label cs-css-05 ">거래처명 :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="mcht_id_nm"></span>
									</div>
									<% } %>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">온라인몰 주문번호 :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="card_mcht_no"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">금액 :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="pmt_amt"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">거래구분 :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="pmt_req_type_cd_nm"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">금융기관명 :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="insti_nm"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">금융기관 가맹점 ID :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="insti_id"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">결제수단:</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="pmt_mthd_id_nm"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-0">전문추적번호 :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="npmt_trs_id"></span>
									</div>
									<label class="col-md-1 control-label cs-css-0">승인번호 :</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="appr_no"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">요청일시 :</label>
									<div class="col-md-2" id="">
										<span class="form-control cs-css-03" id="reg_date"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">승인일시 :</label>
									<div class="col-md-2" id="">
										<span class="form-control cs-css-03" id="appr_date"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">취소일시 :</label>
									<div class="col-md-2" id="">
										<span id="cnl_yn"></span>
									</div>
								</div>
								
							</fieldset>
													
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:f_realLN();" class="btn btn-default">목록</a>
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
	
	// 가맹기관 상세 데이터 추출
	f_realInfoRN();
};


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