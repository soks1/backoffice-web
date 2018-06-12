/* ==================================================================================
 * Copyright © 2014-2018 PENTAWORKS All rights reserved.
 * ================================================================================== */

// =============================================================================== //
// ----------------------------- common script start ----------------------------- //
// =============================================================================== //

/**
 * ==================================================================================
 * 날자 형식 변경
 * ----------------------------------------------------------------------------------
 * 1. yyyyMMdd - > yyyyMMdd
 * 2. yyyy?MM?dd - > yyyyMMdd
 * ==================================================================================
 */
$.fn.cvtDateDefault = function() {

	var value = $(this).val();
	
	if(value.length > 8) {
		
		var yyyy = value.substr(0,4);
		var mm = value.substr(5,2);
		var dd = value.substr(8,2);
		
		if(parseInt(mm) < 10) {
			mm = '0'+parseInt(mm);
		}
		if(parseInt(dd) < 10) {
			dd = '0'+parseInt(dd);
		}

		return yyyy + mm + dd;
	} 
	else {
		return value;
	}
};


/**
 * ==================================================================================
 * 날자 형식 변경
 * ----------------------------------------------------------------------------------
 * 1. yyyyMMdd - > yyyy-MM-dd
 * ==================================================================================
 */
$.fn.cvtDateHyphen = function() {

	var value = $(this).cvtDateDefault();
	var yyyy = value.substr(0,4);
	var mm = value.substr(4,2);
	var dd = value.substr(6,2);
	
	return yyyy + "-" + mm + "-" + dd;
	
};

/**
 * ==================================================================================
 * 날자 형식 변경
 * ----------------------------------------------------------------------------------
 * 1. yyyyMMddhh24 - > yyyy-MM-dd hh24
 * ==================================================================================
 */
$.fn.cvtDateHyphenHour = function() {
	var value = $(this).val();
	var yyyy = value.substr(0,4);
	var mm = value.substr(4,2);
	var dd = value.substr(6,2);
	var hh = value.substr(8,2);
	return yyyy + "-" + mm + "-" + dd + " " + hh;
	
};


/**
 * ==================================================================================
 * 날자 형식 변경
 * ----------------------------------------------------------------------------------
 * 1. yyyyMMdd - > yyyy.MM.dd
 * ==================================================================================
 */
$.fn.cvtDateDot = function() {

	var value = $(this).cvtDateDefault();
	var yyyy = value.substr(0,4);
	var mm = value.substr(4,2);
	var dd = value.substr(6,2);
	
	return yyyy + "." + mm + "." + dd;
	
};


/**
 * ==================================================================================
 * 날자 형식 변경
 * ----------------------------------------------------------------------------------
 * 1. yyyyMMdd - > yyyy/MM/dd
 * ==================================================================================
 */
$.fn.cvtDateSlash = function() {

	var value = $(this).cvtDateDefault();
	var yyyy = value.substr(0,4);
	var mm = value.substr(4,2);
	var dd = value.substr(6,2);
	
	return yyyy + "/" + mm + "/" + dd;
	
};


/**
 * ==================================================================================
 * 날자 형식 변경
 * ----------------------------------------------------------------------------------
 * 1. yyyyMMdd - > yyyyMMdd
 * 2. yyyyMMdd - > yyyy/MM/dd
 * 3. yyyyMMdd - > yyyy-MM-dd
 * 4. yyyyMMdd - > yyyy.MM.dd
 * ==================================================================================
 */
$.fn.cvtDateFormat = function() {

	var format = $(this).attr('data-date-format');
	var cvt_date_value;
	if( format == 'yyyyMMdd' ) {
		cvt_date_value = $(this).cvtDateDefault();
	}
	else if( format == 'yyyy/MM/dd' ) {
		cvt_date_value = $(this).cvtDateSlash();
	}
	else if( format == 'yyyy-MM-dd' ) {
		cvt_date_value = $(this).cvtDateHyphen();
	}
	else if( format == 'yyyy.MM.dd' ) {
		cvt_date_value = $(this).cvtDateDot();
	}
	else if( format == 'yyyy-MM-dd HH') {
		cvt_date_value = $(this).cvtDateHyphenHour();
	}
	else {
		cvt_date_value = this.value;
	}
	
	return cvt_date_value;
	
};

/**
 * ==================================================================================
 * 오브젝트 길이 반환
 * ----------------------------------------------------------------------------------
 * 앞뒤 공백 제거 후 길이 반환
 * ==================================================================================
 */
$.fn.getObjLength = function() {
	if($(this).is('select')) {
		return $.trim($(this).children("option:selected").val()).length;
	}
	else {
		if ($(this).attr('type') == 'radio') {
			return $.trim($('input:radio[name='+this.name+']:checked').val()).length;
		} 
		else {
			return $.trim($(this).val()).length;
		}
	}
};

