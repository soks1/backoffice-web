/* ==================================================================================
 * Copyright © 2014-2015 PENTAWORKS All rights reserved.
 * ================================================================================== */

/**
 * ==================================================================================
 * 공백 체크(NULL 포함)
 * ----------------------------------------------------------------------------------
 * case select
 * 	1. null check 
 * 	2. space check
 * 
 * case other
 * 	1. null check 
 * 	2. space check
 * 
 * common
 * 	1. length zero check
 * ==================================================================================
 */
$.fn.isEmpty = function() {

	if($(this).is('select')) {
		// null check
		if( $(this).children("option:selected").val() == null ) {
			alert( $(this).attr('data-valid-title') + '은(는) 필수 입력(선택) 항목 입니다.' );
			$(this).focus();
			return false;
		}
		
		// space check
		if ( $.trim($(this).children("option:selected").val()) == '' ) {
			alert( $(this).attr('data-valid-title') + '은(는) 필수 입력(선택) 항목 입니다.' );
			$(this).focus();
			return false;
		}
	}
	else {
		// input type : radio
		if ($(this).attr('type') === 'radio') {
			if( $('input:radio[name='+this.name+']:checked').length < 1) {
				alert( $(this).attr('data-valid-title') + '은(는) 필수 입력(선택) 항목 입니다.' );
				$(this).focus();
				return false;
			}
		}
		else {
			// null check
			if( $(this).val() == null ) {
				alert( $(this).attr('data-valid-title') + '은(는) 필수 입력(선택) 항목 입니다.' );
				$(this).focus();
				return false;
			}
			
			// space check
			if ( $.trim($(this).val()) == '' ) {
				alert( $(this).attr('data-valid-title') + '은(는) 필수 입력(선택) 항목 입니다.' );
				$(this).focus();
				return false;
			}
		}
	}
	
	// length zero check
	if ( $(this).getObjLength() == 0 ) {
		alert( $(this).attr('data-valid-title') + '은(는) 필수 입력(선택) 항목 입니다.' );
		$(this).focus();
		return false;
	}
	
	return true;
};

/**
 * ==================================================================================
 * 데이트 포멧 확인
 * ----------------------------------------------------------------------------------
 * 1. contains hyphen
 * 2. remove hyphen and check data length(8)
 * 3. input number only check
 * ==================================================================================
 */
$.fn.isFmtDate = function() {
	
	// contains hyphen
	if( $(this).val().indexOf('-') < 0 ) {
		alert( $(this).attr('data-valid-title') + '의 날짜 형식이 잘못되었습니다.\n\n(ex:1985-01-01)' );
		$(this).focus();
		return false;
	}
	
	// remove hyphen and check data length(8)
	var value = ($(this).val()).replace(/\-/g,"");
	if(value.length > 8) {
		alert( $(this).attr('data-valid-title') + '의 날짜 형식이 잘못되었습니다.\n\n(ex:1985-01-01)' );
		$(this).focus();
		return false;
	}
	
	// input number only check
	var regexp = /[^0-9]/gi;
    if ( regexp.test( value ) == true ) {
    	alert( $(this).attr('data-valid-title') + '은(는) 문자를 입력하실 수 없습니다.' );
    	$(this).focus();
    	return false;
    }
	
	return true;
};


/**
 * ==================================================================================
 * 시작일과 종료일 비교 검사
 * ----------------------------------------------------------------------------------
 * 1. target object date format check
 * 2. from_date over to to_date check
 * ==================================================================================
 */
