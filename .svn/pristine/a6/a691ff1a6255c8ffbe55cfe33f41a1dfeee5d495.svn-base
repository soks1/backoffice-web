package com.penta.backoffice.web.sample.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.penta.backoffice.base.exception.BOException;
import com.penta.backoffice.base.util.MenuUtil;
import com.penta.backoffice.web.common.constant.CommonConstant;

/**
 * @class	: SampleController.java
 * @author	: 
 * @since	: 
 * 
 * @description	: 개발자 샘플용 테스트 컨트롤러
 *
 * Copyright (C) by PENTAWORKS All right reserved.
 */
@Controller
public class SampleController {

	/**
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/application/sample/samplePN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String samplePN(HttpSession session, HttpServletRequest request) {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/sample/samplePN";
	}

	/**
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/sample/sampleLN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String sampleLN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/sample/sampleLN";
	}
	
}
