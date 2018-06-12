<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

/* ============================================================================================
/* 공통코드 : 공통코드 조회 스크립트
/* --------------------------------------------------------------------------------------------
/* 공통코드 조회 스크립트
/* extendData : data에 추가해야할 파라미터
/* extendData 필수값 
/* 	target : 데이터가 입력되어야 하는 대상 태그(codeId를 넘길경우 빈값가능)
/* 	cd_divn_id : 공통코드값
/* 	codeId: codeName 리턴을 원할경우에만 codeId를 입력
/* 	fnSuccess : 기존 success function 이 아닌 사용자 임의로 만든 success function을 원할경우 입력
/* ============================================================================================ */
function f_ajaxCommonCode(extendData) {
	if(extendData["cd_divn_id"].trim() == ""){
		alert("공통코드를 입력해주세요");
		return false;
	}
	
	var codeName = "";
	var data = {};
	
	$.extend(data, extendData);

	$.ajax({
		url: api_url + "/bo/common/code/npmt_bo_00006",
		type: "GET",
		async: false,
		data: encodeURI('params='+JSON.stringify(data)),
		success: function (resultData) {
			if(data["codeId"]){
				$.each(resultData["data"]["cd_list"], function(i, items) {
					if(items["mst_cd"] == data["codeId"]){
						codeName = items["mst_cd_nm"];
						return true;
					}
				});
			}
			else {
				if (data["fnSuccess"] == undefined || data["fnSuccess"] == "") {
					var options = "";
					$.each(resultData.data.cd_list, function(i, item) {
						options += "<option value='"+item.mst_cd+"'>"+item.mst_cd_nm+"</option>";
					});
					
					$(data["target"]).append(options);
				}
				else {
					data["fnSuccess"](resultData);
				}
			}
		},
		error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert("code:"+serverObj.code+"\n"+"message:"+cf_msg(serverObj.message)+"\n");
	    	return;
	    }
	});
	
	return codeName;
}

$.getSessionData = function() {
	return {
		access_token: '${sessionScope.sessionEmpToken}',
		empno		: '${sessionScope.sessionEmpno}',
		str_cd		: '${sessionScope.sessionStrCd}',
		hq_base_yn	: '${sessionScope.sessionHqBaseYn}'
	};
};

</script>