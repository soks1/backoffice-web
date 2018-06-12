package com.penta.backoffice.web.payment.controller;

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
 * @class	: PaymentAllController.java
 * @author	: 
 * @since	: 
 * @description	: 전체 거래내역
 *
 * Copyright (C) by PENTAWORKS All right reserved.
 */
@Controller
public class PaymentAllController {

	/**
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/application/payment/all/paymentAllPN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String paymentAllPN(HttpSession session, HttpServletRequest request) {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/payment/all/paymentAllPN";
	}
	
	/**
	 * @param session
	 * @param request
	 * @return
	 * @throws BOException 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/payment/all/paymentAllLN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String paymentAllLN(HttpSession session, HttpServletRequest request) throws BOException {
		
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		
		
		return "/application/payment/all/paymentAllLN";
	}
	
	/**
	 * @param session
	 * @param request
	 * @return
	 * @throws BOException 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/payment/all/paymentAllRN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String paymentAllRN(HttpSession session, HttpServletRequest request) throws BOException {
		
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		
		
		return "/application/payment/all/paymentAllRN";
	}

	
}
