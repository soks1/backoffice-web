<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.penta.backoffice.web.common.constant.CommonConstant"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%
	HttpSession ses = request.getSession(true);
	String authCd = (String) ses.getAttribute(CommonConstant.SESSION_AUTH_CD);
	String strCd = (String) ses.getAttribute(CommonConstant.SESSION_STR_CD);
%>

<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/statistics.css">
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-search"></i> </span>
					<h2> 조회조건 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<form id="frmSearch" class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<label class="col-md-1 control-label">거래일자</label>
									<div class="col-md-2">
										<div class="input-group">
											<input class="form-control pr12 tac" type="text"  id="start_date" name="start_date" data-dateformat='yy-mm-dd' data-valid-date='true' data-valid-use='true' data-valid-title="from"  placeholder="from">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
									<label class="col-md-1 control-label ta-c" style="width:10px;"><strong>~</strong></label>
									<div class="col-md-2">
										<div class="input-group">
											<input class="form-control pr12 tac" type="text"  id="end_date" name="end_date" data-dateformat='yy-mm-dd'  data-valid-date='true' data-valid-use='true' data-valid-title="to" placeholder="to">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-1 control-label">기관</label>
									<div class="col-md-3half">
										<input class="form-control" type="text" id="insti_id" name="insti_id" placeholder="기관 ID">
									</div>
									<div class="col-md-3">
										<div class="input-group">
											<input class="form-control" type="text" id="insti_nm" name="insti_nm" placeholder="전체(금융기관)"  readonly="readonly">
											<div class="input-group-btn">
												<a href="javascript:void(0);" class="btn btn-default bg-color-blueDark txt-color-white" onclick="f_instiSearchRD();">검색</a>
											</div>
										</div>
									</div>

									<% if (!"MCHT".equals(authCd)) { %>
									<label class="col-md-2 control-label">가맹점</label>
									<div class="col-md-3half">
										<input class="form-control" type="text" id="mcht_id" name="mcht_id" placeholder="가맹점 ID">
									</div>
									<div class="col-md-3">
										<div class="input-group">
											<input class="form-control" type="text" id="mcht_nm" name="mcht_nm" placeholder="전체(가맹점)"  readonly="readonly">
											<div class="input-group-btn">
												<a href="javascript:void(0);" class="btn btn-default bg-color-blueDark txt-color-white" onclick="f_mchtSearchRD();">검색</a>
											</div>
										</div>
									</div>
									<% } %>
								</div>	

								<div class="form-group">
									<label class="col-md-1 control-label">유형</label>
									<div class="col-md-6">
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-2" id="req_cnt_yn" name="req_cnt_yn" value="Y">
											<span>요청</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-2" id="stand_by_cnt_yn" name="stand_by_cnt_yn" value="Y">
											<span>대기</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-2" id="appr_cnt_yn" name="appr_cnt_yn" value="Y">
											<span>승인</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-2" id="cancel_cnt_yn" name="cancel_cnt_yn" value="Y">
											<span>취소</span>
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" class="checkbox style-2" id="error_cnt_yn" name="error_cnt_yn" value="Y">
											<span>오류</span>
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
							<input type="hidden" id="s_stts_dd" name="s_stts_dd">
							<input type="hidden" id="e_stts_dd" name="e_stts_dd">
						</form>
					</div>
				</div>
			</div>
		</article>
	</div>
	
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" 
				data-widget-deletebutton="false" data-widget-colorbutton="false" 
				data-widget-fullscreenbutton="false" data-widget-editbutton="false" data-widget-sortable="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
					<h2> 요일별 결제집계 </h2>				
				</header>
				<div>
					<div class="jarviswidget-editbox">
						<input class="form-control" type="text">	
					</div>
					<div class="widget-body">
						<div id="div_chart_no_data_msg" style="display: none; text-align: center; padding: 30px;">집계 데이터가 존재하지 않습니다.</div>
						<div id="div_canvas_container_1"><canvas id="chart_canvas_1" height="90"></canvas></div>
						<div id="legend_chart_canvas_1"></div>
					</div>
				</div>
			</div>
		</article>
		<article class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="jarviswidget" id="wid-id-2" 
				data-widget-colorbutton="false" data-widget-fullscreenbutton="false" data-widget-deletebutton="false" 
				data-widget-editbutton="false" data-widget-sortable="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2> 요일별 결제집계 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body no-padding stat_table">
						<div id="div_table_no_data_msg" style="display: none; text-align: center; padding: 40px;">집계 데이터가 존재하지 않습니다.</div>
						<div class="widget-body-toolbar" style="display: none;">
							<div class="row">
								<div class="col-sm-12 text-right">
									<a href="javascript:f_statCsvDownload('day');" class="btn btn-default"><i class="fa fa-lg fa-download"></i>&nbsp;Download</a>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead id="stat_list_th">
								
								</thead>
								
								<tbody id="stat_list_td">
											
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
	
