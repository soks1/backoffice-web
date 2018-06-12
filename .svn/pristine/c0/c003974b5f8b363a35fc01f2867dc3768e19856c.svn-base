<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-us">	
	<head>
		<title>N-PMT</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!-- #CSS Links -->
		<jsp:include page="/WEB-INF/jsp/include/inc_css.jsp" flush="false"/>
		
		<script src="${pageContext.request.contextPath}/resources/js/libs/jquery-2.1.1.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/api_config.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/custom/common_util_script.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/custom/common_document.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/custom/common_script.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/custom/formValid.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/custom/searchVaild.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/custom/serializeFormObject.js"></script>
		
		<jsp:include page="/WEB-INF/jsp/include/inc_code_script.jsp" flush="false"/>
	</head>

	<body class="desktop-detected fixed-header fixed-navigation fixed-ribbon">
	
		<!-- #HEADER -->
		<header id="header">
			<div id="logo-group">
				<!-- PLACE YOUR LOGO HERE -->
				<span id="logo"> <img src="" alt=""> </span>
				<!-- END LOGO PLACEHOLDER -->
			</div>
			
			<!-- #TOGGLE LAYOUT BUTTONS -->
			<!-- pulled right: nav area -->
			<div class="pull-right">
				
				<!-- collapse menu button -->
				<div id="hide-menu" class="btn-header pull-right">
					<span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
				</div>
				<!-- end collapse menu -->
				
				<!-- logout button -->
				<div id="logout" class="btn-header transparent pull-right">
					<span> <a href="javascript:goLogout();" title="Sign Out" data-action="userLogout" data-logout-msg="정말로 로그아웃을 하시겠습니까?"><i class="fa fa-sign-out"></i></a> </span>
				</div>
				<!-- end logout button -->

				<!-- fullscreen button -->
				<div id="fullscreen" class="btn-header transparent pull-right">
					<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
				</div>
				<!-- end fullscreen button -->

			</div>
			<!-- end pulled right: nav area -->
		</header>
		<!-- END HEADER -->
		
		<!-- Left panel : Navigation area -->
		<aside id="left-panel">
			<jsp:include page="/WEB-INF/jsp/include/inc_user_info.jsp" flush="false"/>
			<jsp:include page="/WEB-INF/jsp/include/inc_left.jsp" flush="false"/>
		</aside>
		<!-- end Left panel -->
		
		<!-- #MAIN PANEL -->
		<div id="main" role="main">
			<!-- RIBBON -->
			<div id="ribbon">
				<span class="ribbon-button-alignment"> 
					<span class="btn btn-ribbon"><i class="fa fa-th"></i></span> 
				</span>
				<ol class="breadcrumb"></ol>
				<div class="widget-body">
				
				</div>
			</div>
			<!-- END RIBBON -->

			<!-- #MAIN CONTENT -->
			<div id="content">
				
			</div>
			<!-- END #MAIN CONTENT -->
		</div>
		<!-- END #MAIN PANEL -->

		<!-- #PAGE FOOTER -->
		<div class="page-footer">
			<div class="row">
				<div class="col-xs-12 col-sm-12 ta-r">
					<span class="txt-color-white">COIN PLUG<span class="hidden-xs"> - Copyright </span>© 2018 <span class="hidden-xs">All rights reserved.</span> </span>
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- END FOOTER -->

		<!--================================================== -->
		
		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>-->

		<!-- #PLUGINS -->
		<jsp:include page="/WEB-INF/jsp/include/inc_script.jsp" flush="false"/>
		
		<script type="text/javascript">
		function goLogout() {
	    	$.ajax({
			    url: '/logout.do', //this is the submit URL
			    type: 'GET', // GET or POST
			    async: true,
			    cache: false,
			    success: function(obj){
			    	localStorage.setItem('access_token', "");
			    	location.href = '/login.do';
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