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
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget" id="wid-id-0" 
				data-widget-colorbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-eye"></i> </span>
					<h2>가맹기관 상세정보</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body">
						<form class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05 ">가맹점ID </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="insti_id"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05 ">대표자명 </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="rep_nm"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05 ">금융사 구분 </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="fn_co_cd"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">기관구분 </label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="insti_type_cd"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">사업자등록번호 </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="cprt_reg_num"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">가맹기관명 </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="insti_nm"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">상태구분 </label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="use_yn"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">대표 전화번호 </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="rep_tel"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">대표 이메일 </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="rep_email"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05" >주소 </label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="zip_code"></span>
									</div>	 
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05" ></label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="address"></span>
									</div>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="address_detail"></span>
									</div>	
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">홈페이지 URL </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="home_url"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">서비스담당자명 </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="service_staff_nm"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">긴급전화번호 </label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="service_staff_tel"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">적용가맹점 </label>
									<div class="col-md-9">
										<span class="form-control cs-css-03" id="mcht_nm"></span>
									</div>
								</div>
							</fieldset>
													
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<% if (!"MCHT".equals(authCd)) { %>
										<a href="javascript:f_instiLN();" class="btn btn-default">가맹기관 목록</a>
										<% } %>
										<a href="javascript:f_institutionUpdate();" class="btn btn-warning btn_mcht_update">가맹기관 정보수정</a>
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
	f_instiInfoRN();
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