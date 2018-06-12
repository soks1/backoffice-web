<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page import="com.penta.backoffice.web.common.controller.CommonController"%>
<%@page import="com.penta.backoffice.web.common.constant.CommonConstant"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%
HttpSession ses = request.getSession(true);
String authCd = (String) ses.getAttribute(CommonConstant.SESSION_AUTH_CD);
%>

<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" 
				data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-search"></i></span>
					<h2> 조회 조건 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<form id="frmSearch" class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-1 control-label">기관 선택</label>
									<div class="col-md-2">
										<input class="form-control" type="text" id="insti_id" name="insti_id" placeholder="기관 ID">
									</div>
									<div class="col-md-2">
										<div class="input-group">
											<input class="form-control" type="text" id="insti_nm" name="insti_nm" placeholder="전체(금융기관)"  readonly="readonly">
											<div class="input-group-btn">
												<a href="javascript:void(0);" class="btn btn-default bg-color-blueDark txt-color-white" onclick="f_instiSearchRD();">검색</a>
											</div>
										</div>
									</div>
									<% if ("SVC".equals(authCd) || "ADM".equals(authCd)) { %>
									<label class="col-md-1 control-label">가맹점 선택</label>
									<div class="col-md-2">
										<input class="form-control" type="text" id="mcht_id" name="mcht_id" placeholder="가맹점ID">
									</div>
									<div class="col-md-2">
										<div class="input-group">
											<input class="form-control" type="text" id="mcht_nm" name="mcht_nm" placeholder="가맹점명"  readonly="readonly">
											<div class="input-group-btn">
												<a href="javascript:void(0);" class="btn btn-default bg-color-blueDark txt-color-white" onclick="f_mchtSearchRD();">검색</a>
											</div>
										</div>
									</div>
									<% } %>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label">N-PMT 주문ID</label>
									<div class="col-md-2">
										<input class="form-control" type="text" id="npmt_order_id" name="npmt_order_id">
									</div>
									<label class="col-md-1 control-label"></label>
									<div class="col-md-4 control-label">
										24시간 기준(&nbsp;<span id="stat_start_date"></span>&nbsp;~&nbsp;<span id="stat_end_date"></span>&nbsp;)
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label">구분</label>
									<div class="col-md-4">
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" name="pmt_req_type_cd" value="M_ODR" checked="checked"><span>요청</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" name="pmt_req_type_cd" value="P_SIGN" checked="checked"><span>대기</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" name="pmt_req_type_cd" value="M_P_CONF" checked="checked"><span>승인</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" name="pmt_req_type_cd" value="M_P_CNL_CONF" checked="checked"><span>취소</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" name="pmt_req_type_cd" value="9999" checked="checked"><span>오류</span>
										</label>
									</div>
								</div>
							</fieldset>
							
							<div class="form-actions mt0">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:void(0)" id="btn_search" onclick="f_search();" class="btn btn-success"><i class="fa fa-search"></i> 조회 </a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</article>
	</div>
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" 
				data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2>거래내역 실시간 조회 목록</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div id="tran_jqgrid_section" class="widget-body no-padding">
						<table id="tran_jqgrid"></table>
						<div id="tran_jqgrid_page"></div>
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
<div id="instiSearchRD" style="display:none;"></div>
<div id="mchtSearchRD" style="display:none;"></div>
<script type="text/javascript">

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
	modal : true,
	title : "<div class='widget-header'><h6> 기관검색 </h6></div>",
}); 

