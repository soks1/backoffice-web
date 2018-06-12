package com.penta.backoffice.web.menu.controller;

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
 * @class	: RoleController
 * @author	: 
 * @since	: 
 * @description	: 조직관리
 *
 * Copyright (C) by PENTAWORKS All right reserved.
 */
@Controller
public class RoleController {
	
	/**
	 * 역할관리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/menu/role/rolePN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String rolePN(HttpSession session, HttpServletRequest request) {
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/menu/role/rolePN";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/menu/role/roleMN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String roleMN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/menu/role/roleMN";
	}
	
}
