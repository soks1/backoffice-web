/**
 * 페이지 전환 (타겟 고정:targetHtml)
 * @param url
 * @param method
 * @param data
 */
function cf_action(url, method, data) {
	$.ajax({
	    url: url, //this is the submit URL
	    type: method, // GET or POST
	    async: true,
	    cache: false,
	    data: data,
	    beforeSend : function() {},
	    success: function(html){
	    	$("#targetHtml").html(html);
	    },
	    error: function() {
	    	alert("페이지 변경에 오류가 발생하였습니다.\n다시 시도해 주시기 바랍니다.");
	    	return;
	    },
	    complete: function() {}
	});
}

/**
 * 페이지 전환 (타겟 지정 가능)
 * @param url
 * @param method
 * @param data
 * @param target
 */
function cf_actionTarget(url, method, data, target) {
	$.ajax({
	    url: url, //this is the submit URL
	    type: method, // GET or POST
	    async: true,
	    cache: false,
	    data: data,
	    beforeSend : function() {},
	    success: function(html){
	    	target.html(html);
	    },
	    error: function() {
	    	alert("페이지 변경에 오류가 발생하였습니다.\n다시 시도해 주시기 바랍니다.");
	    	return;
	    },
	    complete: function() {}
	});
}

/**
 * 싱글 초이스 데이터 자동 등록(input type=hidden 사용)
 * @param url_1
 * @param method
 * @param target
 * @param placeholder
 */
function cf_selectSingle(url_1, method, target, placeholder) {
	$.ajax({
		url: url_1, //this is the submit URL
		dataType: "json",
		type: method,
		async: true,
		cache: false,
		success: function(obj){
			target.select2({
				width: "100%",
				placeholder : placeholder,
				query: function (query){
					var data = { results: [] };
	  	  		    $.each(obj.data, function(i, item) {
		  	  		    if(query.term.length == 0 || item.text.toUpperCase().indexOf(query.term.toUpperCase()) >= 0 ){
		  	  		    	data.results.push({id: item.id, text: item.text });	
		  	  			}
	    			});
		  			query.callback(data);
			    }
			});
		}
		/*,complete: function() {
			// SELECT2-PLUG-IN 선언
			target.select2({placeholder : placeholder, width: '100%'});
		}*/
	});
}

/**
 * Tags Input 데이터 자동 등록(수정 화면 사용)
 * @param url_1
 * @param method
 * @param target
 */
function cf_setDataTagsinput(url_1, method, target) {
	$.ajax({
		url: url_1, //this is the submit URL
		dataType: "json",
		type: method,
		async: true,
		cache: false,
		success: function(obj){
			
			$.each(obj.data, function(i, items) {
				target.tagsinput('add', { id: items.id, text: items.text });
			});
		},
		complete: function() {
			
		}
	});
}

/**
 * 테이블 tr Element의 갯수
 * @param target
 * @returns target Table의 tr count
 */
function cf_getTrElementCount(target) {
	var count = target.children("tr").length;
	
	return count;
}

/**
 * 멀티 셀렉트 데이터 자동 등록(조회, 등록 화면시 사용)
 * @param url_1
 * @param method
 * @param target
 * @param placeholder
 */
function cf_selectMultipleOne(url_1, method, target, placeholder) {	
	$.ajax({
		url: url_1, //this is the submit URL
		dataType: "json",
		type: method,
		async: false,
		cache: true,
		data: encodeURI('params={"key":"korea"}'),
		success: function(obj){
			var options = "";
			if(obj.data.mst_list) {
				$.each(obj.data.mst_list, function(i, items) {
					options += "<option value=\""+items.str_cd+"\">"+items.str_nm+"</option>\n";
				});
				target.html(options);
			}
		},
		complete: function() {
			// SELECT2-PLUG-IN 선언
			target.select2({placeholder : placeholder, closeOnSelect: false});	
		}
	});
}

/**
 * 멀티 셀렉트 데이터 자동 등록(수정 화면시 사용)
 * @param url_1
 * @param method
 * @param target
 * @param placeholder
 * @param url_2
 */
