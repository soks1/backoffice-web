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
					<div id="target_role_grid" class="widget-body no-padding">
						<table id="role_grid"></table>
						<div id="role_grid_page"></div>
					</div>
				</div>
			</div>
		</article>
		<article class="col-sm-12 col-md-12 col-lg-6">
			<div class="jarviswidget jarviswidget-color-blue" id="wid-id-1" data-widget-editbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
					<h2>역할별 메뉴접근 관리 </h2>
				</header>
				
				<div>
					<div class="jarviswidget-editbox"></div>
					<div class="widget-body">
						<form id="frmRolMenu">
							<div class="tree smart-form" >
								<ul id="menu">
								</ul>
							</div>
						</form>
						<div class="form-actions">
							<div class="row">
								<div class="col-md-12">
									<a href="javascript:f_submit();" class="btn btn-primary btn_auth_create" style="display:none;">저장</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</article>
	</div>
</section>

<form id="frmEmpInfo">
	<input type="hidden" name="empno" value="${sessionScope.sessionEmpno}">
	<input type="hidden" name="emp_str_cd" value="${sessionScope.sessionStrCd}">
	<input type="hidden" name="hq_base_yn" value="${sessionScope.sessionHqBaseYn}">
	<input type="hidden" name="rol_id" value="">
</form>

<script type="text/javascript">

// 메뉴 권한 수정 후 저장 펑션
function f_submit() {
	
	var obj_rtn = {};
	var obj_array = [];
	
	$("#frmRolMenu").find("input[type=checkbox]:checked").each(function() {
		var obj = {};	
		var menu_id = $(this).attr('name');
		var menu_role_type_crud = $(this).val();
		
		obj['menu_id'] =  menu_id;
		obj['menu_role_type_cd'] =  menu_role_type_crud;
		obj_array.push(obj);
	});
	
	obj_rtn['menu_list'] = obj_array;
	obj_rtn['empno'] = $('input[name=empno]').val();
	obj_rtn['rol_id'] = $('input[name=rol_id]').val();
	obj_rtn['reg_id'] = $('input[name=reg_id]').val();
	
	$.ajax({
	    url: api_url+"/bo/authority/npmt_bo_08201",
	    type: "POST",
	    async: true,
	    cache: false,
	    datatype: 'json',
	    contentType: "application/json;charset=utf-8",
	    data: JSON.stringify(obj_rtn),
	    beforeSend : function() {},
	    success: function(obj){
	    	alert(obj.message);
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    },
	    complete: function() {}
	});
}

// 초기 체크박스 선택시 조회 권한 정보 자동 설정
function f_menuPermission(obj) {
	if(obj.checked) {
		$(obj).parents("span").find("a").editable("setValue", "R");
	} else {
		$(obj).val("");
		$(obj).parents("span").find("a").editable('setValue', null);
	}
}

// 메뉴 아이템 재귀함수로 호출하여 등록 시킨다.
var getMenuItem = function (itemData) {
	var item = "";
	
	if (itemData.menu_items.length > 0) {
		var append = "";
		append += "<i class='fa fa-lg fa-minus-circle'></i> "+itemData.menu_nm;
		item = $("<li>").append($("<span>").html(append));	
	} else {
		var append = "";
		append += "<label class='checkbox inline-block'> "+itemData.menu_nm+"<input type='checkbox' name='"+itemData.menu_id+"' value='"+itemData.menu_role_type_crud+"' onchange='f_menuPermission(this);''><i></i></label>";
		append += "<a href='form-x-editable.html#' class='menu_a_auth' data-source='"+JSON.stringify(itemData.menu_permission)+"' data-type='checklist' data-value='"+itemData.menu_role_type_crud+"' data-original-title='권한 선택'></a>";
		item = $("<li>").append($("<span>").html(append));
	}
	
       if (itemData.menu_items.length > 0) {
           var subList = $("<ul>");
           $.each(itemData.menu_items, function () {
               subList.append(getMenuItem(this));
           });
           item.append(subList);
       }
       return item;
   };

