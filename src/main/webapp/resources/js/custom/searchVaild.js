/* ==================================================================================
 * Copyright © 2014-2015 PENTAWORKS All rights reserved.
 * ================================================================================== */

/**
 * ==================================================================================
 * 검색 폼의 모든 데이터가 조건이 없거나 선택되어져 있지 않은 경우 검사
 * ----------------------------------------------------------------------------------
 * 옵션
 * - data-search-valid-use='true' 		: 필수값 체크시 사용
 * 
 * case input
 * 	- checkbox
 *  - tel
 *  - email
 *  - number
 *  - text
 *  - radio
 * case
 * 	- select
 *  - textarea
 *  
 * 제외 사항
 * 	- input type hidden(keep data)
 *  - input type checkbox(many case value)
 * ==================================================================================
 */
$.fn.searchValid = function() {
	
	var debugF = false;
	var $frm = $(this);
	var rtn_cnt = 0;
	var len_array = new Array();
	
	$frm.find('input[type=tel], input[type=email], input[type=number], input[type=text], input[type=radio], select, textarea').each(function(i){
		
		if (this.name === null || this.name === undefined || this.name === '') {
			return;
		}
		
		if ($(this).is('input')) {
			var type = $(this).attr('type');
			
			if (type == 'radio') {
				if(debugF) {
					console.log('type:input ' + type + ', name:' + $(this).attr('name') + ', checked_length:' + $(this).is(':checked').length);
				}
				len_array[i] = $('input:radio[name='+this.name+']:checked').length;
			}
			else {
				if(debugF) {
					console.log('type:input ' + type + ', name:' + $(this).attr('name') + ', data_length:' + $.trim($(this).val()).length);
				}
				len_array[i] = $.trim($(this).val()).length;
				if( $(this).attr('data-search-valid-use') == 'true' && $.trim($(this).val()).length < 1) {
					len_array = [];
					$(this).focus();
					return false;
				}
			}
		}
		else if ($(this).is('select')) {
			if(debugF) {
				console.log('type:select, name:' + $(this).attr('name') + ', data_length:' + $.trim($(this).children("option:selected").val()).length);
			}
			len_array[i] = $.trim($(this).children("option:selected").val()).length;
			if( $(this).attr('data-search-valid-use') == 'true' && $.trim($(this).children("option:selected").val()).length < 1) {
				len_array = [];
				$(this).focus();
				return false;
			}
		}
		if ($(this).is('textarea')) {
			if(debugF) {
				console.log('type:textarea, name:' + $(this).attr('name') + ', data_length:' + $.trim($(this).val()).length);
			}
			len_array[i] = $.trim($(this).val()).length;
		}
		
	});
	
	for(var i = 0; i < len_array.length; i ++) {
		if(len_array[i] > 0) {
			rtn_cnt++;
		}
	}
	
	if(rtn_cnt > 0) {
		return true;
	} 
	else {
		return false;
	}
};