function cf_selectMultiple(url_1, method, target, placeholder, url_2) {	
	
	if(typeof url_2 == "undefined") {
		cf_selectMultipleOne(url_1, method, target, placeholder);
	} else {
		$.ajax({
			url: url_1, //this is the submit URL
			dataType: "json",
			type: method,
			async: true,
			cache: false,
			success: function(obj){
				var options = "";
				$.each(obj.data, function(i, items) {
					options += "<option value=\""+items.id+"\">"+items.text+"</option>\n";
				});
				target.html(options);
			},
			complete: function() {
				// SELECT2-PLUG-IN 선언
				target.select2({placeholder : placeholder, closeOnSelect: false});	
				
				// 기존 데이터 등록
				$.ajax({
					url: url_2, //this is the submit URL
					dataType: "json",
					type: method,
					async: true,
					cache: false,
					success: function(obj){
						var options = target.find("option");
						for(var i = 0; i < options.size(); i++) {
							var option_value = target.find("option:eq("+i+")").val();
							$.each(obj.data, function(i, items) {
								if(option_value == items.id) {
									target.find("option:eq("+i+")").prop("selected","selected");
								}
							});
						}
						target.trigger("change");
					}
				});
			}
		});
	}
}

/**
 * 테이블에서의 체크박스 컨트롤(모두선택,모두해제)
 * @param chk_obj
 */
function cf_cboxAll(chk_obj) {
	$(chk_obj).parents("table").find("tbody").find("input[type='checkbox']").prop("checked",chk_obj.checked);
}

/**
 * 테이블 간이 데이터 이동시 사용(등록시)
 * @param fromTable
 * @param toTable
 */
function cf_addTableRow(fromTable,toTable,keyIndex) {
	$("#"+fromTable).find('tr:has(input:checked)').each(function() {
		var self = this;
		var key = $(self).find('td:eq(' + keyIndex + ')').text() || "";
		
		var hasItem = false;
		$("#"+toTable).find("tr").each(function() {
			if ($(this).data() && $(this).data()['key'] == key) hasItem = true;
		});
		
		if (!hasItem) {
			var $clone = $(self).clone();
			$clone.data($(self).data()).data('key', key).find('input[type=checkbox]:checked').prop('checked', false);
			$("#"+toTable).append($clone);
		}
	});
	/*
	$("#"+fromTable).find("input[type='checkbox']").each(function(i) {
		if($(this).is(":checked")) {
			
			var row = $(this).parent().parent();
			var key = "";
			
			row.find("td").each(function(idx) {
				if(idx == keyIndex) {
					key = $(this).text();
				}
			});
			
			var row_data = row.html();
			row_data = "<tr>" + row_data + "</tr>";
			var chk = 0;
			
			$("#"+toTable).find("tr > td").each(function(idx) {
				if($(this).text() == key) {
					chk++;
				}
			});
			
			if(chk == 0) {
				$("#"+toTable).append(row_data);
			}
		}
	});
	*/
}

/**
 * 테이블 간이 데이터 이동시 사용(삭제시)
 * @param targetTable
 * @param toTable
 */
function cf_delTableRow(targetTable) {
	$("#"+targetTable).find("input[type='checkbox']").each(function(i) {
		if($(this).is(":checked")) {
			var row = $(this).parent().parent();
			row.remove();
		}
	});
}

/**
 * JQ Grid의 링크 부분의 색상 추가
 * @param cellvalue
 * @param options
 * @param rowObject
 * @returns {String}
 */
function cf_pointer(cellvalue, options, rowObject) { 
	var new_formatted_cellvalue = '<span class="pointer">' + cellvalue + '</span>'; 
	return new_formatted_cellvalue; 
}

/**
 * 문자열 치환
 */
String.prototype.replaceAll = function(from_str, to_str) {
	var rtn_str = this.trim();
	rtn_str = rtn_str.replace(eval("/" + from_str + "/gi"), to_str);
	return rtn_str;
};

/**
 * 검색 폼 데이터 리셋
 */
$.fn.cleanObject = function() {

	$(this).find('input[type="hidden"], input[type="text"], input[type="number"], input[type="checkbox"]:checked, select, textarea').each(function() {
		
		if (this.name === null || this.name === undefined || this.name === '')
			return;
		
		if ($(this).is('select')) {
			$(this).find('option:eq(0)').prop("selected","selected");
		}
		else if ($(this).attr('type') == 'checkbox'){
			$(this).prop("checked",false);
		}
		else {
			$(this).val("");
		}
		
	});
};


/**
 * 파일 삭제
 * @param name
 */
function cf_fileDelete(name) {
	var preview = $('#preview_'+name);
	preview.find('img').attr('src',noImgPath);
	preview.parent().find('p').remove();
	var btn_span = $('.btn_del_'+name).parent().find(".btn");
	btn_span.attr("disabled", false);
	btn_span.find("input[type=file]").val("");
	$('.btn_del_'+name).remove();
}

/**
 * 클럽 폼 오브젝트 생성 용
 * @param inputFile
 * @param divnCd
 */
