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
									<% if ("MCHT".equals(authCd)) { %>
									<input class="form-control" type="hidden" id="mcht_id" name="mcht_id" value="<%=strCd%>">
									<% } else { %>
									<label class="col-md-1 control-label">가맹점 선택</label>
									<div class="col-md-2">
										<input class="form-control" type="text" id="mcht_id" name="mcht_id" placeholder="가맹점 ID">
									</div>
									<div class="col-md-2">
										<div class="input-group">
											<input class="form-control" type="text" id="mcht_nm" name="mcht_nm" placeholder="가맹점 명" readonly="readonly">
											<div class="input-group-btn">
												<a href="javascript:f_openMchtListLL();" class="btn btn-default bg-color-blueDark txt-color-white" >검색</a>
											</div>
										</div>
									</div>										
									<% } %>
									
									<label class="col-md-1 control-label">키워드검색</label>
									<div class="col-md-3">
										<input class="form-control" type="text" id="search_keyword" name="search_keyword">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-1 control-label">조회 일자</label>
									<div class="col-md-2">
										<div class="input-group">
											<input class="form-control datepicker pr12 tac" id="s_reg_date" name="s_reg_date" type="text" placeholder="등록일자 FROM" data-date-format="yyyyMMdd" data-dateformat='yy-mm-dd'>
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
									<div class="col-md-2">
										<div class="input-group">
											<input class="form-control datepicker pr12 tac" id="e_reg_date" name="e_reg_date" type="text" placeholder="등록일자 TO" data-date-format="yyyyMMdd" data-dateformat='yy-mm-dd'>
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
									
									<label class="col-md-1 control-label">공지 구분</label>
									<div class="col-md-4" id="noti_type_chk">
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" id="noti_type_noti" name="noti_type_noti" value="N"><span>알림</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" id="noti_type_nece" name="noti_type_nece" value="N"><span>필수</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" id="noti_type_acc" name="noti_type_acc" value="N"><span>사고</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-0" id="noti_type_etc" name="noti_type_etc" value="N"><span>기타</span>
										</label>
									</div>
								</div>
							</fieldset>
							
							<div class="form-actions mt0">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:f_search();" id="btn_search" class="btn btn-success"><i class="fa fa-search"></i> 조회 </a>
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
					<h2>공지사항 목록</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div id="target_notice_grid" class="widget-body no-padding">
						<table id="notice_grid"></table>
						<div id="notice_grid_page"></div>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>

<div id="mchtSearchRD" style="display: none;"></div>

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

$("#noti_type_noti, #noti_type_nece, #noti_type_acc, #noti_type_etc").on("change", function() {
	if($(this).is(':checked')) {
		$(this).val('Y');
	}
	else {
		$(this).val('N');
	}
});

