package com.penta.backoffice.web.merchant.controller;

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
 * @class : MerchantController.java
 * @author : 
 * @since : 
 * @description : 가맹기관관리
 *  
 * Copyright (C) by PENTAWORKS All right reserved.
 *              
 */
@Controller
public class MerchantController {
	
	/**
	 * 가맹기관 
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/merchant/merchantPN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantPN(HttpSession session, HttpServletRequest request) {
		String reqServletPath = request.getServletPath();
		
		// 세션에 저장되어 있는 메뉴리스트에 파라미터가 있을 경우 매칭이 불가하여 파라미터 추가하여 메뉴권한을 가져온다.
		if(request.getParameter("p") != null && !"".equals(request.getParameter("p"))) {
			reqServletPath += "?p=" + request.getParameter("p");
		}
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), reqServletPath);
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/merchant/merchant/merchantPN";
	}
	
	/**
	 * 가맹점 목록(조회)
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/merchant/merchant/merchantLN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantLN(HttpSession session, HttpServletRequest request) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		
		return "/application/merchant/merchant/merchantLN";
	}

	/**
	 * 가맹점 상세
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/merchant/merchant/merchantRN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantRN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		
		return "/application/merchant/merchant/merchantRN";
	}

	/**
	 * 가맹점 수정
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/merchant/merchant/merchantEN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantEN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		
		if (menuAuth.get(CommonConstant.MENU_AUTH_UPDATE) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_UPDATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		
		return "/application/merchant/merchant/merchantEN";
	}

	/**
	 * 가맹점 등록
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/merchant/merchant/merchantWN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantWN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		
		if (menuAuth.get(CommonConstant.MENU_AUTH_CREATE) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_CREATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		
		return "/application/merchant/merchant/merchantWN";
	}
	
	/**
	 * 가맹점 사용자 정보 수정(팝업)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/merchant/popup/merchantUserED.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantUserED(HttpSession session, HttpServletRequest request) throws Exception {
		return "/application/merchant/merchant/popup/merchantUserED";
	}
	
	/**
	 * 가맹점 사용자 정보 추가(팝업)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/merchant/popup/merchantUserWD.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantUserWD(HttpSession session, HttpServletRequest request) throws Exception {
		return "/application/merchant/merchant/popup/merchantUserWD";
	}
	
	/**
	 * 가맹기관 선택(팝업)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/merchant/popup/institutionCD.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String institutionCD(HttpSession session, HttpServletRequest request) throws Exception {
		return "/application/merchant/merchant/popup/institutionCD";
	}

}