function cf_clubFileObject(obj) {
	
	var $form = obj;
	
	var form_data = $form.serializeFormObject();
	form_data['img_list'] = [];
	
	var file_cnt = $('input[name=img_orgin_file_nm]').length;
	
	if(file_cnt > 0) {
		$form.find('input[name=img_orgin_file_nm]').each(function(i, item) {
			var file_data = {};	
			file_data['img_orgin_file_nm'] = $form.find('input[name=img_orgin_file_nm]').eq(i).val();
			file_data['img_strge_file_nm'] = $form.find('input[name=img_strge_file_nm]').eq(i).val();
			file_data['img_file_divn_cd'] = $form.find('input[name=img_file_divn_cd]').eq(i).val();
			file_data['file_divn_cd'] = $form.find('input[name=file_divn_cd]').eq(i).val();
			file_data['img_type'] = $form.find('input[name=img_type]').eq(i).val();
			form_data['img_list'].push(file_data);	
		});
		return form_data; 
	}
	else {
		return form_data; 
	}
	
}
/**
 * 게시판 폼 오브젝트 생성 용
 * @param inputFile
 * @param divnCd
 */
function cf_boardFileObject(obj) {
	
	var $form = obj;
	
	var form_data = $form.serializeFormObject();
	form_data['noticbd_img_list'] = [];
	
	var file_cnt = $('input[name=img_orgin_file_nm]').length;
	
	if(file_cnt > 0) {
		$form.find('input[name=img_orgin_file_nm]').each(function(i, item) {
			var file_data = {};	
			file_data['img_orgin_file_nm'] = $form.find('input[name=img_orgin_file_nm]').eq(i).val();
			file_data['img_strge_file_nm'] = $form.find('input[name=img_strge_file_nm]').eq(i).val();
			file_data['img_file_divn_cd'] = $form.find('input[name=img_file_divn_cd]').eq(i).val();
			file_data['file_divn_cd'] = $form.find('input[name=file_divn_cd]').eq(i).val();
			form_data['noticbd_img_list'].push(file_data);	
		});
		return form_data; 
	}
	else {
		return form_data; 
	}
	
}


/**
 * 파일 업로드
 * @param inputFile
 * @param divnCd
 */
function cf_fileUpload(inputFile, divnCd, inputSuffix) {
	if (inputSuffix == null) { 
		inputSuffix = ""; 
	}
	var file_cd_map = new HashMap();
	file_cd_map.put('IMG_WIDGETBANNER','WIDGET');
	file_cd_map.put('IMG_MAINBANNER','BANNER');
	file_cd_map.put('IMG_MAINBANNER_CONTENT','CONTENT');
	file_cd_map.put('IMG_MAINPOPUP','POPUP');
	file_cd_map.put('IMG_BENEFIT_LIST','LIST');
	file_cd_map.put('IMG_BENEFIT_CONTENT','CONTENT');
	file_cd_map.put('IMG_NOTICE_CONTENT','CONTENT');
	file_cd_map.put('IMG_FAQ_CONTENT','CONTENT');
	file_cd_map.put('IMG_COOPERATE_BANNER','BANNER');
	file_cd_map.put('IMG_COOPERATE_BANNER_CONTENT','CONTENT');
	file_cd_map.put('IMG_MCLUB_CONTENT','CONTENT');
	file_cd_map.put('IMG_MCLUB_DETAIL_CONTENT','DESC');
	file_cd_map.put('IMG_NOMEM_CPBOOK','CONTENT');
		
	var fileData = inputFile.get(0).files[0];
	var formData = new FormData();

	// 파일 사이즈 체크(17/1/3) 변경
	// 파일 사이즈 체크(17/10/27) 변경 300 -> 400
	if(fileData.size > 409600) {
		alert('400KB 이상의 파일은 업로드 할 수 없습니다.');
		return;
	}

	var preview = $('#preview_'+inputFile.attr('id'));
	if(preview.find('img').attr('src') != noImgPath) {
		alert('기존 파일을 삭제하고 업로드 하시기 바랍니다.');
		return;
	}
	
	formData.append('file', fileData, encodeURI(fileData.name));
	formData.append('file_divn_cd', divnCd);
	formData.append('empno', $('#frmKeepData').find('input[name=empno]').val() );
	
	$.ajax({
		url: api_img_url+"/backoffice/common/file/upload",
		type: 'POST',
		data: formData,
		dataType: 'json',
		cache: false,
		contentType: false,
		processData: false,
		success: function(obj) {
						
			preview.find('img').attr('src',obj.data.prvw_url);
			
			var fName = '<p class="alert alert-info bd0">'+fileData.name+'</p>';
			preview.parent().append(fName); 
			
			var span = $('<span>').addClass('btn_del_'+inputFile.attr('id'));
			var aTag = $('<a>')
						.addClass('btn btn-danger btn-sm')
						.attr('href','javascript:cf_fileDelete(\''+inputFile.attr('id')+'\')')
						.text('파일삭제');
			
			var input_file_divn_cd = $('<input>')
				.attr('type', 'hidden')
				.attr('name', 'file_divn_cd' + inputSuffix)
				.val(obj.data.file_divn_cd);
			
			var input_local_file_name = $('<input>')
						.attr('type', 'hidden')
						.attr('name', 'img_strge_file_nm' + inputSuffix)
						.val(obj.data.local_file_nm);
			
			var input_atch_file_nm = $('<input>')
						.attr('type', 'hidden')
						.attr('name', 'img_orgin_file_nm' + inputSuffix)
						.val(obj.data.atch_file_nm);
			
			// 만보기 이미지 타입 유형
			var img_type = $(inputFile).attr("id").replace("uploadfile", "").substr(0, 1);
			var input_img_type = $('<input>')
			.attr('type', 'hidden')
			.attr('name', 'img_type' + inputSuffix)
			.val(img_type);
			//////////////////////////////////////////
			
			span.append(aTag);
			span.append(input_file_divn_cd);
			span.append(input_local_file_name);
			span.append(input_atch_file_nm);
			span.append(input_img_type);
			
			// TODO: 추 후 필요한 정보는 더 추가 하여 입력 한다.
			
			if(typeof file_cd_map.get(obj.data.file_divn_cd) != 'undefined') {
				var img_file_divn_cd = $('<input>')
					.attr('type', 'hidden')
					.attr('name', 'img_file_divn_cd')
					.val(file_cd_map.get(obj.data.file_divn_cd));
				span.append(img_file_divn_cd);
			}
			
			var btn_div = inputFile.parent().parent();
			btn_div.find("a").attr("disabled", true);
			btn_div.find("span").attr("disabled", true);
			btn_div.append(span);
		},
		error: function(obj) {
			var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;       
		}
	});
}
/**
 * 멀티 파일 업로드(파일타입추가)
 * @param inputFile
 * @param divnCd
 */