/**
 * ==================================================================================
 * 숫자 콤마 삭제
 * ----------------------------------------------------------------------------------
 * 1,234,567 -> 1234567
 * ==================================================================================
 */
$.fn.unComma = function() {
	return ( ($(this).val()).replace(/\,/g,"") );
};


/**
 * ==================================================================================
 * 셀렉트 박스
 * ----------------------------------------------------------------------------------
 * 모든 데이터 리셋 후 초기 데이터 등록
 * ==================================================================================
 */
$.fn.resetSelectBox = function(type) {
	$(this).empty();
	var option = $('<option>');
	if(type == 'TGRP' || type == 'MGRP') {
		option.attr('value','').text('선택');
	}
	else {
		option.attr('value','').text('전체');
	}
	$(this).append(option);
};






// =============================================================================== //
// ---------------------------- common function start ---------------------------- //
// =============================================================================== //

/**
 * ==================================================================================
 * 숫자 콤마 적용 (정적)
 * ----------------------------------------------------------------------------------
 * 데이터의 값을 x,xxx,xxx,xxx 형태로 변경 시킨다.
 * ==================================================================================
 */
function cf_setComma(val) {
	
	if(typeof val == null || val == null || val == 'null' || val == '' ) {
		return '0';
	}
	
	var regexp = /(^[+-]?\d+)(\d{3})/;
	
	val += '';
	while (regexp.test(val)) {
		val = val.replace(regexp, '$1' + ',' + '$2');
	}
	
    return val;
}

/**
 * ==================================================================================
 * 숫자 콤마 적용 (동적:실시간용)
 * ----------------------------------------------------------------------------------
 * 데이터의 값을 x,xxx,xxx,xxx 형태로 변경 시킨다.
 * ==================================================================================
 */
function cf_fmtComma(obj) {
  
	var formnum = $(obj).val();
	var num_length = formnum.length;
	var FirstNum = formnum.substr(0,1);
	var FirstNum2 = formnum.substr(1,num_length);
   
	if(FirstNum == "0"){
		alert("입력숫자는 0 으로 시작할 수 없습니다.");
		formnum = FirstNum2;
		return FirstNum2;
	}

	regexp = /^\$|,/g; 
	formnum = formnum.replace(regexp, ""); 
    
	var fieldnum = '' + formnum;    

	if (isNaN(fieldnum)) {
		alert("숫자만 입력하실 수 있습니다.");        
        $(obj).val("");
        $(obj).focus();
        return "";
	}
    else {
    	var comma = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
        var data = fieldnum.split('.');
        data[0] += '.';
    	do {
    		data[0] = data[0].replace(comma, '$1,$2');
    	} while (comma.test(data[0]));

    	if (data.length > 1) {
    		return data.join('');
    	}
        else {
        	return data[0].split('.')[0];
        }
    }
}

/**
 * ==================================================================================
 * 현재 날짜 정보
 * ----------------------------------------------------------------------------------
 * 현재 날짜를 yyyy-MM-dd 형태로 반환
 * ==================================================================================
 */
function cf_toDate() {
	var to = new Date();
	var yyyy = to.getFullYear();
	var mm = to.getMonth()+1;
	var dd = to.getDate();
		
	if(parseInt(mm) < 10) {
		mm = '0'+parseInt(mm);
	}
	if(parseInt(dd) < 10) {
		dd = '0'+parseInt(dd);
	}
	return yyyy + "-" + mm + "-" + dd;
}


/**
 * ==================================================================================
 * 날짜 기간 정보
 * ----------------------------------------------------------------------------------
 *  - term : 날짜 사이 기간 정보
 *  - date : 기준 날짜 정보 (입력값이 없으면 현재 날짜 기준으로 데이터 생성)
 * ==================================================================================
 */
function cf_termDate(term, date) {
	
	var base_date;
	
	if(typeof date == 'undefined') {
		base_date = cf_toDate();
	} else {
		base_date = date;
	}
	
	var date_array = base_date.split('-');
	
	var rtn_date = new Date(date_array[0], (date_array[1]-1), date_array[2]);
	
	rtn_date.setDate(rtn_date.getDate() + term);
	
	var yyyy = rtn_date.getFullYear();
	var mm = rtn_date.getMonth()+1;
	var dd = rtn_date.getDate();
	
	if(parseInt(mm) < 10) {
		mm = '0'+parseInt(mm);
	}
	if(parseInt(dd) < 10) {
		dd = '0'+parseInt(dd);
	}
	
	return yyyy + "-" + mm + "-" + dd;
}


/**
 * ==================================================================================
 * 날짜 포멧 변경
 * ----------------------------------------------------------------------------------
 * date -> 스트링 형태 yyyyMMdd 또는 yyyy?MM?dd
 * 사용 가능 format
 * 	- yyyyMMdd
 * 	- yyyy/MM/dd
 * 	- yyyy-MM-dd
 * 	- yyyy.MM.dd
 * ==================================================================================
 */
