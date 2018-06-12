package com.penta.backoffice.web.common.main.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.penta.backoffice.base.exception.BOException;
import com.penta.backoffice.base.util.MenuUtil;
import com.penta.backoffice.web.common.constant.CommonConstant;

/**
 * @class : MainControlController.java
 * @author : 175clan.
 * @since : 2015. 4. 30.
 * 
 * @description : 쿠폰 관리 컨트롤러
 * 
 *              Copyright (C) by WIMO All right reserved.
 */
@Controller
public class MainControlController {

	/**
	 * 메인화면관리 프로세스 화면
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/common/main/mainControlPN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainControlPN(HttpSession session, HttpServletRequest request) {

		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());

		return "/application/common/main/mainControlPN";
	}

	/**
	 * 메인화면관리 프로세스 목록 화면
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/common/main/mainControlLN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainControlLN(HttpSession session, HttpServletRequest request) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/common/main/mainControlLN";
	}

	/**
	 * 메인화면관리 프로세스 목록 화면
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/common/main/mainControlEN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainControlEN(HttpSession session, HttpServletRequest request) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_UPDATE) == null
				|| ((String) menuAuth.get(CommonConstant.MENU_AUTH_UPDATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}

		return "/application/common/main/mainControlEN";
	}

}