function cf_multiFileUpload(inputFile, divnCd, callback) {
	var file_cd_map = new HashMap();
	file_cd_map.put('IMG_MAINBANNER','BANNER');
	file_cd_map.put('IMG_MAINPOPUP','POPUP');
	file_cd_map.put('IMG_BENEFIT_LIST','LIST');
	file_cd_map.put('IMG_BENEFIT_CONTENT','CONTENT');
	file_cd_map.put('IMG_NOTICE_CONTENT','CONTENT');
	file_cd_map.put('IMG_FAQ_CONTENT','CONTENT');
	
	var fileData = inputFile.get(0).files[0];
	var formData = new FormData();
	
	// 파일 사이즈 체크
	if(fileData.size > 409600) {
		alert('400KB 이상의 파일은 업로드 할 수 없습니다.');
		return;
	}		
	
	var preview = $('#preview_'+inputFile.attr('id'));
	
	if(preview.find('img').attr('src') != noImgPath) {
		alert('기존 파일을 삭제하고 업로드 하시기 바랍니다.');
		return;
	}	
	formData.append('file', fileData, encodeURI(fileData.name));
	formData.append('file_divn_cd', divnCd);
	formData.append('empno', $('#frmKeepData').find('input[name=empno]').val() );
	
	$.ajax({
		url: api_img_url+"/backoffice/common/file/upload",
		type: 'POST',
		data: formData,
		dataType: 'json',
		cache: false,
		contentType: false,
		processData: false,
		success: function(obj) {
			
			preview.find('img').attr('src',obj.data.prvw_url);
			
			var fName = '<p class="alert alert-info bd0">'+fileData.name+'</p>';
			preview.parent().append(fName); 
			
			var span = $('<span>').addClass('btn_del_'+inputFile.attr('id'));
			var aTag = $('<a>')
			.addClass('btn btn-danger btn-sm')
			.attr('href','javascript:cf_fileDelete(\''+inputFile.attr('id')+'\')')
			.text('파일삭제');
			
			var input_file_divn_cd = $('<input>')
			.attr('type', 'hidden')
			.attr('name', 'file_divn_cd_'+inputFile.attr('id'))
			.val(obj.data.file_divn_cd);
			
			var input_local_file_name = $('<input>')
			.attr('type', 'hidden')
			.attr('name', 'img_strge_file_nm_'+inputFile.attr('id'))
			.val(obj.data.local_file_nm);
			
			var input_atch_file_nm = $('<input>')
			.attr('type', 'hidden')
			.attr('name', 'img_orgin_file_nm_'+inputFile.attr('id'))
			.val(obj.data.atch_file_nm);
			
			var input_file_type = $('<input>')
			.attr('type', 'hidden')
			.attr('name', 'upload_file_type_'+inputFile.attr('id'))
			.val(fileData.type);
			
			span.append(aTag);
			span.append(input_file_divn_cd);
			span.append(input_local_file_name);
			span.append(input_atch_file_nm);
			span.append(input_file_type);
			
			// TODO: 추 후 필요한 정보는 더 추가 하여 입력 한다.
			
			if(typeof file_cd_map.get(obj.data.file_divn_cd) != 'undefined') {
				var img_file_divn_cd = $('<input>')
				.attr('type', 'hidden')
				.attr('name', 'img_file_divn_cd')
				.val(file_cd_map.get(obj.data.file_divn_cd));
				span.append(img_file_divn_cd);
			}
			
			var btn_div = inputFile.parent().parent();
			btn_div.find("a").attr("disabled", true);
			btn_div.find("span").attr("disabled", true);
			btn_div.append(span);
			
			if (callback && $.isFunction(callback)) callback.apply(this, [obj['data']]);
		},
		error: function(obj) {
			var serverObj = obj.responseJSON;
			alert('code:'+serverObj["code"]+'\n\n'+'message:'+cf_msg(serverObj["message"])+'\n');
			return;       
		}
	});
}


