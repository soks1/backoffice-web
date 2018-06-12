<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i> </span>
					<h2> 역할 목록 </h2>
				</header>
				<div>
					<div class="jarviswidget-editbox"></div>
					<div id="target_role_name_grid" class="widget-body no-padding">
						<table id="role_name_grid"></table>
						<div id="role_name_grid_page"></div>
					</div>
				</div>
			</div>
		</article>
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6" id="edit_area" style="display:none;">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-edit"></i> </span>
					<h2>역할 수정</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body">
						<form class="form-horizontal" method="post" id="frmRoleName">
							<input type="hidden" name="empno" value="${sessionScope.sessionEmpno}">
							<input type="hidden" name="emp_str_cd" value="${sessionScope.sessionStrCd}">
							<input type="hidden" name="hq_base_yn" value="${sessionScope.sessionHqBaseYn}">
							<input type="hidden" name="rol_id" value="">
							<fieldset>
								<legend></legend>
								<div class="form-group">
									<label class="col-md-2 control-label">역할명</label>
									<div class="col-md-10">
										<input class="form-control" name="rol_nm" type="text" data-valid-use="true" data-valid-max="50" data-valid-symbol="true" data-valid-title="역할명">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">역할설명</label>
									<div class="col-md-10">
										<textarea class="form-control" name="rol_desc" rows="5" data-valid-max="200" data-valid-symbol="true" data-valid-title="역할설명"></textarea>
									</div>
								</div>
							</fieldset>
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:f_modify();" class="btn btn-primary btn_auth_update">저장</a>
										<a href="javascript:f_cancel('edit');" class="btn btn-default">취소</a>
										<a href="javascript:f_delete();" class="btn btn-danger btn_auth_delete">삭제</a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</article>
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6" id="add_area" style="display:none;" >
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-edit"></i> </span>
					<h2>역할 추가</h2>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body">
						<form class="form-horizontal" method="post" id="frmRoleNameAdd">
							<input type="hidden" name="empno" value="${sessionScope.sessionEmpno}">
							<input type="hidden" name="emp_str_cd" value="${sessionScope.sessionStrCd}">
							<input type="hidden" name="hq_base_yn" value="${sessionScope.sessionHqBaseYn}">
							<fieldset>
								<legend></legend>
								<div class="form-group">
									<label class="col-md-2 control-label">역할명</label>
									<div class="col-md-10">
										<input class="form-control" name="rol_nm" type="text" data-valid-use="true" data-valid-max="50" data-valid-symbol="true" data-valid-title="역할명">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">역할설명</label>
									<div class="col-md-10">
										<textarea class="form-control" name="rol_desc" rows="5" data-valid-max="200" data-valid-symbol="true" data-valid-title="역할설명"></textarea>
									</div>
								</div>
							</fieldset>
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<a href="javascript:f_submit();" class="btn btn-primary btn_auth_create">저장</a>
										<a href="javascript:f_cancel('add');" class="btn btn-default">취소</a>
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

<script type="text/javascript">

function f_cancel(type) {
	var add_obj = $('#add_area');
	var edit_obj = $('#edit_area');
	if(type == 'add') {
		add_obj.find('input[name=rol_nm]').val('');
		add_obj.find('input[name=rol_desc]').val('');
		add_obj.hide();	
	}
	else if(type == 'edit') {
		edit_obj.find("input[name=rol_id]").val('');
		edit_obj.find("input[name=rol_nm]").val('');
		edit_obj.find("textarea[name=rol_desc]").val('');
		edit_obj.hide();
	}
	else {
		add_obj.find('input[name=rol_nm]').val('');
		add_obj.find('input[name=rol_desc]').val('');
		add_obj.hide();
		edit_obj.find("input[name=rol_id]").val('');
		edit_obj.find("input[name=rol_nm]").val('');
		edit_obj.find("textarea[name=rol_desc]").val('');
		edit_obj.hide();
	}
}

