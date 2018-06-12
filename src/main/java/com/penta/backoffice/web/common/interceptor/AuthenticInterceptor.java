package com.penta.backoffice.web.common.interceptor;

import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.penta.backoffice.base.util.LangUtil;
import com.penta.backoffice.web.common.constant.CommonConstant;

/**
 * @class	: AuthenticInterceptor.java
 * @author	: Jeong Kyo-Hyun.
 * @since	: 2014. 11. 12.
 * 
 * @description	: 인터셉터 클래스 세션 체크에 사용 dispatcher-servlet.xml 설정 저장
 *
 * Copyright (C) by WIMO All right reserved.
 */
public class AuthenticInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
    private Properties config;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
        // 회원 ID
        String empno = (String)session.getAttribute(CommonConstant.SESSION_EMPNO);
        
    	if(LangUtil.isEmpty(empno)) {
    		response.setContentType("text/html; charset=utf-8");
    		PrintWriter out = response.getWriter();
    		out.print(LangUtil.getMessage("세션이 종료 되었습니다. 로그인을 다시 하시기 바랍니다.", config.getProperty("backoffice.login.url")));
    		out.flush();
    		out.close();
    		return false;
    	}
        
        return true;
	}
	
}