</section>

<div id="instiSearchRD" style="display:none;"></div>
<div id="mchtSearchRD" style="display:none;"></div>

<script type="text/javascript">
pageSetUp();



// 초기데이터 설정 : 달력
f_initDatePicker();

// 초기데이터 설정 : 유형 체크박스 checked
$("#frmSearch input:checkbox").prop("checked", true);

// 초기데이터 설정 : 컬럼, 컬럼명
var statRowNameCol = ['req_cnt', 'appr_cnt', 'stand_by_cnt', 'cancel_cnt', 'error_cnt'];
var statRowName = ['요청', '승인', '대기', '취소', '오류'];

// request param settting : api call, excel call
var _data = function(){
	$('#s_stts_dd').val($('#start_date').cvtDateDefault());
	$('#e_stts_dd').val($('#end_date').cvtDateDefault());
	
	var data = $("#frmSearch").serializeFormObject();
	
	$('input.checkbox').not(':checked').each(function() {
		data[$(this).attr('id')] = 'N';
	});
	
	return data;
};

// 현재 검색 조건 data
var current_search_data = _data();

var pagefunction = function() {
	
	f_ajaxSubmit();
	
};

/**
 * ==================================================================================
 * calendar init 
 * ----------------------------------------------------------------------------------
 * datepicker load, 날짜 선택 제한
 * ==================================================================================
 */
function f_initDatePicker() {

	// 시작일자조건은 월요일만 선택가능
	$('input[name=start_date]').datepicker(
	    $.extend({
	        onSelect: function(selected) {
	            $('input[name=end_date]').datepicker('option','minDate', selected);
	        },
			beforeShowDay: function(date){
				var day = date.getDay();
				return [(day != 0 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6), ''];
			}	
	    }, date_opts)
	);
	
	// 마지막일자조건은 일요일만 선택가능
	$('input[name=end_date]').datepicker(
	    $.extend({
	        onSelect: function(selected) {
	            $('input[name=start_date]').datepicker('option','maxDate', selected);
	        },
			beforeShowDay: function(date){
				var day = date.getDay();
				return [(day != 1 && day != 2 && day != 3 && day != 4 && day != 5 && day != 6), ''];
			}	
	    }, date_opts)
	);
	
	f_resetCalendar();
}

/**
 * ==================================================================================
 * calendar reset function
 * ----------------------------------------------------------------------------------
 * datepicker reset / 달력 minDate, maxDate 값을 초기화
 * ==================================================================================
 */
function f_resetCalendar(){

	var today = new Date();
	var day = today.getDay();
	var start_date_term = 0;
	var end_date_term = 0;
    if ((day > 0) && (day < 7)) { 
    	start_date_term = 1 - day;
    	end_date_term = 7 - day;
    }
    else if (day == 0) {  
    	start_date_term = -6;
    	end_date_term = 0;
    }
	
	$('input[name=start_date]').val(cf_termDate(start_date_term));
	$('input[name=end_date]').val(cf_termDate(end_date_term));

	$('input[name=start_date]').datepicker('option','maxDate', cf_termDate(end_date_term));
	$('input[name=end_date]').datepicker('option','minDate', cf_termDate(start_date_term));
	
}

