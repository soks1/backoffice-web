<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body">
						<form class="form-horizontal" id="frmUser">
							<input type="hidden" id="id" name="id" value="<%=request.getParameter("id")%>" />
							
							<table class="table table-bordered">
								<colgroup>
									<col width="13%;" />
									<col width="auto" />
									<col width="17%" />
									<col width="17%" />
									<col width="17%" />
									<col width="17%" />
								</colgroup>
								<thead>
									<tr>
										<th class="ta-c">ID</th>
										<th class="ta-c">사용자명</th>
										<th class="ta-c">상태</th>
										<th class="ta-c">현재 비밀번호</th>
										<th class="ta-c">신규 비밀번호</th>
										<th class="ta-c">신규 비밀번호 확인</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="ta-c" style="vertical-align:middle;"><span id="view_id"></span></td>
										<td>
											<input class="form-control" type="text" name="nm" id="nm" data-valid-use='true' data-valid-symbol='true' data-valid-max="30" data-valid-title='사용자명'>
										</td>
										<td>
											<select class="form-control" id="use_yn" name="use_yn">
												<option value="Y">사용가능</option>
												<option value="N">사용중지</option>
											</select>
										</td>
										<td>
											<input class="form-control" type="password" name="pwd" id="pwd" data-valid-use='true' data-valid-max="64" data-valid-title='현재 비밀번호'>
										</td>
										<td>
											<input class="form-control" type="password" name="new_pwd" id="new_pwd" value=""/>
										</td>
										<td>
											<input class="form-control" type="password" name="conf_pwd" id="conf_pwd" value=""/>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
						
						<div class="widget-body no-padding">
								<div class="widget-body-toolbar">
									<div class="row">
										<div class="col-sm-12 text-right">
											<a href="javascript:checkPwd();" class="btn btn-warning">사용자 정보 수정</a>
										</div>
									</div>
								</div>
						</div>
					
					</div>
				</div>
			</div>
		</article>
	</div>
</section>

<script type="text/javascript">

function f_getUserInfo() {
	var id = $("#frmUser").find('input[name=id]').val();
	
	$.ajax({
	    url: api_url+"/bo/merchant/npmt_bo_02101", //this is the submit URL
	    type: "GET", // GET or POST
	    async: true,
	    cache: true,
	    datatype: 'json',
	    data: "params="+encodeURI(JSON.stringify({"id" : id})),
	    beforeSend : function() {},
	    success: function(obj){
	    	var userInfo = obj.data.user_info;
	    	
	    	$('#view_id').html(userInfo.id);
	    	$('#nm').val(userInfo.nm);
	    	$('#use_yn').val(userInfo.use_yn);
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
}

function f_updateMchtUserInfo() {
	// Parameter Validation Check
	if(!$("#frmUser").formValid()) {
		return;
	}
	
	var newPwd  = $('#new_pwd').val();
	var confPwd = $('#conf_pwd').val();

	if(newPwd != '' && confPwd != '') {
		if(!f_passwordCheck('신규 비밀번호', newPwd)) {
	   		return;
	   	}
	   	
	   	if(!f_passwordCheck('비밀번호 확인', confPwd)) {
	   		return;
	   	}
	}
	
	var params = $('#frmUser').serializeFormObject();
	params['new_pwd']  = newPwd;
	params['conf_pwd'] = confPwd;
	
	$.ajax({
	    url: api_url+'/bo/merchant/npmt_bo_02102',
	    type: 'POST',
	    async: true,
	    cache: false,
	    datatype: 'json',
	    contentType: 'application/json;charset=utf-8',
	    data: JSON.stringify(params),
	    success: function(resultData){
	    	alert("사용자 정보 수정이 정상적으로 처리 되었습니다.");
	    	
	    	getUserInfoList();
	    	
	    	$("#mcht_user_ed").empty();
	    	$("#mcht_user_ed").dialog("close");
	    },
	    error: function(resultData) {
	    	var serverObj = resultData["responseJSON"];
	    	alert('code:'+serverObj["code"]+'\n'+'message:'+cf_msg(serverObj["message"])+'\n');
	    	return;
	    }
	});
}

function checkPwd() {
	var id  = $("#frmUser").find('input[name=id]').val();
	var pwd = $("#frmUser").find('input[name=pwd]').val();
	
	var params = {
			"id"  : id,
			"pwd" : pwd
		};
	
	$.ajax({
	    url: api_url+'/bo/merchant/npmt_bo_02103',
	    type: 'POST',
	    async: true,
	    cache: false,
	    datatype: 'json',
	    contentType: 'application/json;charset=utf-8',
	    data: JSON.stringify(params),
	    success: function(resultData){
	    	f_updateMchtUserInfo();
	    },
	    error: function(resultData) {
	    	console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	    	console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	    	var serverObj = resultData["responseJSON"];
	    	alert('code:'+serverObj["code"]+'\n'+'message:'+cf_msg(serverObj["message"])+'\n');
	    	return;
	    }
	});
}

pageSetUp();

f_getUserInfo();

</script>