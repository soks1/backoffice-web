<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2> 직무 목록 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div id="target_role_duty_grid" class="widget-body no-padding">
						<table id="role_duty_grid"></table>
						<div id="role_duty_grid_page"></div>
					</div>
				</div>
			</div>
		</article>
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
			<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-2" data-widget-editbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2> 직무별 역할코드 선택 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body no-padding">
						<form id="frmRoleDuty">
							<input type="hidden" name="duty_id" value="">
							<input type="hidden" name="empno" value="${sessionScope.sessionEmpno}">
							<input type="hidden" name="emp_str_cd" value="${sessionScope.sessionStrCd}">
							<input type="hidden" name="hq_base_yn" value="${sessionScope.sessionHqBaseYn}">
							<div class="table-responsive" style="max-height:417px; overflow: auto;">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th class="ta-c"><input type="checkbox" onchange="cf_cboxAll(this);"></th>
											<th class="ta-c">역할명</th>
											<th class="ta-c">역할 설명</th>
										</tr>
									</thead>
									<tbody id="target_tbody">

									</tbody>
								</table>
							</div>
						</form>
						<div class="dt-toolbar-footer">
							<div class="col-md-12 ta-r">
								<a href="javascript:f_submit();" class="btn btn-primary btn_auth_create" style="display:none;">저장</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>

<script type="text/javascript">

function f_submit() {
	
	var data = {
			empno: '${sessionScope.sessionEmpno}', 
			emp_str_cd: '${sessionScope.sessionStrCd}',
			hq_base_yn: '${sessionScope.sessionHqBaseYn}',
			duty_id : $('#frmRoleDuty').find('input[name=duty_id]').val()
	};
	
	var rol_id_list = new Array();
	
	$("#frmRoleDuty").find('input[name=rol_id]:checked').each(function(i){
		if(this.checked == true){
			rol_id_list[i] = $(this).val();
		} 
	});
	data['rol_id_list'] = rol_id_list;
	
	$.ajax({
	    url: api_url+"/bo/authority/npmt_bo_08102",
	    type: "post",
	    async: true,
	    cache: false,
	    datatype: 'json',
	    contentType: "application/json;charset=utf-8",
	    data: JSON.stringify(data),
	    beforeSend : function() {},
	    success: function(obj){
	    	alert(obj.message);
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
}


/* ============================================================================================
/* 페이지 정보 설정
/* --------------------------------------------------------------------------------------------
/* 초기 설정 및 필요 UI 컴포넌트 셋팅
/* ============================================================================================ */
var pagefunction = function() {
	
	if('${sessionScope.menuAuth.C}' != 'Y') {
		$('.btn_auth_create').remove();
	}
	
	loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/jquery.jqGrid.min.js", run_jqgrid_function);

	function run_jqgrid_function() {
		
		var pageWidth = $("#role_duty_grid").parent().width() - 100;

		jQuery("#role_duty_grid").jqGrid({
			url : api_url+"/bo/authority/npmt_bo_08100",
			mtype: 'GET',
			datatype : "json",
			colNames : ['No.', '직무코드', '직무명', '직무아이디'],
			colModel : [
				{ name : 'no', 			index : 'no',		 	align : "center",	sortable : false, 	width : (pageWidth*(5/100))		},
				{ name : 'duty_cd', 	index : 'duty_cd', 		align : "center",	sortable : true, 	width : (pageWidth*(47/100)),	classes:'pointer' }, 
				{ name : 'duty_nm', 	index : 'duty_nm', 		align : "center", 	sortable : false, 	width : (pageWidth*(48/100))	},
				{ name : 'duty_id', 	index : 'duty_id', 		hidden:true}
			],
			jsonReader: {
				repeatitems : false,
				id : "duty_id",
				root : 		function(obj){ return obj.data.duty_list; },				// 루트가 될 데이터 셋 명칭
				records : 	function(obj){ return obj.data.page_info.records; },	// 총 레코드 수
				page : 		function(obj){ return obj.data.page_info.page; }, 	// 현재 보여지는 페이지
				total : 	function(obj){ return obj.data.page_info.total; }	// 페이지 블럭수
			},
			serializeRowData: function (postData) { return encodeURI("params="+JSON.stringify(postData)); },
			serializeGridData: function(postData) { return encodeURI("params="+JSON.stringify(postData)); },
			postData:{ 
				search_info: '', 
				empno: '${sessionScope.sessionEmpno}', 
				emp_str_cd: '${sessionScope.sessionStrCd}',
				hq_base_yn: '${sessionScope.sessionHqBaseYn}' 
			},
			rowNum : 10,
			rowList : [10, 20, 30],
			pager : '#role_duty_grid_page',
			sortname : 'duty_cd',
			sortorder : "asc",
			viewsortcols : [true, 'vertical', true],  //param1: isShow Icon, param2: vertical or horizontal, param3: click position true는 버튼, false는 icon
			toolbarfilter: true,
			viewrecords : true,
			recordpos : "left",
			multiselect : false,
			multiboxonly: true,
			autowidth : true,
			height : 'auto',
			shrinkToFit : true,
			gridComplete: function(){ },
			// ID click event(row data view)
			onCellSelect: function(rowid, index, contents, event) {
			   if(index == 1) {
					$("input[name=duty_id]").val(rowid);
					$.ajax({
					    url: api_url+"/bo/authority/npmt_bo_08101",
					    type: "GET",
					    async: false,
					    cache: true,
					    datatype: 'json',
					    data: encodeURI("params="+JSON.stringify($("#frmRoleDuty").serializeFormObject())),
					    success: function(obj){
					    	$("#target_tbody").empty();
					    	var duty_role_list = obj.data.duty_role_list;
					    	if(duty_role_list.length > 0) {
					    		$.each(duty_role_list, function(i, item) {
					    			var tag_td = "";
					    			
					    			if(item.chk == 'N') {
					    				tag_td += "<td class='ta-c'><input type='checkbox' name='rol_id' value='"+item.rol_id+"' /></td>";	
					    			} else {
					    				tag_td += "<td class='ta-c'><input type='checkbox' name='rol_id' value='"+item.rol_id+"' checked='checked' /></td>";
					    			}
					    			
						    		tag_td += "<td>" + item.rol_nm + "</td>";
						    		tag_td += "<td>" + item.rol_desc + "</td>";
						    		$("#target_tbody").append("<tr>" + tag_td + "</tr>");
					    		});
					    	}
					    	
							$('.btn_auth_create').show();
					    }
					});
			   }
			}
		});
		jQuery("#role_duty_grid").jqGrid('navGrid', "#role_duty_grid_page", {
			edit : false, add : false, del : false, 
			search : false, refresh : false, view:false, position: 'right'
		});
		
		$('#role_duty_grid').gridCss();
	  	$("#role_duty_grid_cb").css("border-left-width","0");
	  	$("#role_duty_grid_cb").css("padding-left","4px");
	  	$("#jqgh_role_duty_grid_cb").css("padding","7px 0");
	  	$("#role_duty_grid_page_right").find(".ui-pg-table, .navtable").css("float","right");
	  
	    // auto resize grid
	    $(window).on('resize.jqGrid', function () {
			jQuery("#role_duty_grid").jqGrid( 'setGridWidth', $("#target_role_duty_grid").width() );
		});
	} 
	// end function
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
loadScript('${pageContext.request.contextPath}/resources/js/plugin/jqgrid/grid.locale-en.min.js', pagefunction);
</script>