/* ============================================================================================
/* Server와 통신 
/* ============================================================================================ */
function f_ajaxSubmit() {
	
	// 현재 검색 조건 data 갱신
	current_search_data = _data();
	
	// 실제 데이터 전송
	$.ajax({
		url :  api_url + '/bo/statistics/npmt_bo_07002',
	    type: 'GET',
	    async: true,
	    cache: true,
	    datatype: 'json',
	    data: encodeURI('params='+JSON.stringify(current_search_data)),
	    success: function(obj){
	    	var stat_list = obj.data.stat_list;

	    	// chart
	    	drawChart(stat_list);

	    	// table	   
	    	drawTable(stat_list);
	    	
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
} 

function drawTable(jsonData) {
	var thead = $('#stat_list_th');
	thead.html('');

   	var tbody = $('#stat_list_td');
   	tbody.html('');
	
	if(jsonData.length < 1) {
		$('.stat_table .widget-body-toolbar').hide();
		$('#div_table_no_data_msg').show();
		
		return null;
	}
	
	$('#div_table_no_data_msg').hide();
	$('.stat_table .widget-body-toolbar').show();
	
	var tag_td = '<th class="ta-c ">시간</th>';
	$.each(jsonData, function(j_i, j_item) {
		tag_td += '<th class="ta-c">' + j_item['stats_day_nm'] + '</th>\n';
	});
	var tag_tr = '<tr>'+tag_td+'</tr>\n';
	thead.append(tag_tr);
	
   	
   	$.each(statRowNameCol, function(i, col_name){
		if(current_search_data[col_name + '_yn'] == 'Y') {
   			tag_td = '<td class="ta-c ">' + statRowName[i] + '</td>';
   		
	   		$.each(jsonData, function(j_i, j_item) {
				tag_td += '<td class="ta-c">'+j_item[col_name]+'</td>\n';
   	   		});
		
	   		tag_tr = '<tr>'+tag_td+'</tr>\n';
	   	   	tbody.append(tag_tr);
		}
   	});
   	
}


/* ============================================================================================
/* Chart 생성
/* ============================================================================================ */
function drawChart(dataset){
	
	if( dataset.length < 1) {
		if (window.barChart1){ 
	        window.barChart1.destroy();
	    }
		$('#div_canvas_container_1').hide();
		$('#legend_chart_canvas_1').hide();
		$('#div_chart_no_data_msg').show();

		return null;
	}
	
	$('#div_chart_no_data_msg').hide();
	$('#div_canvas_container_1').show();
	$('#legend_chart_canvas_1').show();
	
	var _label = [];
	var _data1 = [];
	var _data2 = [];
	var _data3 = [];
	var _data4 = [];
	var _data5 = [];
	var default_value_spacing = 300;
	for(var nRow=0; nRow<dataset.length; nRow++){
		// Chart 데이터 처리 시작 =========================
		_label[nRow] = dataset[nRow].stats_day_nm;
		_data1[nRow] = dataset[nRow].req_cnt;
		_data2[nRow] = dataset[nRow].appr_cnt;
		_data3[nRow] = dataset[nRow].stand_by_cnt;
		_data4[nRow] = dataset[nRow].cancel_cnt;
		_data5[nRow] = dataset[nRow].error_cnt;
		// Chart 데이터 처리 시작 =========================
	}
	
	if(dataset.length > 6) {
		default_value_spacing = default_value_spacing / dataset.length / 2;
	}
	
	var chart_all_datasets = [
		{
	        label: "요청",
	        fillColor: "rgba(79,129,189,1)",
	        strokeColor: "rgba(79,129,189,1)",
	        highlightFill: "rgba(79,129,189,0.8)",
	        highlightStroke: "rgba(79,129,189,0.8)",
			data: _data1
	    },
	    {
	        label: "승인",
	        fillColor: "rgba(131,189,79,1)",
	        strokeColor: "rgba(131,189,79,1)",
	        highlightFill: "rgba(131,189,79,0.8)",
	        highlightStroke: "rgba(131,189,79,0.8)",
	    	data: _data2
	    },
	    {
	        label: "대기",
	        fillColor: "rgba(213,159,241,1)",
	        strokeColor: "rgba(213,159,241,1)",
	        highlightFill: "rgba(213,159,241,0.8)",
	        highlightStroke: "rgba(213,159,241,0.8)",
			data: _data3
	    },
	    {
	        label: "취소",
	        fillColor: "rgba(189,170,79,1)",
	        strokeColor: "rgba(189,170,79,1)",
	        highlightFill: "rgba(189,170,79,0.8)",
	        highlightStroke: "rgba(189,170,79,0.8)",
	    	data: _data4
	    },
	    {
	        label: "오류",
	        fillColor: "rgba(192,80,77,1)",
	        strokeColor: "rgba(192,80,77,1)",
	        highlightFill: "rgba(192,80,77,0.8)",
	        highlightStroke: "rgba(192,80,77,0.8)",
			data: _data5
	    }
	];
	

	var chart_datasets = [];
	
	$.each(statRowNameCol, function(i, col_name){
		if(current_search_data[col_name + '_yn'] == 'Y') {
			chart_datasets.push(chart_all_datasets[i]);
		}
   	});
	
	var chart1_data = {
	 	labels: _label,
        datasets: chart_datasets
	}
	
    var chart1_options = {
		    scaleBeginAtZero : true,
		    scaleShowGridLines : true,
		    scaleGridLineColor : "rgba(0,0,0,.05)",
		    scaleGridLineWidth : 1,
		    barShowStroke : true,
		    barStrokeWidth : 1,
		    barValueSpacing : default_value_spacing,
		    barDatasetSpacing : 2,
	        responsive: true ,
	    };

	if (window.barChart1){ 
        window.barChart1.destroy();
    }
    var bar_chart1 = document.getElementById("chart_canvas_1").getContext("2d");
    barChart1 = new Chart(bar_chart1).Bar(chart1_data, chart1_options);
    legend($("#legend_chart_canvas_1"), chart1_data);
	
	// ---------------------- 지점별 쿠폰 데이터 그리드 ---------------------- //
}

loadScript("${pageContext.request.contextPath}/resources/js/plugin/chartjs/chart.min.js", pagefunction);

</script>