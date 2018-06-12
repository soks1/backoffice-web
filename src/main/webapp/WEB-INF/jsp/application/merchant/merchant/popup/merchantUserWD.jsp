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
							<input type="hidden" id="mcht_id" name="mcht_id" value="" />
							
							<table class="table table-bordered">
								<colgroup>
									<col width="20%;" />
									<col width="auto" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th class="ta-c">ID</th>
										<th class="ta-c">사용자명</th>
										<th class="ta-c">상태</th>
										<th class="ta-c">비밀번호</th>
										<th class="ta-c">비밀번호 확인</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<input class="form-control" type="text" name="id" id="id" data-valid-use='true' data-valid-symbol='true' data-valid-min="8" data-valid-max="20" data-valid-title='ID'>
										</td>
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
											<input class="form-control" type="password" name="pwd" id="pwd" data-valid-use='true' data-valid-max="20" data-valid-title='비밀번호'>
										</td>
										<td>
											<input class="form-control" type="password" name="conf_pwd" id="conf_pwd" data-valid-use='true' data-valid-max="20" data-valid-title='비밀번호 확인'>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
						
						<div class="widget-body no-padding">
								<div class="widget-body-toolbar">
									<div class="row">
										<div class="col-sm-12 text-right">
											<a href="javascript:f_insertMchtUserInfo();" class="btn btn-primary">사용자 정보 추가</a>
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

function f_insertMchtUserInfo() {
	// Parameter Validation Check
	if(!$("#frmUser").formValid()) {
		return;
	}
	
	var pwd  	= $('#pwd').val();
   	var confPwd = $('#conf_pwd').val();
	
   	if(!f_passwordCheck('비밀번호', pwd)) {
   		return;
   	}
   	
   	if(!f_passwordCheck('비밀번호 확인', confPwd)) {
   		return;
   	}

	if(pwd != confPwd) {
		alert("입력하신 두개의 비밀번호가  다릅니다.\n다시한번 확인해주세요.");
		return;
	}
	
	var mchtId = $("#frmKeepData").find('input[name=mcht_id]').val();
	
	var params = $('#frmUser').serializeFormObject();
	params['mcht_id'] = mchtId;
	params['pwd'] 	  = pwd;
	
	$.ajax({
	    url: api_url+'/bo/merchant/npmt_bo_02100',
	    type: 'POST',
	    async: true,
	    cache: false,
	    datatype: 'json',
	    contentType: 'application/json;charset=utf-8',
	    data: JSON.stringify(params),
	    success: function(resultData){
	    	alert("사용자 정보 등록이 정상적으로 처리 되었습니다.");
	    	
	    	getUserInfoList();
	    	
	    	$("#mcht_user_wd").empty();
	    	$("#mcht_user_wd").dialog("close");
	    },
	    error: function(resultData) {
	    	var serverObj = resultData["responseJSON"];
	    	alert('code:'+serverObj["code"]+'\n'+'message:'+cf_msg(serverObj["message"])+'\n');
	    	return;
	    }
	});
}

pageSetUp();

</script>