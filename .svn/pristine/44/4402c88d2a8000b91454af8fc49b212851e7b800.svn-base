<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-us" id="lock-page">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title> COIN PLUG </title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/smartadmin-skins.min.css">

		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/smartadmin-rtl.min.css"> 

		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/demo.min.css">

		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/lockscreen.min.css">

		<script src="${pageContext.request.contextPath}/resources/js/api_config.js"></script>
	</head>
	
	<body>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->

			<div class="lockscreen animated flipInY">
				<div class="logo">
					<h1 class="semi-bold">N-PMT</h1>
				</div>
				<div>
					<div style="text-align:center !important;">
						<img src="${pageContext.request.contextPath}/resources/img/loading_init.gif" alt="" />
						<p>권한설정 초기화 중 입니다.</p>
					</div>
				</div>
				<p class="font-xs margin-top-5" style="text-align:center;">
					Copyright SmartAdmin 2014-2020.
				</p>
			</div>
		</div>

	    <script src="${pageContext.request.contextPath}/resources/js/libs/jquery-2.1.1.min.js"></script>

	    <script src="${pageContext.request.contextPath}/resources/js/libs/jquery-ui-1.10.3.min.js"></script>

		<!-- BOOTSTRAP JS -->		
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>

		<script type="text/javascript">
		$(function() {
			
			var data = {
				empno: '${empno}'
			};
			
			$.ajax({
			    url: api_url + "/backoffice/member/login", //this is the submit URL
			    type: 'POST', // GET or POST
			    async: true,
			    cache: false,
			    datatype: 'json',
			    contentType: 'application/json;charset=utf-8',
			    data: JSON.stringify(data),
			    success: function(obj){
			    	var jsonObj = JSON.stringify(obj);
			    	$.ajax({
					    url: '/initialize.do', //this is the submit URL
					    type: 'POST', // GET or POST
					    async: true,
					    cache: false,
					    data: jsonObj,
					    contentType: "application/json;charset=utf-8",
					    success: function(obj){
					    	location.href = '/index.do';
					    },
					    error: function() {
					    	alert("서버와의 통신에 실패하였습니다.");
					    	return;
					    }
					});
			    },
			    error: function(obj) {
			    	var serverObj = obj.responseJSON;
			    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
			    	return;
			    }
			});	
		});
		</script>
	</body>
</html>