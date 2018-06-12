package com.penta.backoffice.web.merchant.controller;

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
 * @class : InstitutionController.java
 * @author : 
 * @since : 
 * @description : 가맹기관관리
 *  
 * Copyright (C) by PENTAWORKS All right reserved.
 *              
 */
@Controller
public class InstitutionController {

	@Autowired
	private Properties config;
	
	/**
	 * 가맹기관 목록(조회)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/institution/institutionPN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String institutionPN(HttpSession session, HttpServletRequest request) {

		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());

		return "/application/merchant/institution/institutionPN";
	}
	
	/**
	 * 가맹기관 
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/institution/institutionLN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String institutionLN(HttpSession session, HttpServletRequest request) throws Exception {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/merchant/institution/institutionLN";
	}
	
	/**
	 * 가맹기관 신규 등록
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/institution/institutionWN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String institutionWN(HttpSession session, HttpServletRequest request) throws Exception {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/merchant/institution/institutionWN";
	}
	
	/**
	 * 가맹기관 상세
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/institution/institutionRN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String institutionRN(HttpSession session, HttpServletRequest request) throws Exception {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/merchant/institution/institutionRN";
	}
	
	/**
	 * 가맹기관 수정
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/institution/institutionEN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String institutionEN(HttpSession session, HttpServletRequest request) throws Exception {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/merchant/institution/institutionEN";
	}

}