/**
 * 엑셀 업로드
 * @param from_form
 * @param to_form
 */
function cf_excelUpload(inputFile, api_url) {
		
	var fileData = inputFile.get(0).files[0];
	var formData = new FormData();
	
	formData.append('file', fileData, encodeURI(fileData.name));
	formData.append('empno', $('#frmExcel').find('input[name=empno]').val());
	formData.append('emp_str_cd', $('#frmExcel').find('input[name=emp_str_cd]').val());
	
	if(api_url == undefined || api_url.length == 0){
		api_url = "/backoffice/coupon/excel/upload";
	}
	
	$.ajax({
		url: api_img_url+api_url,
		type: 'POST',
		data: formData,
		dataType: 'json',
		cache: false,
		contentType: false,//"multipart/form-data",
		processData: false,
		success: function(obj) {
			$("#coupon_grid").trigger("reloadGrid");
			$('#excel_upload_wd').dialog("close");
		},
		error: function(obj) {
			var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n\n'+'message:'+cf_msg(serverObj.message)+'\n'+'data:'+cf_msg(serverObj.data)+'\n');
	    	return;       
		}
	});
}

/**
 * 검색 유지 조건들 셋팅
 * @param from_form
 * @param to_form
 */
function cf_keepDataLoader(from_form, to_form) {
	to_form.find('input[type="hidden"], input[type="text"], input[type="number"], input[type="checkbox"], select').each(function() {
		if (this.name === null || this.name === undefined || this.name === '') {
			return;
		}
		var name = $(this).attr("name");
		var $obj_search = from_form.find('input[name="search_info['+name+']"]');
		if($obj_search.length > 0) {
			
			if($(this).is('select')) {
				$(this).val($obj_search.val()).prop("selected","selected");
			}
			else if($(this).attr("type") == "radio") {
				$(this).val($obj_search.val()).prop("selected","selected");
			}
			else if($(this).attr("type") == "checkbox") {
				$(this).val($obj_search.val()).prop("checked","checked");
			}
			else {
				if($(this).hasClass('datepicker')) {
					if($obj_search.val() != null && $obj_search.val() != '') {
						$(this).val($obj_search.cvtDateHyphen());
					}
				}
				else {
					$(this).val($obj_search.val());
				}
			}
		}
		
		var $obj_search = from_form.find('input[name="search_info['+name+'][]"]');
		if($obj_search.length > 0) {
			if($(this).is('select')) {
				$(this).val($obj_search.val()).prop("selected","selected");
			}
			else if($(this).attr("type") == "radio") {
				$(this).val($obj_search.val()).prop("selected","selected");
			}
			else if($(this).attr("type") == "checkbox") {
				$(this).val($obj_search.val()).prop("checked","checked");
			}
			else {
				if($(this).hasClass('datepicker')) {
					if($obj_search.val() != null && $obj_search.val() != '') {
						$(this).val($obj_search.cvtDateHyphen());
					}
				}
				else {
					$(this).val($obj_search.val());
				}
			}
		}
	});
}

/**
 * 날짜 정보 변경(그리드 부분에서 사용)
 * @param cellvalue
 * @param options
 * @param rowObject
 * @returns {String}
 */
