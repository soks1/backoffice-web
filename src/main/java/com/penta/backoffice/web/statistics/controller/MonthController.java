package com.penta.backoffice.web.statistics.controller;

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
 * @class : MonthController.java
 * @author : 
 * @since : 
 * @description : 월별 결제/취소
 * 
 *              Copyright (C) by PENTAWORKS All right reserved.
 */
@Controller
public class MonthController {

	@Autowired
	private Properties config;

	/**
	 * 월별 결제/취소
	 * 
	 * @return
	 */
	@RequestMapping(value = "/application/statistics/month/statisticsMonthPN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String statisticsMonthPN(HttpSession session, HttpServletRequest request) {

		MenuUtil menu = new MenuUtil(session.getAttribute(CommonConstant.SESSION_MENU), request.getServletPath());
		session.setAttribute("menuAuth", menu.getMenuAuth());

		return "/application/statistics/month/statisticsMonthPN";
	}
/*
	*//**
	 * 쿠폰관리 리스트 화면
	 * 
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/coupon/nomem/nomemCouponBookLN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String couponLN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/coupon/nomem/nomemCouponBookLN";
	}

	*//**
	 * 쿠폰관리 상세보기 화면
	 * 
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/coupon/nomem/nomemCouponBookRN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String couponRN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_READ) == null || ((String) menuAuth.get(CommonConstant.MENU_AUTH_READ)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/coupon/nomem/nomemCouponBookRN";
	}

	*//**
	 * 쿠폰관리 등록 화면
	 * 
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/coupon/nomem/nomemCouponBookWN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String couponWN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_CREATE) == null
				|| ((String) menuAuth.get(CommonConstant.MENU_AUTH_CREATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/coupon/nomem/nomemCouponBookWN";
	}

	*//**
	 * 쿠폰관리 수정 화면
	 * 
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/coupon/nomem/nomemCouponBookEN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String couponEN(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_UPDATE) == null
				|| ((String) menuAuth.get(CommonConstant.MENU_AUTH_UPDATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/coupon/nomem/nomemCouponBookEN";
	}

	*//**
	 * 쿠폰관리 수정 화면
	 * 
	 * @return
	 *//*
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/application/coupon/nomem/nomemCouponBookClosingDateRD.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String nomemCouponBookClosingDateRD(HttpSession session, HttpServletResponse response) throws Exception {
		Map<String, Object> menuAuth = (Map<String, Object>) session.getAttribute("menuAuth");
		if (menuAuth.get(CommonConstant.MENU_AUTH_UPDATE) == null
				|| ((String) menuAuth.get(CommonConstant.MENU_AUTH_UPDATE)).equals(CommonConstant.MENU_USE_FALSE)) {
			throw new BOException("권한이 없는 잘못된 접근");
		}
		return "/application/coupon/nomem/nomemCouponBookClosingDateRD";
	}*/

}
