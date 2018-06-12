<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page import="java.util.Enumeration"%>

<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
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
									<label class="col-md-1 control-label">구분</label>
									<div class="col-md-2">
										<select class="form-control" id="search_type" name="search_type">
											<option value="MN">가맹점명</option>			<!-- Merchant Name -->
											<option value="MI">가맹점ID</option>			<!-- Merchant ID -->
											<option value="SN">서비스 담당자명</option>		<!-- Service Staff Name -->
											<option value="ST">서비스 담당자 전화번호</option>	<!-- Service Staff Telephone -->
										</select>
									</div>
									<div class="col-md-2">
										<input class="form-control" type="text" id="search_keyword" name="search_keyword" placeholder="검색어">
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
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-colorbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2> 조회 목록 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div id="target_merchant_grid" class="widget-body no-padding">
						<table id="merchant_grid"></table>
						<div id="merchant_grid_page"></div>
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
	
	//today 포함한 이전일자만 선택 가능
	//$("#search_date").datepicker('option','maxDate', 0);
	// 초기데이터 설정 : 조회일자(Default = today)
	//$('input[name=search_date]').val(cf_toDate());
	
	loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/jquery.jqGrid.min.js", run_jqgrid_function);

	function run_jqgrid_function() {
		
		var pageWidth = $("#merchant_grid").parent().width() - 100;

		jQuery("#merchant_grid").jqGrid({
			url : api_url + "/bo/merchant/npmt_bo_02001",
			mtype: 'GET',
			datatype : "json",
			colNames : ['No.', '가맹점ID', '가맹점명', '담당자명', '연락처', '사용구분', '등록자', '등록일시'],
			colModel : [
				{ name : 'rnum', 		 	  index : 'rnum',				align : "center",	sortable : false, 	width : (pageWidth*(5/100))	 },  
				{ name : 'mcht_id', 	 	  index : 'mcht_id',			align : "center", 	sortable : false, 	width : (pageWidth*(10/100)) },
				{ name : 'mcht_nm', 	 	  index : 'mcht_nm',			align : "center", 	sortable : false, 	width : (pageWidth*(20/100)), classes:'pointer' }, 
				{ name : 'service_staff_nm',  index : 'service_staff_nm',	align : "center", 	sortable : false, 	width : (pageWidth*(10/100)) },
				{ name : 'service_staff_tel', index : 'service_staff_tel',	align : "center", 	sortable : false, 	width : (pageWidth*(15/100)) },
				{ name : 'mcht_stts_nm', 	  index : 'mcht_stts_nm',		align : "center", 	sortable : false, 	width : (pageWidth*(10/100)) },
				{ name : 'reg_nm', 		 	  index : 'reg_nm',				align : "center", 	sortable : false, 	width : (pageWidth*(10/100)) },
				{ name : 'reg_date', 	 	  index : 'reg_date',			align : "center", 	sortable : false, 	width : (pageWidth*(15/100)) }
			],
			jsonReader: {
				repeatitems : false,
				id 			: "mcht_id",
				root 		: function(obj){ return obj.data.merchant_list; 	},	// 루트가 될 데이터 셋 명칭
				records 	: function(obj){ return obj.data.page_info.records;	},	// 총 레코드 수
				page 		: function(obj){ return obj.data.page_info.page; 	}, 	// 현재 보여지는 페이지
				total 		: function(obj){ return obj.data.page_info.total; 	}	// 페이지 블럭수
			},
			serializeRowData: function (postData) { return encodeURI("params="+JSON.stringify(postData)); },
			serializeGridData: function(postData) {
				/* 기존 검색 조건 유지 부분 */
				var _search = $("#frmKeepData").find("input[name=_search]");
				var page    = $("#frmKeepData").find("input[name=page]");
				var rows    = $("#frmKeepData").find("input[name=rows]");

				/* SEARCH_INFO : 기존에 검색 조건 등록 */
				if(_search.val() == "true") {
					// 기존 검색 데이터 등록(특별한거는 따로 해야 함!)
					cf_keepDataLoader($("#frmKeepData"),$("#frmSearch"));
					
					// 검색 폼 데이터 추출 및 post data 등록
					var searchData = $("#frmSearch").serializeFormObject();	// 검색 폼 데이터 추출
					
					postData._search = true;
					
					$("#notice_grid").jqGrid('setGridParam', {search: true});
					$("#notice_grid").jqGrid('setGridParam', {'postData' : {'search_info':searchData} });
					
					f_addButton();
				}
				
				/* PAGE_INFO : 현재 페이지 정보 */
				if(page.val() != undefined) {
					postData.page = parseInt(page.val());
				}
				
				/* PAGE_INFO : 페이지 아이템 정보 */
				if(rows.val() != undefined) {
					$("#merchant_grid_page_center").find(".ui-pg-selbox").val(rows.val()).attr("selected", "selected");
					postData.rows = parseInt(rows.val());
					$("#merchant_grid").jqGrid('setGridParam', {'rowNum' : parseInt(rows.val()) });
				}
									
				// 기존 Keep Data 삭제
				$("#frmKeepData").empty();
				
				return encodeURI("params="+JSON.stringify(postData)); 
			},
			postData:{				
				search_info: $("#frmSearch").serializeFormObject()
			},
			rowNum 		 : 10,
			rowList 	 : [10, 20, 30],
			search		 : true,			
			sortname 	 : 'reg_date',
			sortorder 	 : "desc",
			toolbarfilter: true,
			viewrecords  : true,
			recordpos 	 : "left",
			multiselect  : false,
			multiboxonly : true,
			autowidth 	 : true,
			height 		 : 'auto',
			shrinkToFit  : true,
			pager 		 : '#merchant_grid_page',
			gridComplete : function(){ 
			},
			onCellSelect: function(rowid, index, contents, event) {
				if(index == 2) {
					$("#merchant_grid").jqGrid('setGridParam', {'postData' : {'mcht_id' : rowid}});
					var postData = $('#merchant_grid').jqGrid("getGridParam", "postData");
					
					var url = "/application/merchant/merchant/merchantRN.do";
					var method = "POST";
					cf_action(url, method, postData);
			   }
			},
			afterInsertRow: function(rowid, rowdata , rowelem){		
	        } 
		});
		
		jQuery("#merchant_grid").jqGrid('navGrid', "#merchant_grid_page", {
			edit : false, add : false, del : false, 
			search : false, refresh : false, view:false, position: 'right'
		});
	
		// -------------------------- 버튼 영역 종료 -------------------------- //
	  	
	  	$("#merchant_grid").gridCss();
	  	$("#merchant_grid_cb").css("border-left-width","0");
	  	$("#merchant_grid_cb").css("padding-left","4px");
	  	$("#jqgh_merchant_grid_cb").css("padding","7px 0");
	    $("#merchant_grid_page_right").find(".ui-pg-table, .navtable").css("float","right");
	  	
	  
	  	/* 그리드 리사이징 */
	    $(window).on('resize.jqGrid', function () {
			jQuery("#merchant_grid").jqGrid( 'setGridWidth', $("#target_merchant_grid").width() );
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


