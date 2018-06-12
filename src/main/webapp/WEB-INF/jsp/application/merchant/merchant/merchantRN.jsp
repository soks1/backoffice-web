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
					<h2>가맹점 상세정보</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<form class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">가맹점 ID</label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="mcht_id"></span>
									</div>
									<label class="col-md-2 control-label cs-css-05">대표자 명</label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="rep_nm"></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">사업자번호</label>
									<div class="col-md-3">
										<span class="form-control cs-css-03" id="cprt_reg_num"></span>
									</div>
									<label class="col-md-2 control-label cs-css-05">가맹점 명</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="mcht_nm"></span>
									</div>
									<label class="col-md-1 control-label cs-css-05">상태구분</label>
									<div class="col-md-2">
										<span class="form-control cs-css-03" id="mcht_stts_nm"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">대표전화</label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="rep_tel"></span>
									</div>
									<label class="col-md-2 control-label cs-css-05">대표이메일</label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="rep_email"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">주소</label>
									<div class="col-md-10">
										<span class="form-control cs-css-03" id="addr"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-0">홈페이지 URL</label>
									<div class="col-md-10">
										<span class="form-control cs-css-03" id="home_url"></span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label cs-css-05">서비스 담당자명</label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="service_staff_nm"></span>
									</div>
									<label class="col-md-2 control-label cs-css-05">긴급 전화번호</label>
									<div class="col-md-4">
										<span class="form-control cs-css-03" id="service_staff_tel"></span>
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
									<label class="col-md-2 control-label cs-css-05">가맹기관</label>
									<div class="col-md-10">
										<span class="form-control cs-css-03" id="insti_list"></span>
									</div>
								</div>
							</fieldset>
													
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<% if (!"MCHT".equals(authCd)) { %>
										<a href="javascript:f_merchantList();" class="btn btn-default">가맹점 목록</a>
										<% } %>
										<a href="javascript:f_merchantEdit();" class="btn btn-warning btn_mcht_update">가맹점 정보수정</a>
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

<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2>사용자 정보</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<div class="widget-body-toolbar">
							<div class="row">
								<div class="col-sm-6">
									<p>총 5명까지 사용자 등록이 가능합니다.</p>
								</div>
								<div class="col-sm-6 text-right"">
									<a href="javascript:f_openMchtUserWD();" class="btn btn-primary btn_user_create">사용자 추가</a>
								</div>
							</div>
						</div>
						
						<div class="table-responsive">
							<table class="table table-bordered">
								<colgroup>
									<col width="12%" />
									<col width="12%" />
									<col width="12%" />
									<col width="12%" />
									<col width="12%" />
									<col width="12%" />
									<col width="12%" />
									<col width="auto;" />
								</colgroup>
								<thead>
									<tr>
										<th>ID</th>
										<th>사용자명</th>
										<th>상태</th>
										<th>등록자</th>
										<th>등록일</th>
										<th>수정자</th>
										<th>수정일</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="user_list"></tbody>
							</table>
							
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>

<div id="mcht_user_ed" style="display: none;"></div>
<div id="mcht_user_wd" style="display: none;"></div>

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

// 가맹점 사용자 수정 팝업
$('#mcht_user_ed').dialog({
	autoOpen : false,
	width : 800,
	minHeight: 300,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-eye'></i> 사용자 정보 수정 </h6></div>",
	buttons : [{
		html : "<i class='fa fa-times'></i>&nbsp; 닫기",
		"class" : "btn btn-default",
		click : function() {
			$(this).dialog("close");
		}
	
	}]
});

// 가맹점 사용자 추가 팝업
$('#mcht_user_wd').dialog({
	autoOpen : false,
	width : 800,
	minHeight: 600,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-eye'></i> 사용자 정보 추가 </h6></div>",
	buttons : [{
		html : "<i class='fa fa-times'></i>&nbsp; 닫기",
		"class" : "btn btn-default",
		click : function() {
			$(this).empty();
			$(this).dialog("close");
		}
	
	}]
});

