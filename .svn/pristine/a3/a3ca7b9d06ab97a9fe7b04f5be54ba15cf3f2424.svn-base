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
 * @class : NoticeController.java
 * @author : 
 * @since : 
 * @description : 가맹점관리 공지사항
 *  
 *                Copyright (C) by PENTAWORKS All right reserved.
 *              
 */
@Controller
public class NoticeController {

	/**
	 * 공지사항 
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/notice/noticePN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticePN(HttpSession session, HttpServletRequest request) {
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());

		return "/application/merchant/notice/noticePN";
	}
	
	/**
	 * 공지사항 목록(조회)
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/merchant/notice/noticeLN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeLN(HttpSession session, HttpServletRequest request) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}

		return "/application/merchant/notice/noticeLN";
	}

	/**
	 * 앱캐시관리 상세보기 화면
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/merchant/notice/noticeRN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeRN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/merchant/notice/noticeRN";
	}

	/**
	 * 공지사항 수정
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/merchant/notice/noticeEN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantEN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		
		if (menuAuth.get(CommonConstant.MENU_AUTH_UPDATE) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_UPDATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		
		return "/application/merchant//notice/noticeEN";
	}

	/**
	 * 가맹점 등록
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/merchant/notice/noticeWN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantWN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		
		if (menuAuth.get(CommonConstant.MENU_AUTH_CREATE) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_CREATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		
		return "/application/merchant/notice/noticeWN";
	}
	
	/**
	 * 가맹점 선택(팝업)
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/merchant/notice/popup/merchantCD.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String merchantCD(HttpSession session, HttpServletRequest request) throws Exception {
		return "/application/merchant/notice/popup/merchantCD";
	}

}


