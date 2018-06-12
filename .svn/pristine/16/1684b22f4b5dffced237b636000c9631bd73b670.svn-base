<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page import="com.penta.backoffice.web.common.controller.CommonController"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>

<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" 
				data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-search"></i> </span>
					<h2> 조회 조건 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<form id="frmSearch" class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-1 control-label">기관 검색</label>
									<div class="col-md-2">
										<select class="form-control" id="serch_type" name="serch_type">
											<option value="01">가맹기관 ID</option>
											<option value="02">가맹기관 명</option>
										</select>
									</div>
									<div class="col-md-2">
										<input class="form-control" type="text" id="serch_keyword" name="serch_keyword">
									</div>
								</div>
							</fieldset>
							
							<div class="form-actions mt0">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:void(0)" id="btn_search" onclick="f_instiSearch();" class="btn btn-success"><i class="fa fa-search"></i> 조회 </a>
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
					<h2>가맹기관목록</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div id="insti_jqgrid_section" class="widget-body no-padding">
						<table id="insti_jqgrid"></table>
						<div id="insti_jqgrid_page"></div>
					</div>
				</div>
			</div>
		</article>
	</div>
	<div id="institution_popup" style="display:none;"></div>
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
	
	loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/jquery.jqGrid.min.js", run_jqgrid_function);

	function run_jqgrid_function() {
		
		var pageWidth = $("#insti_jqgrid").parent().width() - 100;

		jQuery("#insti_jqgrid").jqGrid({
			url : api_url + "/bo/institution/npmt_bo_03001",
			mtype: 'GET',
			datatype : "json",
			colNames : ['가맹기관ID', '가맹기관명',  '기관분류', '사용구분',  '등록자', '등록일시'],
			colModel : [
				{ name : 'insti_id', 		index : 'insti_id',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100))},
				{ name : 'insti_nm', 		index : 'insti_nm',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100)), classes:'pointer'}, 
				{ name : 'insti_type_cd_nm', 	index : 'insti_type_cd_nm',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100))}, 
				{ name : 'use_yn', 			index : 'use_yn',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100)),
					formatter : function(cellvalue, options, rowObject) {
						var rtnStr = '';
						if(cellvalue == 'Y') {
							rtnStr = '사용가능';
						} else if(cellvalue == 'N') {
							rtnStr = '사용중지'
						} 
						
						return rtnStr;
					}	
				}, 
				{ name : 'reg_id', 			index : 'reg_id',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100))},
				{ name : 'reg_date', 		index : 'reg_date',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100))}
				
			],
			jsonReader: {
				repeatitems : false,
				id : "insti_id",
				root : 		function(obj){ return obj.data.institution_list; },		// 루트가 될 데이터 셋 명칭
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
					$("#insti_jqgrid").jqGrid('setGridParam', {search: true});
					$("#insti_jqgrid").jqGrid('setGridParam', {'postData' : {'search_info':searchData} });
					f_addButton();
				}
				
				/* PAGE_INFO : 현재 페이지 정보 */
				if(page.val() != undefined) {
					postData.page = parseInt(page.val());
				}
				
				/* PAGE_INFO : 페이지 아이템 정보 */
				if(rows.val() != undefined) {
					$("#insti_jqgrid_page").find(".ui-pg-selbox").val(rows.val()).attr("selected", "selected");
					postData.rows = parseInt(rows.val());
					$("#insti_jqgrid").jqGrid('setGridParam', {'rowNum' : parseInt(rows.val()) });
				}
									
				// 기존 Keep Data 삭제
				$("#frmKeepData").empty();
				
				return encodeURI("params="+JSON.stringify(postData)); 
			},
			postData:{				
				empno: '${sessionScope.sessionEmpno}',
				search_info: {
					serch_type: '',
					serch_keyword:''
				}
			},
			rowNum : 10,
			rowList : [10, 20, 30],
			search:true,			
			sortname : 'reg_date',
			sortorder : "asc",
			toolbarfilter: true,
			viewrecords : true,
			recordpos : "left",
			multiselect : false,
			multiboxonly: true,
			autowidth : true,
			height : 'auto',
			shrinkToFit : true,
			pager : '#insti_jqgrid_page',
			gridComplete: function(){ 
				 // 데이터 아이디 가져오기
				 var ids = $("#insti_jqgrid").jqGrid('getDataIDs');
				 //데이터 값 가져오기
				 var data = $("#insti_jqgrid").getRowData();
			},
			onCellSelect: function(rowid, index, contents, event) {
			   if(index == 1) {
				   	$('#insti_jqgrid').jqGrid('setGridParam', {'postData' : {'insti_id':rowid} });
					var postData = $('#insti_jqgrid').jqGrid('getGridParam', 'postData');
					var url = "/application/merchant/institution/institutionRN.do";
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
		
		jQuery("#insti_jqgrid").jqGrid('navGrid', "#insti_jqgrid_page", {
			edit : false, add : false, del : false, 
			search : false, refresh : false, view:false, position: 'right'
		});
	
	
		// -------------------------- 버튼 영역 종료 -------------------------- //
	  	
	  	$("#insti_jqgrid").gridCss();
	  	$("#insti_jqgrid_cb").css("border-left-width","0");
	  	$("#insti_jqgrid_cb").css("padding-left","4px");
	  	$("#jqgh_insti_jqgrid_cb").css("padding","7px 0");
	    /*	$("#insti_jqgrid_page_right").find(".ui-pg-table, .navtable").css("float","right"); */
	  	
	  
	  	/* 그리드 리사이징 */
	    $(window).on('resize.jqGrid', function () {
			jQuery("#insti_jqgrid").jqGrid( 'setGridWidth', $("#insti_jqgrid_section").width() );
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