//가맹점 목록 팝업
$('#mchtSearchRD').dialog({
	autoOpen : false,
	width : 800,
	minHeight: 600,
	resizable : false,
	modal : true,
	title : "<div class='widget-header'><h6><i class='fa fa-table'></i> 가맹점 목록 </h6></div>",
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
 * 리스트 화면 : 달력 포멧 사용 정의
 * ==================================================================================
 */
 $('#search_start_date').datepicker(
    $.extend({
        onSelect: function(selected) {
        }
    }, date_opts)
);

$('#search_end_date').datepicker(
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
		
		var pageWidth = $("#notice_grid").parent().width() - 100;
		
		var titleList = ['No', '제목', '적용가맹점', '첨부파일', '작성자', '작성일', 'id'];
		
		var authCd = "<%=authCd%>";
		if("MCHT" == authCd) {
			titleList = ['No', '제목', '첨부파일', '작성자', '작성일', 'id'];
		}

		jQuery("#notice_grid").jqGrid({
			url : api_url + "/bo/notice/npmt_bo_02201",
			mtype: 'GET',
			datatype : "json",
			colNames : titleList,
			colModel : [
				{ name : 'rnum', 		 	index : 'rnum',				align : "center",	sortable : false, 	width : (pageWidth*(5/100))},
				{ name : 'title', 			index : 'title',			align : "left",		sortable : false, 	width : (pageWidth*(30/100)),	classes:'pointer'},
				<% if (!"MCHT".equals(authCd)) { %>
				{ name : 'read_mcht_cnt', 	index : 'read_mcht_cnt',	align : "center", 	sortable : false, 	width : (pageWidth*(20/100)),
					formatter: function (cellValue, rowObject, options) {
						var tooltip      = "";
						var tooltipTitle = "";
						var notReadMcht = options.not_read_mcht;
						
						var notReadMchtList = notReadMcht.split(',');
						if(notReadMchtList.length > 0) {
							$.each(notReadMchtList, function(idx, data) {
								var mchtInfo = data.split('\|');
								
								tooltipTitle += '<div class=\'unread_mcht\' style=\'cursor:pointer; text-align:left;\' onclick=\'f_unreadMcht(this);\' data-mcht-id=\''+ mchtInfo[1] +'\'>';
								tooltipTitle += '· ' +  mchtInfo[0]; 
								tooltipTitle += '</div>';
							});
							
							tooltip = cellValue + '개 가맹점 <a href="#" class="clickable-tooltip" title="' + tooltipTitle + '"><span style="color:red;">['+options.not_read_mcht_cnt+']</span></a>';
						}
						else {
							tooltip = cellValue + '개 가맹점 <span style="color:red;">['+options.not_read_mcht_cnt+']</span></a>';
						}
						
						return tooltip;
					}
				},
				<% } %>
				{ name : 'view_file_nm', index : 'view_file_nm',	align : "center", 	sortable : false, 	width : (pageWidth*(20/100)),
					formatter : function (cellValue, rowObject, options) {
						if(cellValue != "") {
							return '<a href="javascript:f_atchDownload(\''+options.noti_id+'\');">' + cellValue + '&nbsp;&nbsp;<span class="widget-icon"><i class="fa fa-file"></i></span></a>';
						}
						else {
							return '';
						}
					}
				},
				{ name : 'reg_nm', 		 index : 'reg_nm',			align : "center", 	sortable : false, 	width : (pageWidth*(15/100))}, 
				{ name : 'reg_date', 	 index : 'reg_date',		align : "center", 	sortable : false, 	width : (pageWidth*(15/100))},
				{ name : 'noti_id', 	 index : 'noti_id',			align : "center", 	sortable : false, 	width : (pageWidth*(5/100)),	hidden: true}
				
			],
			jsonReader: {
				repeatitems : false,
				id : "noti_id",
				root : 		function(obj){ return obj.data.notice_list; 		},	// 루트가 될 데이터 셋 명칭
				records : 	function(obj){ return obj.data.page_info.records; 	},	// 총 레코드 수
				page : 		function(obj){ return obj.data.page_info.page; 		}, 	// 현재 보여지는 페이지
				total : 	function(obj){ return obj.data.page_info.total; 	}	// 페이지 블럭수
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
				search_info: $("#frmSearch").serializeFormObject()
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
			pager : '#notice_grid_page',
			gridComplete: function(){ 
				$('.clickable-tooltip').tooltip({placement : 'right', html:true, trigger: 'click'});
			},
			onCellSelect: function(rowid, index, contents, event) {
			   if(index == 1) {
					$("#notice_grid").jqGrid('setGridParam', {'postData' : {'noti_id':rowid} });
					
					var postData = $('#notice_grid').jqGrid("getGridParam", "postData");
					
					$.each($('#noti_type_chk').find('input[type=checkbox]').not(':checked'), function(idx, data) {
						delete postData['search_info'][$(this).attr('name')];
					});
					
					var url = "/application/merchant/notice/noticeRN.do";
					var method = "POST";
					cf_action(url, method, postData);
			   }
			},
			loadComplete : function(obj) {
			},
			afterInsertRow: function(rowid, rowdata , rowelem){		
	        } 
			
		});
		
		jQuery("#notice_grid").jqGrid('navGrid', "#notice_grid_page", {
			edit : false, add : false, del : false, 
			search : false, refresh : false, view:false, position: 'right'
		});
		
		if('${sessionScope.menuAuth.C}' == 'Y') {
			jQuery("#notice_grid").jqGrid('navButtonAdd','#notice_grid_page',{
				caption: "등록",
				id: "add_button",
				buttonicon: "ui-icon-plus",
				onClickButton: function(){
					var url = "/application/merchant/notice/noticeWN.do";
					var method = "POST";
					var postData = $('#notice_grid').jqGrid("getGridParam", "postData"); // 페이지 정보와 검색 정보를 들고 이동
					cf_action(url, method, postData);
				}
			});	
		}
	
	
		// -------------------------- 버튼 영역 종료 -------------------------- //
	  	
	  	$("#notice_grid").gridCss();
	  	$("#notice_grid_cb").css("border-left-width","0");
	  	$("#notice_grid_cb").css("padding-left","4px");
	  	$("#jqgh_notice_grid_cb").css("padding","7px 0");
	    $("#notice_grid_page_right").find(".ui-pg-table, .navtable").css("float","right");
	  	
	  	/* 그리드 리사이징 */
	    $(window).on('resize.jqGrid', function () {
			jQuery("#notice_grid").jqGrid( 'setGridWidth', $("#target_notice_grid").width() );
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