$.fn.isOverDate = function() {
	
	var from_date = ($(this).val()).replace(/\-/g,"");
	var compare_name = $(this).attr('data-valid-date-over');
	var to_obj = $('input[name='+compare_name+']');
	
	// target object date format check
	if( to_obj.isFmtDate() != true) {
		return false;
	}
	
	var to_date = (to_obj.val()).replace(/\-/g,"");
	
	// from_date over to to_date check
	if(parseInt(from_date) > parseInt(to_date)) {
		alert( $(this).attr('data-valid-title') + '은(는) ' + to_obj.attr('data-valid-title') + ' 보다 클 수 없습니다.' );
    	$(this).focus();
    	return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 시작일과 종료일 기간 검사
 * ----------------------------------------------------------------------------------
 * 1. from_date over to to_date check
 * ==================================================================================
 */
$.fn.isTermDate = function() {
	
	var term = $(this).attr('data-valid-date-term');
	var term_date = cf_termDate(parseInt(term), $(this).val());
	
	var compare_name = $(this).attr('data-valid-date-over');
	var compare_date = $('input[name='+compare_name+']').val();
	
	var from_date = (term_date).replace(/\-/g,"");
	var to_date = (compare_date).replace(/\-/g,"");
	
	if(parseInt(to_date) > parseInt(from_date)) {
		alert( '최대 기한 ' + term + '일을 넘길 수 없습니다.' );
    	$(this).focus();
    	return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 최소 입력 길이 제한
 * ----------------------------------------------------------------------------------
 * 1. min-length check
 * ==================================================================================
 */
$.fn.minLength = function() {	
	
	var value = $.trim($(this).val());
	var min_len = $(this).attr('data-valid-min');
	
	// min-length check
	if( value.length < parseInt(min_len) ) {
		alert( $(this).attr('data-valid-title') + '은(는) 최소' + min_len + '글자 이상 입니다.' );
		$(this).focus();
		return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 최대 입력 길이 제한
 * ----------------------------------------------------------------------------------
 * 1. max-length check
 * ==================================================================================
 */
$.fn.maxLength = function() {
	
	var value = $.trim($(this).val());
	var max_len = $(this).attr('data-valid-max');
	var char_cnt = 0;
	var str;
	
	for(var i = 0; i < value.length; i++) {
		str = value.charAt(i);
		if( escape(str).length > 4 ) {
			char_cnt += 3;
		}
		else {
			char_cnt++;
		}
	}
	
	// max-length check
	if( parseInt(char_cnt) > parseInt(max_len) ) {
		alert( $(this).attr('data-valid-title') + '은(는) 최대' + max_len + 'byte 입니다.' );
		$(this).focus();
		return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 크로스 사이트 스크립팅 체크
 * ----------------------------------------------------------------------------------
 * 1. cross site scripting data check
 * ==================================================================================
 */
$.fn.xss = function() {
	
	// cross site scripting data check
	if( $(this).val().toLowerCase().indexOf("script") != -1 ) {
		alert( $(this).attr('data-valid-title') + '에 XSS 위반 문자는 사용하실 수 없습니다.' );
		$(this).focus();
		return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 숫자 최소값 크기 제한
 * ----------------------------------------------------------------------------------
 * 1. min-num check
 * ==================================================================================
 */
$.fn.minNum = function() {
	
	var value = $.trim($(this).val());
	var min_num = $(this).attr('data-valid-minnum');
	
	// max-length check
	if( parseInt(value) < parseInt(min_num) ) {
		alert( $(this).attr('data-valid-title') + '의 최소값은' + min_num + '입니다.' );
		$(this).focus();
		return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 숫자 최대값 크기 제한
 * ----------------------------------------------------------------------------------
 * 1. max-num check
 * ==================================================================================
 */
$.fn.maxNum = function() {
	
	var value = $.trim($(this).val());
	var max_num = $(this).attr('data-valid-maxnum');
	
	// max-length check
	if( parseInt(value) > parseInt(max_num) ) {
		alert( $(this).attr('data-valid-title') + '의 최대값은' + max_num + '입니다.' );
		$(this).focus();
		return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 이메일 패턴 체크
 * ----------------------------------------------------------------------------------
 * 1. mail form check
 * 2. space check
 * ==================================================================================
 */
$.fn.fmtEmail = function() {
	
	// mail form check
	var regexp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if ( regexp.test($(this).val()) != true ){
		alert( '이메일 형식이 올바르지 않습니다.' );
		$(this).focus();
		return false;
	}
	
	// space check
	if( $(this).val().indexOf(' ') > -1 ) {
		alert( '이메일에 공백은 사용하실수 없습니다.' );
		$(this).focus();
		return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 숫자만 입력 가능
 * ----------------------------------------------------------------------------------
 * 1. only number data check
 * ==================================================================================
 */
$.fn.fmtNumber = function() {
	
	var regexp = /[^0-9]/gi;
	
    if ( regexp.test( $(this).unComma() ) == true ) {
    	alert( $(this).attr('data-valid-title') + '숫자만 입력 가능 합니다.' );
    	$(this).focus();
    	return false;
    }

	return true;
};


/**
 * ==================================================================================
 * 기본 패턴 체크
 * ----------------------------------------------------------------------------------
 * 1. english and number use only check
 * 2. space check
 * ==================================================================================
 */
$.fn.alphanumeric = function() {
	
	var regexp = /^[A-Za-z0-9]+$/;
	
	// english and number use only check
	if( regexp.test($(this).val()) != true ) {
		alert( $(this).attr('data-valid-title') + '은(는) 영문자와 숫자만 가능합니다.' );
		$(this).focus();
		return false;
	}
	
	// space check
	if( $(this).val().indexOf(' ') > -1 ) {
		alert(  $(this).attr('data-valid-title') + ' 공백은 사용하실수 없습니다.' );
		$(this).focus();
		return false;
	}
	
	return true;
};


/**
 * ==================================================================================
 * 특수문자 사용 금지
 * ----------------------------------------------------------------------------------
 * 1. special symbol check
 * 2. space check
 * ==================================================================================
 */
$.fn.specialSymbol = function() {
	
	var regexp = /[`~!@#$^&*|\\\'\";:\/]/gi;
	
	if( regexp.test( $(this).val()) == true ){
		alert( $(this).attr('data-valid-title') + '은(는) 특수문자를 사용하실 수 없습니다.' );
		$(this).focus();
		return false;
	}

	return true;
};


/**
 * ==================================================================================
 * 폼 벨리데이션 체크
 * ----------------------------------------------------------------------------------
 * 
 * 사용법
 * 	- data-valid-use='true' 		: 벨리데이션 사용 유무 선언
 * 									  -> 하위의 벨리데이션을 사용하려면 필수 선언
 * 
 * 	- data-valid-min='4' 			: 최소 입력 사용
 * 									  -> ex: 단어 수 4이상 입력
 * 
 * 	- data-valid-max='4'			: 최대 입력 사용
 * 									  -> ex: 단어 수 4미만 입력
 * 
 * 	- data-valid-minnum='4'			: 숫자 최소값 체크
 * 									  -> ex: 숫자 3 이상 입력
 * 
 *  - data-valid-maxnum='4'			: 숫자 최대값 체크
 * 									  -> ex: 숫자 4 이하 입력
 * 
 * 	- data-valid-equals='target'	: 타겟 네임과 입력 단어 동일 확인
 * 
 * 	- data-valid-num='true'			: 숫자만 입력 가능
 * 
 * 	- data-valid-alphanumeric='true': 영문+숫자만 입력 가능 확인
 * 
 * 	- data-valid-symbol='true'		: 특수문자 사용 불가 확인
 * 
 * 	- data-valid-date='true'		: 데이터 형식이 날짜 형식인지 확인
 * 									  -> yyyy-MM-dd
 * 
 * 	- data-valid-date-over='target'	: 시작일 종료일보다 클 경우 체크
 * 									  -> from date에 선언
 * 
 * 	- data-valid-date-term='60'		: 타겟 네임과 날짜 입력 기간 오류 확인
 * 									  -> data-valid-date-over 필수
 * 
 *  - data-valid-confirm='true'		: 
 *  
 *  - data-valid-equals='name'		: 재확인 비교할 input 영역 설정
 *  								  -> 비밀번호 변경 input tag의 name값 
 * ----------------------------------------------------------------------------------
 * 
 * case(input) 
 * 		- case(type : radio)
 * 			1. empty value check
 * 
 * 		- case(type : checkbox)
 * 			1. empty value check
 * 
 * 		- case(type : email)
 * 			1. empty value check
 * 			2. mail pattern check
 * 			3. min-length check
 * 			4. max-length check
 * 			5. cross site scripting data check
 * 
 * 		- case(type : other)
 * 			1. empty value check
 * 			2. min-length check
 * 			3. max-length check
 * 			4. only number data check
 * 			5. special symbol check
 * 			6. cross site scripting data check
 *  
 * case(select) 
 * 			1. empty value check
 * 
 * case(textarea)  
 * 			1. empty value check
 * 			2. min-length check
 * 			3. max-length check
 * 			4. special symbol check
 * 			5. cross site scripting data check
 * ==================================================================================
 */
$.fn.formValid = function() {

	var $frm = $(this);
	var rtn_flag = true;
		
	$frm.find('input, select, textarea').each(function(){
		
		//if($(this).attr('data-valid-use') !== undefined && $(this).attr('data-valid-use') == 'true') {
			
			if ($(this).is('input')) {
				
				var type = $(this).attr('type');
				
				// input type : radio
				if (type == 'radio') {
					if($(this).attr('data-valid-use') !== undefined && $(this).attr('data-valid-use') == 'true') {
						if( $('input:radio[name='+this.name+']:checked').length == 0 ) {
							rtn_flag = false;
							alert( $(this).attr('data-valid-title') + '은(는) 필수 선택 입니다.' );
							$(this).eq(0).focus();
							return false;
						}
					}
				}
				// input type : checkbox
				else if (type == 'checkbox') {
					if($(this).attr('data-valid-use') !== undefined && $(this).attr('data-valid-use') == 'true') {
						if( $(this).is(':checked') != true ) {
							rtn_flag = false;
							alert( $(this).attr('data-valid-title') + '은(는) 필수 선택 입니다.' );
							$(this).focus();
							return false;
						}
					}
					
					if($(this).attr('data-valid-chkone') !== undefined) {
						
						var chk_name = $(this).attr('data-valid-chkone');
						var chk_len = $frm.find('input[data-valid-chkone='+chk_name+']:checked').length;
						if(chk_len < 1) {
							rtn_flag = false;
							alert( $(this).attr('data-valid-title') + '은(는) 1개이상 필수 선택 입니다.' );
							$(this).focus();
							return false;
						}
					}
					
				}
				else if (type == 'email') {
					if($(this).attr('data-valid-use') !== undefined && $(this).attr('data-valid-use') == 'true') {
						// empty value check
						if( $(this).isEmpty() != true ) {
							rtn_flag = false;
							return false;
						}
						
						// mail pattern check
						if( $(this).fmtEmail() != true ) {
							rtn_flag = false;
							return false;
						}
						
						// cross site scripting data check
						if( $(this).xss() != true ) {
							rtn_flag = false;
							return false;
						}
					}
									
					// min-length check
					if( $(this).attr('data-valid-min') !== undefined ) {
						if( $(this).minLength() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					// max-length check
					if( $(this).attr('data-valid-max') !== undefined ) {
						if( $(this).maxLength() != true ) {
							rtn_flag = false;
							return false;
						}
					}
				}
				// input type : other
				else {
					
					if($(this).attr('data-valid-use') !== undefined && $(this).attr('data-valid-use') == 'true') {
						// empty value check
						if( $(this).isEmpty() != true ) {
							rtn_flag = false;
							return false; 
						}
					}
					
					// min-length check
					if( $(this).attr('data-valid-min') !== undefined ) {
						if( $(this).minLength() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					// max-length check
					if( $(this).attr('data-valid-max') !== undefined ) {
						if( $(this).maxLength() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					// min num check
					if( $(this).attr('data-valid-minnum') !== undefined ) {
						if( $(this).fmtNumber() != true ) {
							rtn_flag = false;
							return false;
						}
						
						if( $(this).minNum() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					// max num check
					if( $(this).attr('data-valid-maxnum') !== undefined ) {
						if( $(this).fmtNumber() != true ) {
							rtn_flag = false;
							return false;
						}
						
						if( $(this).maxNum() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					
					// only number data check
					if( $(this).attr('data-valid-num') !== undefined && $(this).attr('data-valid-num') == 'true') {
						if( $(this).fmtNumber() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					// default patten check
					if( $(this).attr('data-valid-alphanumeric') !== undefined && $(this).attr('data-valid-alphanumeric') == 'true') {
						if( $(this).alphanumeric() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					// special symbol check
					if( $(this).attr('data-valid-symbol') !== undefined && $(this).attr('data-valid-symbol') == 'true') {
						if( $(this).specialSymbol() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					// cross site scripting data check
					if( $(this).xss() != true ) {
						rtn_flag = false;
						return false;
					}
					
					// date format check
					if( $(this).attr('data-valid-date') !== undefined && $(this).attr('data-valid-date') == 'true') {
						if( $(this).isFmtDate() != true ) {
							rtn_flag = false;
							return false;
						}
					}
					
					// date type and date over check
					if( $(this).attr('data-valid-date-over') !== undefined ) {
						if( $(this).isFmtDate() != true ) {
							rtn_flag = false;
							return false;
						}
						
						if( $(this).isOverDate() != true ) {
							rtn_flag = false;
							return false;
						}
					}
										
					// date type and date term check (must data-valid-date-over used!)
					if( $(this).attr('data-valid-date-term') !== undefined ) {
						if( $(this).isTermDate() != true ) {
							rtn_flag = false;
							return false;
						}
					}
				}
			}
			else if ($(this).is('select')) {
				if($(this).attr('data-valid-use') !== undefined && $(this).attr('data-valid-use') == 'true') {
					// empty value check
					if( $(this).isEmpty() != true ) {
						rtn_flag = false;
						return false;
					}
				}
				
			}
			else if ($(this).is('textarea')) {
				if($(this).attr('data-valid-use') !== undefined && $(this).attr('data-valid-use') == 'true') {
					// empty value check
					if( $(this).isEmpty() != true ) {
						rtn_flag = false;
						return false;
					}
				}
				
				// min-length check
				if( $(this).attr('data-valid-min') !== undefined ) {
					if( $(this).minLength() != true ) {
						rtn_flag = false;
						return false;
					}
				}
				
				// max-length check
				if( $(this).attr('data-valid-max') !== undefined ) {
					if( $(this).maxLength() != true ) {
						rtn_flag = false;
						return false;
					}
				}
				
				// special symbol check
				if( $(this).attr('data-valid-symbol') !== undefined && $(this).attr('data-valid-symbol') == 'true') {
					if( $(this).specialSymbol() != true ) {
						rtn_flag = false;
						return false;
					}
				}
				
				// cross site scripting data check
				if( $(this).xss() != true ) {
					rtn_flag = false;
					return false;
				}
			}
		//}
	});
	return rtn_flag;
};


/**
 * ==================================================================================
 * 테이블 데이터 ROW-NULL 체크
 * ----------------------------------------------------------------------------------
 * 1. table tr-tag row null check
 * ==================================================================================
 */
$.fn.tableRowValid = function() {
	if( $(this).find('tr').length == 0 ) {
		alert( $(this).attr('data-valid-title') + '은(는) 1개 이상 데이터를 등록하셔야 합니다.' );
		$(this).focus();
		return false;
	}
	return true;
};