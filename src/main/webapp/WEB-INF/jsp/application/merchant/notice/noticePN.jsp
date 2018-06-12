<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/application/notice.js"></script>
<div id="targetHtml">
<%
	if("R".equals(request.getParameter("p"))) {
%>
	<jsp:include page="/WEB-INF/jsp/application/merchant/notice/noticeRN.jsp" flush="false" />
<%
	} else {
%>
	<jsp:include page="/WEB-INF/jsp/application/merchant/notice/noticeLN.jsp" flush="false" />
<%
	}
%>
	
</div>