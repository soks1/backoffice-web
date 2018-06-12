package com.penta.backoffice.web.system.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.penta.backoffice.base.util.MenuUtil;
import com.penta.backoffice.web.common.constant.CommonConstant;

/**
 * @class	: AdminController
 * @author	: 
 * @since	: 
 * @description	: 
 *
 * Copyright (C) by PENTAWORKS All right reserved.
 */
@Controller
public class AdminController {
	
	/**
	 * 관리자 정보관리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/system/admin/adminPN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminPN(HttpSession session, HttpServletRequest request) {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/system/admin/adminPN";
	}
	/*
	*//**
	 * o2o 목록 조회 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/o2o/o2oLN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String o2oLN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/o2o/o2oLN";
	}
	
	*//**
	 * o2o 상세 조회 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/o2o/o2oRN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String o2oRN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/o2o/o2oRN";
	}
	
	*//**
	 * o2o 등록 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/o2o/o2oWN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String o2oWN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_CREATE) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_CREATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/o2o/o2oWN";
	}
	
	*//**
	 * o2o 수정 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/o2o/o2oEN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String o2oEN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_UPDATE) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_UPDATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/o2o/o2oEN";
	}
	
	*//**
	 * o2o 관리 비콘 조회 다이얼로그
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/o2o/o2oBeaconSD.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String o2oBeaconSD(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/o2o/o2oBeaconSD";
	}
	
	*//**
	 * o2o 관리 비콘선택 비콘조회 리스트
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/o2o/o2oBeaconLL.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String o2oBeaconLL(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/o2o/o2oBeaconLL";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/o2o/o2oCouponBookSD.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String o2oCouponBookSD(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/o2o/o2oCouponBookSD";
	}*/
}
