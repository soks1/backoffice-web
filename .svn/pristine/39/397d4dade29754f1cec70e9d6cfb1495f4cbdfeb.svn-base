package com.penta.backoffice.web.system.controller;

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
 * @class	: CodeController
 * @author	: 
 * @since	: 
 * @description	: 코드관리
 *
 * Copyright (C) by PENTAWORKS All right reserved.
 */
@Controller
public class CodeController {
	
	@Autowired
	private Properties config;

	/**
	 *  코드 관리
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/system/code/codePN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String codePN(HttpSession session, HttpServletRequest request) {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/system/code/codePN";
	}
	/*
	*//**
	 * 스탬프 관리 리스트 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/stamp/stampLN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampLN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/stamp/stampLN";
	}
	
	*//**
	 * 스탬프 관리 등록 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/stamp/stampWN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampWN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_CREATE) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_CREATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/stamp/stampWN";
	}
	
	*//**
	 * 스탬프 관리 상세보기 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/stamp/stampRN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampRN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/stamp/stampRN";
	}
	
	*//**
	 * 스탬프 관리 수정 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/stamp/stampEN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampEN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_UPDATE) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_UPDATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/stamp/stampEN";
	}
	
	*//**
	 * 스탬프 관리 미션 상품 상세 다이얼로그
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/stamp/stampProductRD.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampProductRD(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/stamp/stampProductRD";
	}
	
	*//**
	 * 스탬프 관리 캠페인/고객군 조회 다이얼로그 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/stamp/stampCampaignSD.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampCampaignSD(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/stamp/stampCampaignSD";
	}
	
	*//**
	 * 스탬프 관리 캠페인/고객군 조회 리스트 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/stamp/stampCampaignLL.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampCampaignLL(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/stamp/stampCampaignLL";
	}
	
	*//**
	 * 스탬프 관리 등록 미션정보 영역
	 * @return
	 *//*
	@RequestMapping(value = "/application/stamp/stamp/appoint1.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String appoint1() {
		return "/application/stamp/stamp/appoint1";
	}
	@RequestMapping(value = "/application/stamp/stamp/appoint2.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String appoint2() {
		return "/application/stamp/stamp/appoint2";
	}
	@RequestMapping(value = "/application/stamp/stamp/locationVisited.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String locationVisited() {
		return "/application/stamp/stamp/locationVisited";
	}
	@RequestMapping(value = "/application/stamp/stamp/buyMoney1.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String buyMoney1() {
		return "/application/stamp/stamp/buyMoney1";
	}
	@RequestMapping(value = "/application/stamp/stamp/buyMoney2.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String buyMoney2() {
		return "/application/stamp/stamp/buyMoney2";
	}
	@RequestMapping(value = "/application/stamp/stamp/join.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String join() {
		return "/application/stamp/stamp/join";
	}
	
	@RequestMapping(value = "/application/stamp/stamp/appointMoney.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String appointMoney() {
		return "/application/stamp/stamp/appointMoney";
	}
		
	
	*//****************************************************************************************
	 *******************************       회원별 스탬프       *********************************
	 ****************************************************************************************//*
	
	*//**
	 * 회원별 스탬프 프로세스 화면
	 * @return
	 *//*
	@RequestMapping(value = "/application/stamp/member/stampMemberPN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampMemberPN(HttpSession session, HttpServletRequest request) {
		
		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());
		
		return "/application/stamp/member/stampMemberPN";
	}
	
	*//**
	 * 회원별 스탬프 리스트 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/member/stampMemberLN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampMemberLN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/member/stampMemberLN";
	}
	
	*//**
	 * 회원별 스탬프 상세보기 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/member/stampMemberRN.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampMemberRN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/member/stampMemberRN";
	}
	
	*//**
	 * 스탬프 적립 정보 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/member/stampFundRD.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampFundRD(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/member/stampFundRD";
	}
	
	*//**
	 * 스탬프 강제 날인 화면
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/member/stampForceSealWD.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampForceSealWD(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/member/stampForceSealWD";
	}
	
	*//**
	 * 스탬프 관리 미션 카테고리 상세 다이얼로그
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/stamp/stamp/stampCategoryRD.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String stampCategoryRD(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if(menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String)menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/stamp/stamp/stampCategoryRD";
	}*/
}
