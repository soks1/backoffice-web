<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-us">	
<head>
	<title>COIN PLUG</title>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<!-- #CSS Links -->
	<jsp:include page="/WEB-INF/jsp/include/inc_css.jsp" flush="false"/>
	
	<script src="${pageContext.request.contextPath}/resources/js/libs/jquery-2.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/api_config.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom/common_script.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom/formValid.js"></script>
	
	<style type="text/css">
		.login_box_wrapper {
			position:absolute !important; 
			width: 100%; 
			height: 100%;
			display:none;
			bottom:10%;
		}
		
		.login_box {
			position: absolute;
			width: 70%;
			max-width:500px;
			height:345px;
			top:0; bottom:0; left:0; right:0;
			margin:auto;
			padding: 20px;
			border: 1px solid;
			background-color: white;
			font-weight:bold;
		}
		
		.login_box H1 {
			padding-bottom: 50px;
		}
	</style>
</head>

<body class="desktop-detected fixed-header fixed-navigation">
	<!-- #HEADER -->
	<header id="header">
		<div id="logo-group">
			<!-- PLACE YOUR LOGO HERE -->
			<span id="logo"> <img src="" alt=""> </span>
			<!-- END LOGO PLACEHOLDER -->
		</div>
	</header>
	<!-- END HEADER -->
	<!-- Left panel : Navigation area -->
	
	<!-- #MAIN CONTENT -->
	<div class="center login_box_wrapper" id="content">
		<form id="frmLogin" class="login_box">
			<h1>BACK OFFICE</h1>
			<div class="form-group">
				<label class="control-label">아이디</label>
				<div class="">
					<input class="form-control" type="text" name="login_id" 
							data-valid-use='true' data-valid-symbol='true' data-valid-max="108" data-valid-title='아이디'>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">패스워드</label>
				<div class="">
					<input class="form-control" type="password" name="login_pw" 
							data-valid-use='true' data-valid-symbol='true' data-valid-max="108" data-valid-title='패스워드'>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label"></label>
				<div class="ta-r">
					<a href="javascript:loginValidate(0);" class="btn btn-primary" id="btn_login">로그인</a>
					<!-- <a href="javascript:testFn();" class="btn btn-primary" id="btn_login">테스트</a> -->
				</div>
			</div>
		</form>
	</div>
	<!-- END #MAIN CONTENT -->
	<!-- END #MAIN PANEL -->

	<!-- #PAGE FOOTER -->
	<div class="page-footer">
		<div class="row">
			<div class="col-xs-12 col-sm-12 ta-r">
				<span class="txt-color-white">COIN PLUG<span class="hidden-xs"> Copyright </span>© 2018 <span class="hidden-xs">All rights reserved.</span> </span>
			</div>
		</div>
		<!-- end row -->
	</div>
	<!-- END FOOTER -->

	<!--================================================== -->
	<script type="text/javascript">
	$(document).ready(function() {
		$('#content').fadeIn('slow');
		
		$("input[name=login_id]").focus();
		
		$("input[name=login_pw]").on("keydown", function(key) {
			if(key.keyCode == 13){
				loginValidate();
	        }
		});
	});

	function loginValidate() {
		var loginId = $("input[name=login_id]").val();
		var loginPw = $("input[name=login_pw]").val();
		
		if(loginId == "") {
			alert("아이디를 입력 하세요");
			return;
		}
		
		if(loginPw == "") {
			alert("비밀번호를 입력 하세요");
			return;
		}
		
		var params = {
			login_id : loginId,
			login_pw : loginPw
		};
		
		$.ajax({
		    url: api_url+'/bo/member/npmt_bo_00001',
		    type: 'POST',
		    async: true,
		    cache: false,
		    datatype: 'json',
		    contentType: 'application/json;charset=utf-8',
		    data: JSON.stringify(params),
		    success: function(obj){
		    	goLogin();
		    },
			error: function(obj) {
		    	var serverObj = obj.responseJSON;
		    	if (serverObj.code == "B1120") {
		    		if(confirm("타 클라이언트에서 로그인한 상태이거나, 로그아웃하지 않고 클라이언트를 종료한 상태입니다.\n로그인을 계속 진행하시면 기존 로그인은 해제됩니다.\n\n계속 진행하시겠습니까?")) {
		    			goLogin();
		    		}
		    	} else {
	    			alert(cf_msg(serverObj.message));
		    	}
		    	return;
			}
		});
	}
	
	function goLogin() {
		var params = {
			login_id : $("input[name=login_id]").val(),
			login_pw : $("input[name=login_pw]").val()
		};
		
    	$.ajax({
		    url: '/login/proc.do', //this is the submit URL
		    type: 'POST', // GET or POST
		    async: true,
		    cache: false,
		    data: params,
		    success: function(obj){
		    	var token = obj.access_token;
		    	localStorage.setItem('access_token', token);
		    	location.href = '/index.do';
		    },
		    error: function(obj) {
		    	var serverObj = obj.responseJSON;
	    		alert(cf_msg(serverObj.message));
		    	return;
		    }
		});
	}
	</script>
</body>
</html>