function cf_cvtJqGridDate(cellvalue, options, rowObject) {
	
	var yyyy = cellvalue.substr(0,4);
	var mm = cellvalue.substr(4,2);
	var dd = cellvalue.substr(6,2);
	
	return yyyy + "-" + mm + "-" + dd;
}

/**
 * 날짜 밸리데이션 펑션
 * @param strDate
 * @returns {Boolean}
 */
function cf_dateValid(strDate) {
	
	var msg1 = "날짜 형식을 맞춰주시기 바랍니다.(yyyyMMdd)";
	var msg2 = "년/월/일을 정확히 입력해 주시기 바랍니다.";
	
	// 기본 형식 위배 검사(8자리 인지 확인)
	if(strDate.length != 8) {
		alert(msg1);
		return false;
	}
		
	// 숫자 8자리 입력 검사
	var repace_str = repace_str.replace(/[^0-9]/gi, '');
	if(repace_str.length != 8) {
		alert(msg1);
		return false;
	}
	
	// 년, 월, 일 추출
	var y = repace_str.substr(0,4);
	var m = repace_str.substr(4,2);
	var d = repace_str.substr(6,2);
	
	// 년도 위배 검사(2000년도 이상인지 확인)
	if(parseInt(y.substr(0,1)) < 2) {
		alert(msg2);
		return false;
	}
	
	// 월값 위배 검사(12월이 넘는지 확인)
	if(parseInt(m) > 12) {
		alert(msg2);
		return false;
	}
	
	// 일값 위배 검사(입력 받은 월의 마지막날 보다 큰지 검사)
	var endOfDay = new Date(y, m, 0);
	if(parseInt(d) > parseInt(endOfDay.getDate())) {
		alert(msg2);
		return false;
	}
	
	return true;
}


/**
 * @param strDate
 * @returns {Boolean}
 */
function cf_dateValidHyphen(strDate) {
	
	var msg1 = "날짜 형식을 맞춰주시기 바랍니다.(yyyy-MM-dd)";
	var msg2 = "년/월/일을 정확히 입력해 주시기 바랍니다.";
	
	// 기본 형식 위배 검사(10자리 인지 확인)
	if(strDate.length != 10) {
		alert(msg1);
		return false;
	}
	
	// 하이픈 유효성 검사
	if(strDate.indexOf("-")  < 0) {
		alert(msg1);
		return false;
	}
	
	// 숫자 8자리 입력 검사
	var repace_str = strDate.replaceAll("-","");
	repace_str = repace_str.replace(/[^0-9]/gi, '');
	if(repace_str.length != 8) {
		alert(msg1);
		return false;
	}
	
	// 년, 월, 일 추출
	var y = repace_str.substr(0,4);
	var m = repace_str.substr(4,2);
	var d = repace_str.substr(6,2);
	
	// 년도 위배 검사(2000년도 이상인지 확인)
	if(parseInt(y.substr(0,1)) < 2) {
		alert(msg2);
		return false;
	}
	
	// 월값 위배 검사(12월이 넘는지 확인)
	if(parseInt(m) > 12) {
		alert(msg2);
		return false;
	}
	
	// 일값 위배 검사(입력 받은 월의 마지막날 보다 큰지 검사)
	var endOfDay = new Date(y, m, 0);
	if(parseInt(d) > parseInt(endOfDay.getDate())) {
		alert(msg2);
		return false;
	}
	
	return true;
}


/**
 * 종료 시작일 검사
 * @param from
 * @param to
 * @returns {Boolean}
 */
function cf_checkOfFromToDate(from, to) {
	
	var f_date = from.replaceAll("-","");
	var t_date = to.replaceAll("-","");
	
	if(parseInt(f_date) > parseInt(t_date)) {
		alert("종료일이 시작일 보다 이전일 수 없습니다.");
		return false;
	}
	
	return true;
}

/**
 * date format 변경
 * @param text 8자리 text 값 (ex. 20150121)
 * @param format 변경할 format
 * @returns changed date
 */
function cf_changeDateFormat(text, format) {
	var d = $.datepicker.parseDate("yymmdd",  text);
	var chnageFormat = $.datepicker.formatDate(format, d);
	
	return chnageFormat;
}

/**
 * chart legend append
 * @param target (chart legend target)
 * @param data (chart legend data)
 * @returns chart lenged append data 
 */
