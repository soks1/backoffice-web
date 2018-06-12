<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page import="com.penta.backoffice.web.common.controller.CommonController"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>

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
									<label class="col-md-1 control-label">조회일자</label>
									<div class="col-md-3half">
										<div class="input-group">
											<input class="form-control datepicker pr12 tac" id="search_date" name="search_date" type="text" placeholder="시작일" data-date-format="yyyyMMdd" data-dateformat='yy-mm-dd'>
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
									
									<label class="col-md-1 control-label">수행결과</label>
									<div class="col-md-3">
										<select class="form-control" id="scss_yn" name="scss_yn">
											<option value="">전체</option>
											<option value="Y">정상</option>
											<option value="N">오류</option>
										</select>
									</div>
									
									<label class="col-md-1 control-label">스케줄러명</label>
									<div class="col-md-3">
										<input class="form-control" type="text" id="job_title" name="job_title">
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
					<h2> 스케줄수행 현황 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div id="target_schedule_grid" class="widget-body no-padding">
						<table id="schedule_grid"></table>
						<div id="schedule_grid_page"></div>
					</div>
				</div>
			</div>
		</article>
	</div>
	<div id="schedule_popup" style="display:none;"></div>
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

/**
 * ==================================================================================
 * 리스트 화면 : 달력 포멧 사용 정의
 * ==================================================================================
 */
$('#search_date').datepicker(
			   
    $.extend({
        onSelect: function(selected) {
        	
        }
    }, date_opts)
);

/* ============================================================================================
/* 페이지 정보 설정
/* --------------------------------------------------------------------------------------------
/* 초기 설정 및 필요 UI 컴포넌트 셋팅
/* ============================================================================================ */
var pagefunction = function() {
	
	//today 포함한 이전일자만 선택 가능
	$("#search_date").datepicker('option','maxDate', 0);
	// 초기데이터 설정 : 조회일자(Default = today)
	$('input[name=search_date]').val(cf_toDate());
	
	loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/jquery.jqGrid.min.js", run_jqgrid_function);

	function run_jqgrid_function() {
		
		var pageWidth = $("#schedule_grid").parent().width() - 100;

		jQuery("#schedule_grid").jqGrid({
			url : api_url + "/backoffice/system/schedule/list",
			mtype: 'GET',
			datatype : "json",
			colNames : ['No.', '로그번호', '스케줄러명', '스케줄러 설명', '작업시작시간', '수행결과'],
			colModel : [
				{ name : 'no', 				index : 'no',				align : "center",	sortable : false, 	width : (pageWidth*(5/100))		},  
				{ name : 'log_serial_no', 	index : 'log_serial_no',	align : "center", 	sortable : false, 	width : (pageWidth*(10/100)),	hidden: true	},
				{ name : 'job_title', 		index : 'job_title',		align : "center", 	sortable : false, 	width : (pageWidth*(15/100))  }, 
				{ name : 'description', 	index : 'description',		align : "center", 	sortable : false, 	width : (pageWidth*(50/100)) 	}, 
				{ name : 'exe_time', 		index : 'exe_time',			align : "center", 	sortable : false, 	width : (pageWidth*(10/100)) 	},
				{ name : 'scss_yn', 		index : 'scss_yn',			align : "center", 	sortable : false, 	width : (pageWidth*(10/100)),	classes:'pointer'	}
				
			],
			jsonReader: {
				repeatitems : false,
				id : "schedule_id",
				root : 		function(obj){ return obj.data.system_list; },		// 루트가 될 데이터 셋 명칭
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
					$("#notice_grid_page_center").find(".ui-pg-selbox").val(rows.val()).attr("selected", "selected");
					postData.rows = parseInt(rows.val());
					$("#notice_grid").jqGrid('setGridParam', {'rowNum' : parseInt(rows.val()) });
				}
									
				// 기존 Keep Data 삭제
				$("#frmKeepData").empty();
				
				return encodeURI("params="+JSON.stringify(postData)); 
			},
			postData:{				
				empno: '${sessionScope.sessionEmpno}',
				search_info: {
					search_date: $('#search_date').cvtDateDefault(),
					job_title: '',
					scss_yn:''
				}
			},
			rowNum : 10,
			rowList : [10, 20, 30],
			search:true,			
			sortname : 'log_serial_no',
			sortorder : "asc",
			toolbarfilter: true,
			viewrecords : true,
			recordpos : "left",
			multiselect : false,
			multiboxonly: true,
			autowidth : true,
			height : 'auto',
			shrinkToFit : true,
			pager : '#schedule_grid_page',
			gridComplete: function(){ 
				 // 데이터 아이디 가져오기
				 var ids = $("#schedule_grid").jqGrid('getDataIDs');
				 //데이터 값 가져오기
				 var data = $("#schedule_grid").getRowData();
				 //가져온 아이디 개수 만큼 for문 을 돌려 수행결과가 Y 인 값은 파란색신호등 N인 값은 빨간색신호등 및 안내 문구 표시	
				 //수행결과가 N 인 경우 안내 문구 표시 안내 문구 클릭 시 해당 팝업에 상세 내용(에러내용/복구방법) 이동
				  for(var i=0;i < ids.length;i++){				        		      
				        scss_y = "<div class='btn btn-primary btn-circle'></div>";
				        scss_n = '<div class="btn btn-danger btn-circle"></div><a href="javascript:f_scheduleView(\''+data[i].log_serial_no+'\');" style="margin-right:-35px" ;">[안내]</a>';
						if(data[i].scss_yn == "Y"){
							$("#schedule_grid").jqGrid('setRowData',ids[i],{scss_yn:scss_y});
						}else{
							$("#schedule_grid").jqGrid('setRowData',ids[i],{scss_yn:scss_n});
						}
				   } 
			},
			loadComplete : function(obj) {
				//$('#searchData').datepicker("option", "maxDate", $("#e_reg_date").val());	
			},
			afterInsertRow: function(rowid, rowdata , rowelem){		
				  
	        } 
			
		});
		
		jQuery("#schedule_grid").jqGrid('navGrid', "#schedule_grid_page", {
			edit : false, add : false, del : false, 
			search : false, refresh : false, view:false, position: 'right'
		});
	
	
		// -------------------------- 버튼 영역 종료 -------------------------- //
	  	
	  	$("#schedule_grid").gridCss();
	  	$("#schedule_grid_cb").css("border-left-width","0");
	  	$("#schedule_grid_cb").css("padding-left","4px");
	  	$("#jqgh_schedule_grid_cb").css("padding","7px 0");
	    /*	$("#schedule_grid_page_right").find(".ui-pg-table, .navtable").css("float","right"); */
	  	
	  
	  	/* 그리드 리사이징 */
	    $(window).on('resize.jqGrid', function () {
			jQuery("#schedule_grid").jqGrid( 'setGridWidth', $("#target_schedule_grid").width() );
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


