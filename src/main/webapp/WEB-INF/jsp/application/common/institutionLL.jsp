<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>

<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" 
				data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-search"></i> </span>
					<h2> 가맹기관 조회 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<form id="frmInstiSearch" class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label">가맹 기관명</label>
									<div class="col-md-4">
										<input class="form-control" type="text" id="serch_keyword" name="serch_keyword">
									</div>
								</div>
							</fieldset>
							
							<div class="form-actions mt0">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:void(0)" id="common_btn_search" onclick="f_commInstiSearch();" class="btn btn-success"><i class="fa fa-search"></i> 조회 </a>
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
<!-- 		<article class="col-xs-12 col-sm-12 col-md-4 col-lg-5" style="width:520px"> -->
			<div class="jarviswidget" id="wid-id-2" data-widget-deletebutton="false" data-widget-colorbutton="false" data-widget-fullscreenbutton="false" data-widget-editbutton="false" data-widget-sortable="false">
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
</section>

<form id="frmKeepParams">
<%
	Enumeration<?> e = request.getParameterNames();
	while(e.hasMoreElements()){
		String key = (String)e.nextElement();
		String values[] = request.getParameterValues(key);
		for(int i = 0; i < values.length; i++) {
			out.println("<input type=\"hidden\" name=\""+key+"\" value=\""+values[i]+"\" />\n");	
		}
	}
%>
</form>
<script src="${pageContext.request.contextPath}/resources/js/application/popup.js"></script>
<script type="text/javascript">
//input 에서 엔터키 입력시 반응하지 않도록 
$('#instiSearchRD').find('input').keypress(function(e) {
	if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
		$(this).parent().parent().parent().parent().find('.ui-dialog-buttonpane').find('button:first').click(); /* Assuming the first one is the action button */
		return false;
	}
});	

/* ============================================================================================
/* 페이지 정보 설정
/* --------------------------------------------------------------------------------------------
/* 초기 설정 및 필요 UI 컴포넌트 셋팅
/* ============================================================================================ */
var popInstiPagefunction = function() {
	
	loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/jquery.jqGrid.min.js", run_jqgrid_function);

	function run_jqgrid_function() {
		
		var pageWidth = $("#insti_jqgrid").parent().width() - 100;

		jQuery("#insti_jqgrid").jqGrid({
			url : api_url + "/bo/popup/npmt_bo_00005",
			mtype: 'GET',
			datatype : "json",
			colNames : ['가맹기관ID', '가맹기관명',  '등록자', '등록일시'],
			colModel : [
				{ name : 'insti_id', 		index : 'insti_id',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100)), classes:'pointer'},
				{ name : 'insti_nm', 		index : 'insti_nm',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100)), classes:'pointer'}, 
				{ name : 'reg_id', 			index : 'reg_id',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100))},
				{ name : 'reg_date', 		index : 'reg_date',		align : "center", 	sortable : false, 	width : (pageWidth*(25/100))}
				
			],
			jsonReader: {
				repeatitems : false,
				id : "institution_id",
				root : 		function(obj){ return obj.data.institution_list; },		// 루트가 될 데이터 셋 명칭
				records : 	function(obj){ return obj.data.page_info.records; 	},	// 총 레코드 수
				page : 		function(obj){ return obj.data.page_info.page; 		}, 	// 현재 보여지는 페이지
				total : 	function(obj){ return obj.data.page_info.total; 		}	// 페이지 블럭수
			},
			serializeRowData: function (postData) { return encodeURI("params="+JSON.stringify(postData)); },
			serializeGridData: function(postData) {
				
				/* 기존 검색 조건 유지 부분 */
				var _search = $("#frmKeepParams").find("input[name=_search]");
				var page = $("#frmKeepParams").find("input[name=page]");
				var rows = $("#frmKeepParams").find("input[name=rows]");
				
				/* SEARCH_INFO : 기존에 검색 조건 등록 */
				if(_search.val() == "true") {
					
					// 기존 검색 데이터 등록(특별한거는 따로 해야 함!)
					cf_keepDataLoader($("#frmKeepParams"),$("#frmInstiSearch"));
					
					// 검색 폼 데이터 추출 및 post data 등록
					var searchData = $("#frmInstiSearch").serializeFormObject();	// 검색 폼 데이터 추출
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
				$("#frmKeepParams").empty();
				
				return encodeURI("params="+JSON.stringify(postData)); 
			},
			postData:{				
				empno: '${sessionScope.sessionEmpno}',
				search_info: {
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
			shrinkToFit : true,			// 가로 스펙 픽스
			footerrow: false, 			// 풋터 로우 옵션
			userDataOnFooter: false,	// 풋터 로우 옵션
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
				if(index == 0 || index == 1) {
				 	var _instiid = $('#insti_jqgrid').jqGrid('getRowData', rowid).insti_id;
					var _instinm = $('#insti_jqgrid').jqGrid('getRowData', rowid).insti_nm;
					$('#insti_id').val(_instiid);
					$('#insti_nm').val(_instinm); 
					$('#instiSearchRD').empty();
					$('#instiSearchRD').dialog('close');
				} 
			},
			gridComplete: function() {	
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
loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/grid.locale-en.min.js", popInstiPagefunction);
</script>