function legend(target, data) {
	
	var obj = data;
	var keys = Object.keys(obj);
	for (var i in keys) {
		console.log("for::::::::::::::::::::key="+keys[i] + "::::::::::, data="+obj[keys[i]] );
	}
	
    target.text('');		// string reset
	target.css('padding-top','10px');
	target.css('text-align','right');
	
    var datasets = data.datasets;
    if(datasets == null){datasets=data;}  // pie chart do not have datasets
    datasets.forEach(function(item) {
    	var bgcolor = item.hasOwnProperty('strokeColor') ? item.strokeColor : item.color;
    	var span = $('<span>');
    	
    	span.addClass('label');
    	span.css('background-color',bgcolor);
    	span.html('&nbsp;');
    	
    	var text = $('<span>');
    	text.css('padding','0 7px');
    	text.html(item.label);
    	
    	target.append(span);
    	target.append(text);
    });
}

(function($){
	$.fn.upload = function(arg1) {
		var _arguments = arguments, return_data = [];
		
		this.each(function() {
			var self = this;
			
			function init() {
				var settings = $.extend({maxsize: 150}, arg1);
				$(self).data('settings', settings);
				
				if ($(self).attr('type') != 'file') {
					alert('ERROR: upload plugin은 파일 타입만 사용할 수 있습니다.');
					return false;
				}
				
				$(self).parents('span.fileinput-button').css({'margin-right': '3px'});
				
				if ( settings['preview'] && $(settings['preview']).length > 0 && $(settings['preview']).get(0).tagName.toUpperCase() == 'IMG') {
					self['preViewElement'] = $(settings['preview']).data('defaultUrl', $(settings['preview']).attr('src')).on('error', function(){
						//self['originalName'] = $('<p></p>').addClass('alert alert-info bd0').text( $(this).data('originalName') || '' ).insertAfter( $(settings['preview']) );
					});
				}
				
				var $span = $('<span>').hide().insertAfter( $(self).parent() );
				var $removeButton = $('<a>', {'href': '#'}).addClass('btn btn-danger btn-sm')
						.on('click', function(e) {
							e.preventDefault();
							//reset();
							removeFiletag();
						})
						.text('파일삭제').appendTo( $span );
				
				self['removeButton'] = $span;
				
				$(self).on('change', function() {
					var fileElement = this;
					var isValid = true;
					$.each(this.files, function() {
						var fileItem = this;
						var _ext = fileItem['name'].substring(fileItem['name'].lastIndexOf('.')) || '';
						if (settings['type'] && typeof settings['type'] === 'string' && !new RegExp(settings['type']).test(fileItem['type'] || _ext)) {
							alert('업로드 가능한 파일 종류가 아닙니다.');
							isValid = false;
							return false;
						}
						
						if (settings['maxsize'] && typeof settings['maxsize'] === 'number' && settings['maxsize'] * 1024 < fileItem['size']) {
							alert('최대파일 용량은 ' + settings['maxsize'] + 'kb를 초과할 수 없습니다.');
							isValid = false;
							return false;
						}
						
						if ($(fileElement).hasClass('hasFile')) {
							alert('기존 파일을 삭제하고 업로드 하시기 바랍니다.');
							isValid = false;
							return false;
						}
					});
					
					if (isValid) {
						$.each(this.files, function() {
							reset();
							
							var fileItem = this;
							var formData = new FormData();
							formData.append('file', fileItem, encodeURI(fileItem['name']));
							formData.append('file_divn_cd', settings['file_divn_cd']);
							formData.append('empno', $.getSessionData()['empno'] );
							
							$.ajax({
								url: api_img_url+"/backoffice/common/file/upload",
								type: 'POST',
								data: formData,
								dataType: 'json',
								cache: false,
								contentType: false,
								processData: false,
								success: function(data, textStatus, jqXHR) {
									if (data['code'] && data['code'] == 'S0000') success(data['data']);
									else alert(data['message'] || '파일 업로드 중 오류가 발생했습니다.');
								},
								error: function(jqXHR, textStatus, errorThrown) {
									var serverObj = jqXHR.responseJSON;
							    	alert('code:'+serverObj.code+'\n\n'+'message:'+cf_msg(serverObj.message)+'\n');
							    	return;       
								}
							});
						});
					}
				});
				
				return $(self);
			};
			
			function reset() {
				$(self).removeClass('hasFile').removeData('fileinfo');
				$(self).parents('span.fileinput-button').attr('disabled', false);
				if (self['originalName']) self['originalName'].remove();
				if (self['removeButton']) self['removeButton'].hide();
				if (self['preViewElement']) self['preViewElement'].attr('src', self['preViewElement'].data('defaultUrl'));
			};
			
			function removeFiletag() {
				$(self).removeClass('hasFile').removeData('fileinfo');
				$(self).parents('span.fileinput-button').attr('disabled', false);
				if (self['originalName']) self['originalName'].remove();
				if (self['removeButton']) self['removeButton'].hide(); 
				if (self['preViewElement']) self['preViewElement'].attr('src', self['preViewElement'].data('defaultUrl'));
				$(self).val("");
			}
			
			function success(_data) {
				$(self).addClass('hasFile').data('fileinfo', _data);
				var settings = $(self).data('settings') || {};
				if ( settings['preview'] && $(settings['preview']).length > 0 && $(settings['preview']).get(0).tagName.toUpperCase() == 'IMG') {
					$(settings['preview']).data('originalName', _data['atch_file_nm']).attr('src', _data['prvw_url']);
				}
				
				self['originalName'] = $('<p></p>').addClass('alert alert-info bd0').text( _data['atch_file_nm'] || '' ).insertAfter( $(settings['preview']) );
				self['removeButton'].show();
				$(self).parents('span.fileinput-button').attr('disabled', true);
				
				return $(self);
			};
			
			if (typeof arg1 === 'string') {
				if (arg1 == 'reset') reset();
				else if (arg1 == 'fileinfo') {
					if (_arguments[1] === undefined)
						return_data.push( $(self).data('fileinfo') || {} );
					else
						return_data.push( success(_arguments[1]) );
				}
			}
			else return_data.push( init() );
		});
		
		return return_data[0];
	}
})(jQuery);