function f_delete() {
	var data = {
			empno : $('#edit_area').find('input[name=empno]').val(),
			rol_id_list : [$('#edit_area').find('input[name=rol_id]').val()]
		};
	
	$.ajax({
	    url: api_url+"/bo/authority/npmt_bo_08003", //this is the submit URL
	    type: 'POST', // GET or POST
	    datatype: 'json',
	    contentType: "application/json;charset=utf-8",
	    async: true,
	    cache: false,
	    data: JSON.stringify(data),
	    beforeSend : function() {},
	    success: function(obj){
	    	alert(obj.message);
	    	$("#role_name_grid").trigger("reloadGrid");
	    	
	    	var edit_obj = $('#edit_area');
	    	edit_obj.find("input[name=rol_id]").val('');
			edit_obj.find("input[name=rol_nm]").val('');
			edit_obj.find("textarea[name=rol_desc]").val('');
			edit_obj.hide();
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
}

function f_modify() {
	if($('#frmRoleName').formValid()) {
		$.ajax({
		    url: api_url+"/bo/authority/npmt_bo_08002", //this is the submit URL
		    type: 'POST', // GET or POST
		    datatype: 'json',
		    contentType: "application/json;charset=utf-8",
		    async: true,
		    cache: false,
		    data: JSON.stringify($("#frmRoleName").serializeFormObject()),
		    beforeSend : function() {},
		    success: function(obj){
		    	alert(obj.message);
		    	$("#role_name_grid").trigger("reloadGrid");
		    },
		    error: function(obj) {
		    	var serverObj = obj.responseJSON;
		    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
		    	return;
		    }
		});
	}
}

function f_submit() {
	if($('#frmRoleNameAdd').formValid()) {
		$.ajax({
		    url: api_url+"/bo/authority/npmt_bo_08001", //this is the submit URL
		    type: 'POST', // GET or POST
		    datatype: 'json',
		    contentType: "application/json;charset=utf-8",
		    async: true,
		    cache: false,
		    data: JSON.stringify($("#frmRoleNameAdd").serializeFormObject()),
		    beforeSend : function() {},
		    success: function(obj){
		    	alert(obj.message);
		    	$("#role_name_grid").trigger("reloadGrid");
		    	var add_obj = $('#add_area');
		    	add_obj.find('input[name=rol_nm]').val('');
		    	add_obj.find('input[name=rol_desc]').val('');
		    	$('#add_area').hide();
		    },
		    error: function(obj) {
		    	var serverObj = obj.responseJSON;
		    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
		    	return;
		    }
		});
	}
}
/* ============================================================================================
/* 페이지 정보 설정
/* --------------------------------------------------------------------------------------------
/* 초기 설정 및 필요 UI 컴포넌트 셋팅
/* ============================================================================================ */	
var pagefunction = function() {
	
	// 버튼 권한별 설정
	if('${sessionScope.menuAuth.U}' != 'Y') {
		$('.btn_auth_update').remove();
	}
	if('${sessionScope.menuAuth.D}' != 'Y') {
		$('.btn_auth_delete').remove();
	}
	if('${sessionScope.menuAuth.C}' != 'Y') {
		$('.btn_auth_create').remove();
	}
	
	loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/jquery.jqGrid.min.js", run_jqgrid_function);

	function run_jqgrid_function() {
		
		var pageWidth = $("#role_name_grid").parent().width() - 100;

		jQuery("#role_name_grid").jqGrid({
			url : api_url+"/bo/authority/npmt_bo_08000",
			mtype: 'GET',
			datatype : "json",
			colNames : ['No.', '역할명', '역할설명', '등록일자'],
			colModel : [
				{ name : 'no', 			index : 'no',		 	align : "center",	sortable : false, 	width : (pageWidth*(5/100))		},
				{ name : 'rol_nm', 		index : 'rol_nm', 		align : "center",	sortable : false, 	width : (pageWidth*(41/100)),	classes:'pointer' }, 
				{ name : 'rol_desc', 	index : 'rol_desc', 	align : "center", 	sortable : false, 	width : (pageWidth*(42/100))	},  
				/* { name : 'mod_id_name', index : 'mod_id_name', 	align : "center", 	sortable : false, 	width : (pageWidth*(12/100))	}, */
				{ name : 'reg_date', 	index : 'reg_date', 	align : "center", 	sortable : false, 	width : (pageWidth*(12/100))	}
			],
			jsonReader: {
				repeatitems : false,
				id : "rol_id",
				root : 		function(obj){ return obj.data.role_list; },				// 루트가 될 데이터 셋 명칭
				records : 	function(obj){ return obj.data.page_info.records; },	// 총 레코드 수
				page : 		function(obj){ return obj.data.page_info.page; }, 	// 현재 보여지는 페이지
				total : 	function(obj){ return obj.data.page_info.total; }	// 페이지 블럭수
			},
			serializeRowData: function (postData) { return encodeURI("params="+JSON.stringify(postData)); },
			serializeGridData: function(postData) { return encodeURI("params="+JSON.stringify(postData)); },
			postData:{ 
				search_info: '' 
			},
			rowNum : 10,
			rowList : [10, 20, 30],
			pager : '#role_name_grid_page',
			sortname : 'rol_nm',
			sortorder : "asc",
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
					var add_obj = $('#add_area');
			    	add_obj.find('input[name=rol_nm]').val('');
			    	add_obj.find('input[name=rol_desc]').val('');
			    	add_obj.hide();
			    	
			    	var edit_obj = $('#edit_area');
			    	var name = $(this).jqGrid('getCell', rowid, 'rol_nm');
					var discription = $(this).jqGrid('getCell', rowid, 'rol_desc');

					edit_obj.find("input[name=rol_id]").val(rowid);
					edit_obj.find("input[name=rol_nm]").val(name);
					edit_obj.find("textarea[name=rol_desc]").val(discription);
					edit_obj.show();
			   }
			}
		});
		jQuery("#role_name_grid").jqGrid('navGrid', "#role_name_grid_page", {
			edit : false, add : false, del : false, 
			search : false, refresh : false, view:false, position: 'right'
		});
		
		// -------------------------- 버튼 영역 시작 -------------------------- //
		if('${sessionScope.menuAuth.C}' == 'Y') {
			jQuery('#role_name_grid').jqGrid('navButtonAdd','#role_name_grid_page',{
				caption: '추가',
				id: 'add_button',
				buttonicon: 'ui-icon-plus',
				onClickButton: function(){
					$("#edit_area").hide();
					$('#add_area').show();
				}
			});
		}
		// -------------------------- 버튼 영역 종료 -------------------------- //
		
		$('#role_name_grid').gridCss();
	  	$("#role_name_grid_cb").css("border-left-width","0");
	  	$("#role_name_grid_cb").css("padding-left","4px");
	  	$("#jqgh_role_name_grid_cb").css("padding","7px 0");
	  	$("#role_name_grid_page_right").find(".ui-pg-table, .navtable").css("float","right");
	  
	    // auto resize grid
	    $(window).on('resize.jqGrid', function () {
			jQuery("#role_name_grid").jqGrid( 'setGridWidth', $("#target_role_name_grid").width() );
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


