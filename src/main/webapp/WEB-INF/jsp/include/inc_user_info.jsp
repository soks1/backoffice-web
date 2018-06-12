<%@page import="com.penta.backoffice.base.util.LangUtil"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.penta.backoffice.web.common.constant.CommonConstant"%>
<%
	String empno = (String)session.getAttribute(CommonConstant.SESSION_EMPNO);
	String name = (String)session.getAttribute(CommonConstant.SESSION_NAME);
%>
			<div class="login-info">
				<span> <!-- User image size is adjusted inside CSS, it should stay as is --> 
					
					<a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
						<span>
							<i class="fa fa-user"></i> <%=LangUtil.replaceInjection(name)%> (<%=LangUtil.replaceInjection(empno)%>) 
						</span>
					</a> 
					
				</span>
			</div>