/**
 * ==================================================================================
 * 가맹점검색 팝업 호출
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
			$target.html(data);
		}
	});
	$('#mchtSearchRD').dialog('open');
} 
/**
 * ==================================================================================
 * 가맹점검색 다이얼 로그 설정
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
	modal : true,
}); 

/* ============================================================================================
/* 페이지 정보 설정
/* --------------------------------------------------------------------------------------------
/* 초기 설정 및 필요 UI 컴포넌트 셋팅
/* ============================================================================================ */
var pagefunction = function() {
	
	var targetDate = f_getTargetDate();
	
	$('#stat_start_date').html(targetDate.start_date);
	$('#stat_end_date').html(targetDate.end_date);
	
	// 검색 폼 데이터 추출
	var searchData = $("#frmSearch").serializeFormObject();
	// checkbox 데이터 추출
	var checkVals = [];
	$('[name=pmt_req_type_cd]:checked').each(function() {
		checkVals.push($(this).val());
	});
	
	loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/jquery.jqGrid.min.js", run_jqgrid_function);

	function run_jqgrid_function() {
		
		var pageWidth = $("#tran_jqgrid").parent().width() - 100;

		jQuery("#tran_jqgrid").jqGrid({
			url : api_url + "/bo/transaction/npmt_bo_04000",
			mtype: 'GET',
			datatype : "json",
			colNames : ['N-PMT주문ID', '결제수단', '금액', '거래구분', '거래일자', '고객ID', '거래취소', '트랜젝션ID'],
			colModel : [
				{ name : 'npmt_order_id', 		index : 'npmt_order_id',	align : "center",	sortable : false, 	width : (pageWidth*(10/100)), classes:'pointer'},  
				{ name : 'pmt_mthd_id_nm', 		index : 'pmt_mthd_id_nm',	align : "center", 	sortable : false, 	width : (pageWidth*(10/100))},
				{ name : 'pmt_amt', 			index : 'pmt_amt',			align : "center", 	sortable : false, 	width : (pageWidth*(10/100)),
					formatter : function(cellvalue, options, rowObject) {
						return cf_setComma(cellvalue)+' 원'; 
					}	
				}, 
				{ name : 'pmt_req_type_cd_nm', 	index : 'pmt_req_type_cd_nm',	align : "center", 	sortable : false, 	width : (pageWidth*(10/100))}, 
				{ name : 'reg_date', 			index : 'reg_date',			align : "center", 	sortable : false, 	width : (pageWidth*(20/100))},
				{ name : 'client_id', 			index : 'client_id',		align : "center", 	sortable : false, 	width : (pageWidth*(20/100))},
				{ name : 'cnl_yn', 				index : 'cnl_yn',	align : "center", 	sortable : false, 	width : (pageWidth*(15/100)),
					formatter : function(cellvalue, options, rowObject) {
						var rtnStr = '';
						if(cellvalue == 'Y') {
							rtnStr = '';
						} else if(cellvalue == 'N') {
							rtnStr = '<a href="javascript:void(0);" class="btn btn-default" onclick="f_cancle(\''+rowObject.npmt_trs_id+'\',\''+rowObject.npmt_order_id+'\');">거래취소</a>'
						} 
						
						return rtnStr;
					}
				},
				{ name : 'npmt_trs_id',			index : 'npmt_trs_id',		hidden: true,	 	width : 0 	}
			],
			jsonReader: {
				repeatitems : false,
				id : "npmt_trs_id",
				root : 		function(obj){ return obj.data.transaction_list; },		// 루트가 될 데이터 셋 명칭
				records : 	function(obj){ return obj.data.page_info.records; 	},	// 총 레코드 수
				page : 		function(obj){ return obj.data.page_info.page; 		}, 	// 현재 보여지는 페이지
				total : 	function(obj){ return obj.data.page_info.total; 		}	// 페이지 블럭수
			},
			serializeRowData: function (postData) { return encodeURI("params="+JSON.stringify(postData)); },
			serializeGridData: function(postData) {
				
				/* 기존 검색 조건 유지 부분 */
				var _search = $("#frmKeepData").find("input[name=_search]");
				var page = $("#frmKeepData").find("input[name=page]");
				var rows = $("#frmKeepData").find("input[name=rows]");
				
				/* SEARCH_INFO : 기존에 검색 조건 등록 */
				if(_search.val() == "true") {
					
					// 기존 검색 데이터 등록(특별한거는 따로 해야 함!)
					cf_keepDataLoader($("#frmKeepData"),$("#frmSearch"));
					
					// 검색 폼 데이터 추출 및 post data 등록
					var searchData = $("#frmSearch").serializeFormObject();	// 검색 폼 데이터 추출
					postData._search = true;
					$("#tran_jqgrid").jqGrid('setGridParam', {search: true});
					$("#tran_jqgrid").jqGrid('setGridParam', {'postData' : {'search_info':searchData} });
					f_addButton();
				}
				
				/* PAGE_INFO : 현재 페이지 정보 */
				if(page.val() != undefined) {
					postData.page = parseInt(page.val());
				}
				
				/* PAGE_INFO : 페이지 아이템 정보 */
				if(rows.val() != undefined) {
					$("#tran_jqgrid_page").find(".ui-pg-selbox").val(rows.val()).attr("selected", "selected");
					postData.rows = parseInt(rows.val());
					$("#tran_jqgrid").jqGrid('setGridParam', {'rowNum' : parseInt(rows.val()) });
				}
									
				// 기존 Keep Data 삭제
				$("#frmKeepData").empty();
				
				return encodeURI("params="+JSON.stringify(postData)); 
			},
			postData:{				
				empno: '${sessionScope.sessionEmpno}',
				start_date : targetDate.start_date,
				end_date :  targetDate.end_date,
				search_info: {
					insti_id: '',
					insti_nm: '',
					npmt_order_id: '',
					pmt_req_type_cd:checkVals
				}
			},
			rowNum : 10,
			rowList : [10, 20, 30],
			search:true,			
			sortname : 'npmt_trs_id',
			sortorder : "asc",
			toolbarfilter: true,
			viewrecords : true,
			recordpos : "left",
			multiselect : false,
			multiboxonly: true,
			autowidth : true,
			height : 'auto',
			shrinkToFit : true,
			pager : '#tran_jqgrid_page',
			gridComplete: function(){ 
				 // 데이터 아이디 가져오기
				 var ids = $("#tran_jqgrid").jqGrid('getDataIDs');
				 //데이터 값 가져오기
				 var data = $("#tran_jqgrid").getRowData();
			},
			onCellSelect: function(rowid, index, contents, event) {
				if(index == 0) {
				   	$('#tran_jqgrid').jqGrid('setGridParam', {'postData' : {'npmt_trs_id':rowid} });
					var postData = $('#tran_jqgrid').jqGrid('getGridParam', 'postData');
					var url = "/application/payment/real/paymentRealRN.do";
					var method = 'POST';
					cf_action(url, method, postData);
			   }
			},
			loadComplete : function(obj) {
				//$('#searchData').datepicker("option", "maxDate", $("#e_reg_date").val());	
			},
			afterInsertRow: function(rowid, rowdata , rowelem){		
				  
	        } 
			
		});
		
		jQuery("#tran_jqgrid").jqGrid('navGrid', "#tran_jqgrid_page", {
			edit : false, add : false, del : false, 
			search : false, refresh : false, view:false, position: 'right'
		});
	
	
		// -------------------------- 버튼 영역 종료 -------------------------- //
	  	
	  	$("#tran_jqgrid").gridCss();
	  	$("#tran_jqgrid_cb").css("border-left-width","0");
	  	$("#tran_jqgrid_cb").css("padding-left","4px");
	  	$("#jqgh_tran_jqgrid_cb").css("padding","7px 0");
	    /*	$("#tran_jqgrid_page_right").find(".ui-pg-table, .navtable").css("float","right"); */
	  	
	  
	  	/* 그리드 리사이징 */
	    $(window).on('resize.jqGrid', function () {
			jQuery("#tran_jqgrid").jqGrid( 'setGridWidth', $("#tran_jqgrid_section").width() );
		});
	}
	
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
loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/grid.locale-en.min.js", pagefunction);
</script>