var ajaxBlockUI = ajaxBlockUI || (function ($) {
    'use strict';

	// Creating modal dialog's DOM
	var $dialog = $(
		'<div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' +
		'</div>');
	var $dialogContents = $(
		'<div class="modal-dialog modal-m" role="document">' +
		'<div class="modal-content">' +
			'<div class="modal-header"><h3 style="margin:0;"></h3></div>' +
			'<div class="modal-body">' +
				'<div class="progress progress-striped active" style="margin-bottom:0;"><div class="progress-bar" style="width: 100%"></div></div>' +
			'</div>' +
		'</div></div>');

	return {
		/**
		 * Opens our dialog
		 * @param message Custom message
		 * @param options Custom options:
		 * 				  options.dialogSize - bootstrap postfix for dialog size, e.g. "sm", "m";
		 * 				  options.progressType - bootstrap postfix for progress bar type, e.g. "success", "warning".
		 */
		show: function (message, options) {
			// Assigning defaults
			if (typeof options === 'undefined') {
				options = {};
			}
			if (typeof message === 'undefined') {
				message = 'Loading';
			}
			var settings = $.extend({
				dialogSize: 'm',
				progressType: '',
				onHide: null // This callback runs after the dialog was hidden
			}, options);

			$dialog.append( $dialogContents );
			// Configuring dialog
			$dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass('modal-' + settings.dialogSize);
			$dialog.find('.progress-bar').attr('class', 'progress-bar');
			if (settings.progressType) {
				$dialog.find('.progress-bar').addClass('progress-bar-' + settings.progressType);
			}
			$dialog.find('h3').text(message);
			// Adding callbacks
			if (typeof settings.onHide === 'function') {
				$dialog.off('hidden.bs.modal').on('hidden.bs.modal', function (e) {
					//settings.onHide.call($dialog);
				});
			}
			// Opening dialog
			$dialog.modal();
		},
		/**
		 * Closes dialog
		 */
		hide: function () {
		    $dialog.modal('hide');
		}
	};

})(jQuery);

$(document).ajaxSend(function(event, jqxhr, settings) {
	jqxhr.setRequestHeader("access_token", localStorage.getItem('access_token'));
	
	if (settings['type'].toUpperCase() == 'POST' && settings['url'].indexOf('/apis/') > 0 && settings['async']) {
		if (ajaxBlockUI) {
		    ajaxBlockUI.show('처리중입니다...');
		}
	}
});

$(document).ajaxStart(function() {
	//console.debug('ajaxStart : ', arguments)
	//ajaxBlockUI.show('Processing');
});

$(document).ajaxComplete(function(event, xhr, settings) {
	var serverObj = xhr.responseJSON;
	if (serverObj != undefined && serverObj.data != undefined && serverObj.data.access_token != undefined) {
		localStorage.setItem('access_token', serverObj.data.access_token);
	}
	
	if (ajaxBlockUI) {
        ajaxBlockUI.hide();
	}
});

$(document).ajaxError(function(event, jqxhr, settings, thrownError) {
	var serverObj = jqxhr.responseJSON;
	
	if (serverObj.code == "S3120" || serverObj.code == "S3121" || serverObj.code == "S3122") {
		alert(serverObj.message);
		location.href = '/login.do';
	}
	else if (serverObj.code == "S4100") {
		alert(serverObj.message);
	}
});