// 메뉴 데이터 호출
function f_loadMenu() {
	$.ajax({
		url: api_url+"/bo/authority/npmt_bo_08200",
		type: 'GET',
		async: false,
		cache: true,
		dataType: 'json',
		data: encodeURI("params="+JSON.stringify($("#frmEmpInfo").serializeFormObject())),
		success: function(obj) {
			var $menu = $("#menu");
			$menu.html("");
			$.each(obj.data.menu_list, function(i, items) {
				$menu.append(
		            getMenuItem(this)
		        );
			});
		},
		complete: function() {
			loadScript("${pageContext.request.contextPath}/resources/js/plugin/x-editable/x-editable.min.js", runXEditLoader);
			
			// 기존 로더 스크립트 대신 사용
			$('.tree > ul').attr('role', 'tree').find('ul').attr('role', 'group');
			$('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', 'Collapse this branch').on('click', function(e) {
				var children = $(this).parent('li.parent_li').find(' > ul > li');
				if (children.is(':visible')) {
					children.hide('fast');
					$(this).attr('title', 'Expand this branch').find(' > i').removeClass().addClass('fa fa-lg fa-plus-circle');
				} else {
					children.show('fast');
					$(this).attr('title', 'Collapse this branch').find(' > i').removeClass().addClass('fa fa-lg fa-minus-circle');
				}
				e.stopPropagation();
			});
			
			$('.btn_auth_create').show();
		}
	});
	
	function runXEditLoader() {

	    $.fn.editable.defaults.mode = 'inline';

	    $('.menu_a_auth').editable({
	    	pk: 1,
	    	emptytext : '권한설정',
	    	defaultValue : 'R',
	    	display: function(value, sourceData) {
				
	    		var html = [], cbox_value = [], checked = $.fn.editableutils.itemsByValue(value, sourceData);
				var cbox = $(this).parent().find("input[type='checkbox']");
				
				if(checked.length) {
					$.each(checked, function(i, v) {
						cbox_value.push($.fn.editableutils.escape(v.value));
						html.push($.fn.editableutils.escape(v.text)); 
					});
					cbox.val(cbox_value.join(','));
					cbox.prop("checked",true);
					$(this).html(html.join(', '));
				} else {
					$(this).empty();
					cbox.prop("checked",false);
				}
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
	
	if('${sessionScope.menuAuth.C}' != 'Y') {
		$('.btn_auth_create').remove();
	}
	
	loadScript("${pageContext.request.contextPath}/resources/js/plugin/jqgrid/jquery.jqGrid.min.js", run_jqgrid_function);

	function run_jqgrid_function() {
		
		var pageWidth = $("#role_grid").parent().width() - 100;

		jQuery("#role_grid").jqGrid({
			url : api_url+"/bo/authority/npmt_bo_08000",
			mtype: 'GET',
			datatype : "json",
			colNames : ['No.', '역할명', '역할설명'],
			colModel : [
				{ name : 'no', 			index : 'no',		 	align : "center",	sortable : false, 	width : (pageWidth*(5/100))		},
				{ name : 'rol_nm', 		index : 'rol_nm', 		align : "center",	sortable : true, 	width : (pageWidth*(47/100)),	classes:'pointer' }, 
				{ name : 'rol_desc', 	index : 'rol_desc', 	align : "center", 	sortable : false, 	width : (pageWidth*(48/100))	}
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
				search_info: "", 
				empno: '${sessionScope.sessionEmpno}', 
				emp_str_cd: '${sessionScope.sessionStrCd}',
				hq_base_yn: '${sessionScope.sessionHqBaseYn}' 
			},
			rowNum : 10,
			rowList : [10, 20, 30],
			pager : '#role_grid_page',
			sortname : 'rol_nm',
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
				   $("input[name=rol_id]").val(rowid);
				   f_loadMenu();
			   }
			}
		});
		jQuery("#role_grid").jqGrid('navGrid', "#role_grid_page", {
			edit : false, add : false, del : false, 
			search : false, refresh : false, view:false, position: 'right'
		});
		
		$('#role_grid').gridCss();
	  	$("#role_grid_cb").css("border-left-width","0");
	  	$("#role_grid_cb").css("padding-left","4px");
	  	$("#jqgh_role_grid_cb").css("padding","7px 0");
	  	$("#role_grid_page_right").find(".ui-pg-table, .navtable").css("float","right");
	  
	    // auto resize grid
	    $(window).on('resize.jqGrid', function () {
			jQuery("#role_grid").jqGrid( 'setGridWidth', $("#target_role_grid").width() );
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