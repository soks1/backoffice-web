package com.penta.backoffice.web.role.controller;

import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.penta.backoffice.base.exception.BOException;
import com.penta.backoffice.base.util.MenuUtil;
import com.penta.backoffice.web.common.constant.CommonConstant;

/**
 * @class	: RoleController.java
 * @author	: Jeong Kyo-Hyun.
 * @since	: 2015. 4. 30.
 * 
 * @description	: 역할 및 권한 관리 컨트롤러
 *
 * Copyright (C) by WIMO All right reserved.
 */
@Controller
public class RoleOldController {
	
	@Autowired
	private Properties config;

	
	/****************************************************************************************
	 ********************************       직무별역할관리       *******************************
	 ****************************************************************************************/
	
	@RequestMapping(value = "/application/role/duty/roleDutyPN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String roleDutyPN(HttpSession session, HttpServletRequest request) {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/role/duty/roleDutyPN";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/role/duty/roleDutyMN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String roleDutyMN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/role/duty/roleDutyMN";
	}
	
	
	/****************************************************************************************
	 ******************************       역할별메뉴권한관리       *****************************
	 ****************************************************************************************/
	
	@RequestMapping(value = "/application/role/menu/roleMenuPN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String roleMenuPN(HttpSession session, HttpServletRequest request) {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/role/menu/roleMenuPN";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/role/menu/roleMenuMN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String roleMenuMN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/role/menu/roleMenuMN";
	}
}