/* ============================================================================================
/* 페이지 정보 설정
/* --------------------------------------------------------------------------------------------
/* 초기 설정 및 필요 UI 컴포넌트 셋팅
/* ============================================================================================ */
var pagefunction = function() {
	var mchtId = $("#frmKeepData").find('input[name=mcht_id]').val();
	
	// 가맹점 관리자 일 경우 해당 가맹점 ID를 세션에서 가져온다.
	var authCd = "<%=authCd%>";
	if (authCd == "MCHT") {
		mchtId = "<%=strCd%>";
	}
	
	$.ajax({
	    url: api_url+"/bo/merchant/npmt_bo_02002", //this is the submit URL
	    type: "GET", // GET or POST
	    async: true,
	    cache: true,
	    datatype: 'json',
	    data: "params="+encodeURI(JSON.stringify({"mcht_id" : mchtId})),
	    beforeSend : function() {},
	    success: function(obj){
	    	var mchtInfo = obj.data.mcht_info;
	    	
	    	$('#mcht_id').html(mchtInfo.mcht_id);
	    	$('#rep_nm').html(mchtInfo.rep_nm);
	    	$('#cprt_reg_num').html(mchtInfo.cprt_reg_num);
	    	$('#mcht_nm').html(mchtInfo.mcht_nm);
	    	$('#mcht_stts_nm').html(mchtInfo.mcht_stts_nm);
	    	$('#rep_tel').html(mchtInfo.rep_tel);
	    	$('#rep_email').html(mchtInfo.rep_email);
	    	$('#addr').html("("+mchtInfo.zip_code+") " + mchtInfo.address + " " + mchtInfo.address_detail);
	    	$('#home_url').html(mchtInfo.home_url);
	    	$('#service_staff_nm').html(mchtInfo.service_staff_nm);
	    	$('#service_staff_tel').html(mchtInfo.service_staff_tel);
	    	$('#reg_nm').html(mchtInfo.reg_nm);
	    	$('#reg_date').html(mchtInfo.reg_date);
	    	$('#mod_nm').html(mchtInfo.mod_nm);
	    	$('#mod_date').html(mchtInfo.mod_date);
	    	$('#insti_list').html(mchtInfo.insti_nm_list);
	    	
	    	getUserInfoList();
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
};

function getUserInfoList() {
	var mchtId = $("#frmKeepData").find('input[name=mcht_id]').val();
	
	// 가맹점 관리자 일 경우 해당 가맹점 ID를 세션에서 가져온다.
	var authCd = "<%=authCd%>";
	if (authCd == "MCHT") {
		mchtId = "<%=strCd%>";
	}
	
	$.ajax({
	    url: api_url+"/bo/merchant/npmt_bo_02005", //this is the submit URL
	    type: "GET", // GET or POST
	    async: true,
	    cache: true,
	    datatype: 'json',
	    data: "params="+encodeURI(JSON.stringify({"mcht_id" : mchtId})),
	    success: function(obj){
	    	var userList = obj.data.user_list
	    	
	    	// 사용자 목록 출력 데이터 초기화
	    	$('#user_list').empty();
	    	
	    	// 사용자 목록 화면 출력
	    	$.each(userList, function(idx, data) {
	    		var userInfo = $('<tr/>');
	    		
	    		userInfo.append($('<td/>').html(data.id));
	    		userInfo.append($('<td/>').html(data.nm));
	    		userInfo.append($('<td/>').html(data.use_yn));
	    		userInfo.append($('<td/>').html(data.reg_nm));
	    		userInfo.append($('<td/>').html(data.reg_date));
	    		userInfo.append($('<td/>').html(data.mod_nm));
	    		userInfo.append($('<td/>').html(data.mod_date));
	    		userInfo.append($('<a/>').attr("href", "javascript:f_openMchtUserED('"+data.id+"');").addClass("btn btn-warning btn_user_update").html("사용자 정보수정"));
	    		
	    		$('#user_list').append(userInfo);
	    	});
	    	
	    	if(userList.length >= 5) {
		    	$('.btn_user_create').hide();
	    	}
	    	else {
	    		$('.btn_user_create').show();
	    	}
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
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
loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/grid.locale-en.min.js", pagefunction);
</script>