function cf_cvtDateFormat(date, format) {
	if(date.length > 10) {
		date = date.substring(0, 10);
	}
	var tmp_obj = $('<input>');
	tmp_obj.attr('type','hidden');
	tmp_obj.attr('name','tmp');
	tmp_obj.attr('data-date-format',format);
	tmp_obj.val(date);
	
	var rtn_date = tmp_obj.cvtDateFormat();
	
	tmp_obj.remove();
	
	return rtn_date;
}



/**
 * Null 체크 함수
 * @param val
 * @returns {Boolean}
 */
function cf_isNull(val) {
	
	if( val == null || val == '' || $.trim(val) == '' ) {
		return false;
	}
	else {
		return true;
	}
}


/**
 * 바이트 환산
 * @param value
 * @returns {Number}
 */
function cf_getBytes(value) {
	var _bytes = 0;
	var str;
	
	for(var i = 0; i < value.length; i++) {
		str = value.charAt(i);
		// 한글 3바이트 계산
		if( escape(str).length > 4 ) {
			_bytes += 3;
		}
		// 그 외 1바이트 계산
		else {
			_bytes++;
		}
	}
	
	return _bytes;
}


/**
 * 소수점 2번째 자리 반올림
 * @param num
 * @returns
 */
function cf_mathRound(num) {
	/*if(parseInt(num) > 0) {
		var n = new Number(num);
		return n.toFixed(1);
	}
	else {
		return num;
	}*/
	var n = new Number(num);
	return n.toFixed(1);
}


function cf_msg(str) {
	var rtnStr = str == undefined ? "" : str.replace(/\\n/g,'\n');
	return rtnStr;
}


/**
 * 데이터 ** 표시
 * @param val
 * 		스트링 데이터
 * @param len
 * 		** 표시 수(끝자리 부터 시작 됨)
 */
function cf_masking(val, len) {
	
	var valIdx = "";
	var mailUrl = "";
	var mailFlag = false;
	var str_length = "";
	var rtn = '';
	
	if(val.indexOf('@') != -1) {
		valIdx = val.indexOf('@');	
		mailUrl = val.substring(valIdx);	
		val = val.substring(0, valIdx);
		mailFlag = true;
	}
	
	str_length = val.length;

	if(str_length < len) {
		alert('마스킹 길이 초과');
		return;
	}
	
	for(var i = 0; i < (str_length-len); i++) {
			rtn += val.charAt(i);
	}
	
	// * 처리
	for(var j = 0; j < len; j++) {
		rtn += '*';
	}
	
	// * 처리 된 값에 @mail.com 붙이기.
	if(mailFlag) {
		rtn = rtn + mailUrl;
	}
	
	return rtn;
}
/**
 * ==================================================================================
 * 숫자만 입력 가능
 * ----------------------------------------------------------------------------------
 * 숫자만 입력 하도록 한다.
 * ==================================================================================
 */
function cf_numChk(obj) {
  
	var formnum = $(obj).val();

	regexp = /^\$|,/g; 
	formnum = formnum.replace(regexp, ""); 
    
	var fieldnum = '' + formnum;    

	if (isNaN(fieldnum)) {
		alert("숫자만 입력하실 수 있습니다.");        
        $(obj).val("");
        $(obj).focus();
        return "";
	}
}


/**
 * ==================================================================================
 * 날짜 시간 표시
 * ==================================================================================
 */
function cf_cvtTimeFormat(date) {
	if(date.length == 8){
		date = date.substr(0,4) + "-" + date.substr(4,2) + "-" + date.substr(6,2);
	}else if(date.length == 10){
		date = date.substr(0,4) + "-" + date.substr(4,2) + "-" + date.substr(6,2) + " " + date.substr(8,2) + "시";
	}else{
		date = "";
	}
	return date;
}


/**
 * ==================================================================================
 * 날짜 포멧 변경
 * ----------------------------------------------------------------------------------
 * date -> 스트링 형태 yyyyMMdd 또는 yyyy?MM?dd
 * 사용 가능 format
 * 	- yyyyMMdd
 * 	- yyyy/MM/dd
 * 	- yyyy-MM-dd
 * 	- yyyy.MM.dd
 * ==================================================================================
 */
function cf_cvtDateForm(date, format) {
	if(date.length > 8) {
		date = date.substring(0, 8);
	}
	var tmp_obj = $('<input>');
	tmp_obj.attr('type','hidden');
	tmp_obj.attr('name','tmp');
	tmp_obj.attr('data-date-format',format);
	tmp_obj.val(date);
	
	var rtn_date = tmp_obj.cvtDateFormat();
	tmp_obj.remove();
	
	return rtn_date;
}