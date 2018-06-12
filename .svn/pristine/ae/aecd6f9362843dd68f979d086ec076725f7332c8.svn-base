package com.penta.backoffice.base.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * @class	: DateTime.java
 * @author	: Jeong Kyo-Hyun.
 * @since	: 2014. 11. 12.
 * 
 * @description	: Date객체 Calendar객체 String객체를 자유롭게 변환하기 위한 Util Class
 *
 * Copyright (C) by WIMO All right reserved.
 */
public class DateTime {

	// ========================= Convert for String =========================//

	/**
	 * Date객체를 yyyy-MM-dd형태로 변환
	 * 
	 * @param date
	 *            Date객체
	 * @return 반환 문자열
	 */
	public static String getStringDate(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(date);
		return dateString;
	}

	/**
	 * Date객체를 지정된 형태로 변환
	 * 
	 * @param date
	 *            Date객체
	 * @param pattern
	 *            변환 형태
	 * @return 반환 문자열
	 */
	public static String getStringDate(Date date, String pattern) {
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String dateString = formatter.format(date);
		return dateString;
	}

	/**
	 * Date객체를 yyyy-MM-dd HH:mm:ss형태로 변환
	 * 
	 * @param date
	 *            Date객체
	 * @return 반환 문자열
	 */
	public static String getStringDateTime(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(date);
		return dateString;
	}

	/**
	 * Calendar객체를 yyyy-MM-dd형태로 변환
	 * 
	 * @param cal
	 *            Calendar객체
	 * @return 반환 문자열
	 */
	public static String getStringDate(Calendar cal) {
		SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd");
		return formattime.format(cal.getTime());
	}

	/**
	 * Calendar객체를 지정된 형태로 변환
	 * 
	 * @param cal
	 *            Calendar객체
	 * @param pattern
	 *            변환 형태
	 * @return 반환 문자열
	 */
	public static String getStringDate(Calendar cal, String pattern) {
		SimpleDateFormat formattime = new SimpleDateFormat(pattern);
		return formattime.format(cal.getTime());
	}

	/**
	 * Calendar객체를 yyyy-MM-dd HH:mm:ss형태로 변환
	 * 
	 * @param cal
	 *            Calendar객체
	 * @return 반환 문자열
	 */
	public static String getStringDateTime(Calendar cal) {
		SimpleDateFormat formattime = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		return formattime.format(cal.getTime());
	}

	/**
	 * Long객체를 yyyy-MM-dd형태로 변환
	 * 
	 * @param date
	 *            Long객체
	 * @return 반환 문자열
	 */
	public static String getStringDate(long date) {
		Date datetime = new Date(date);
		SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formattime.format(datetime);
		return dateString;
	}

	/**
	 * Long객체를 지정된 형태로 변환
	 * 
	 * @param date
	 *            Long객체
	 * @param pattern
	 *            변환 형태
	 * @return 반환 문자열
	 */
	public static String getStringDate(long date, String pattern) {
		Date datetime = new Date(date);
		SimpleDateFormat formattime = new SimpleDateFormat(pattern);
		String dateString = formattime.format(datetime);
		return dateString;
	}

	/**
	 * Long객체를 yyyy-MM-dd HH:mm:ss형태로 변환
	 * 
	 * @param date
	 *            Long객체
	 * @return 반환 문자열
	 */
	public static String getStringDateTime(long date) {
		Date datetime = new Date(date);
		SimpleDateFormat formattime = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String dateString = formattime.format(datetime);
		return dateString;
	}

	// ========================= Convert for Integer =========================//

	/**
	 * 현재 날짜를 yyyy형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getYear() {
		return getStringByPattern("yyyy");
	}

	/**
	 * 지정 날짜를 yyyy형태로 리턴
	 * 
	 * @param date
	 *            지정 날짜
	 * @return 반환 정수
	 */
	public static int getYear(Date date) {
		return getStringByPattern(date, "yyyy");
	}

	/**
	 * 현재 날짜를 MM형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getMonth() {
		return getStringByPattern("MM");
	}

	/**
	 * 지정 날짜를 MM형태로 리턴
	 * 
	 * @param date
	 *            지정 날짜
	 * @return 반환 정수
	 */
	public static int getMonth(Date date) {
		return getStringByPattern(date, "MM");
	}

	/**
	 * 현재 날짜를 dd형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getDay() {
		return getStringByPattern("dd");
	}

	/**
	 * 지정 날짜를 dd형태로 리턴
	 * 
	 * @param date
	 *            지정 날짜
	 * @return 반환 정수
	 */
	public static int getDay(Date date) {
		return getStringByPattern(date, "dd");
	}

	/**
	 * 현재 시간을 HH형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getHour() {
		return getStringByPattern("HH");
	}

	/**
	 * 지정 시간을 HH형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getHour(Date date) {
		return getStringByPattern(date, "HH");
	}

	/**
	 * 현재 시간을 mm형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getMinute() {
		return getStringByPattern("mm");
	}

	/**
	 * 지정 시간을 mm형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getMinute(Date date) {
		return getStringByPattern(date, "mm");
	}

	/**
	 * 현재 시간을 ss형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getSecond() {
		return getStringByPattern("ss");
	}

	/**
	 * 지정 시간을 ss형태로 리턴
	 * 
	 * @return 반환 정수
	 */
	public static int getSecond(Date date) {
		return getStringByPattern(date, "ss");
	}

	/**
	 * 현재 날짜를 지정된 형식에 맞게 리턴
	 * 
	 * @param pattern
	 *            지정 형태
	 * @return 반환 정수
	 */
	public static int getStringByPattern(String pattern) {
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String dateString = formatter.format(new Date());
		return Integer.parseInt(dateString);
	}

	/**
	 * 지정 날짜를 지정된 형식에 맞게 리턴
	 * 
	 * @param date
	 *            지정 날짜
	 * @param pattern
	 *            지정 형태
	 * @return 반환 정수
	 */
	public static int getStringByPattern(Date date, String pattern) {
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		String dateString = formatter.format(date);
		return Integer.parseInt(dateString);
	}

	// ========================= Convert for Date =========================//

	/**
	 * Calendar 객체를 yyyy-MM-dd형식으로 변환 변환
	 * 
	 * @param cal
	 *            지정 날짜
	 * @return 변환 Date형 날짜
	 */
	public static Date getDate(Calendar cal) {
		String d = getStringDate(cal);
		return getDate(d);
	}

	/**
	 * Calendar 객체를 지정된 형식으로 변환
	 * 
	 * @param cal
	 *            지정 날짜
	 * @param pattern
	 *            지정 형식
	 * @return 변환 Date형 날짜
	 */
	public static Date getDate(Calendar cal, String pattern) {
		String d = getStringDate(cal, pattern);
		return getDate(d);
	}

	/**
	 * Calendar 객체를 yyyy-MM-dd HH:mm:ss형식으로 변환
	 * 
	 * @param cal
	 *            지정 날짜
	 * @return 변환 Date형 날짜
	 */
	public static Date getDateTime(Calendar cal) {
		String d = getStringDate(cal, "yyyy-MM-dd HH:mm:ss");
		return getDate(d);
	}

	/**
	 * String 객체를 yyyy-MM-dd형식으로 변환 변환
	 * 
	 * @param sDate
	 *            지정 날짜
	 * @return 변환 Date형 날짜
	 */
	public static Date getDate(String sDate) {
		return getDate(sDate, "yyyy-MM-dd");
	}

	/**
	 * String 객체를 지정된 형식으로 변환
	 * 
	 * @param sDate
	 *            지정 날짜
	 * @param pattern
	 *            지정 형식
	 * @return 변환 Date형 날짜
	 */
	public static Date getDate(String sDate, String pattern) {
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		Date rtnValue = null;
		try {
			rtnValue = formatter.parse(sDate);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
		return rtnValue;
	}

	/**
	 * String 객체를 yyyy-MM-dd HH:mm:ss형식으로 변환
	 * 
	 * @param sDate
	 *            지정 날짜
	 * @return 변환 Date형 날짜
	 */
	public static Date getDateTime(String sDate) {
		return getDate(sDate, "yyyy-MM-dd HH:mm:ss");
	}

	// ========================= ETC =========================//

	/**
	 * Date 객체 중 시간 부분만 리턴
	 * 
	 * @param date
	 *            지정 날짜
	 * @return 변환 문자열
	 */
	public static String getTime(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
		String dateString = formatter.format(date);
		return dateString;
	}

	/**
	 * long 객체 중 시간 부분만 리턴
	 * 
	 * @param date
	 *            지정 날짜
	 * @return 변환 문자열
	 */
	public static String getTime(long date) {
		Date datetime = new Date(date);
		SimpleDateFormat formattime = new SimpleDateFormat("HH:mm:ss");
		String dateString = formattime.format(datetime);
		return dateString;
	}

	/**
	 * String 객체 중 시간 부분만 리턴
	 * 
	 * @param sDate
	 *            지정 날짜
	 * @return 변환 Date형 날짜
	 */
	public static Date getTime(String sDate) {
		return getDate(sDate, "HH:mm:ss");
	}

	/**
	 * Calendar 객체 중 시간 부분만 리턴
	 * 
	 * @param cal
	 *            지정 날짜
	 * @return 변환 Date형 날짜
	 */
	public static Date getTime(Calendar cal) {
		String d = getStringDate(cal, "HH:mm:ss");
		return getDate(d);
	}

	/**
	 * 전체 데이타 중 요일 정보 리턴(월/화/수/목/금/토/일)
	 * 
	 * @param date
	 *            지정 요일
	 * @return 반환 문자열
	 */
	public static String getDateToDay(Date date) {

		String rtn = "";

		int year = getYear(date);
		int month = getMonth(date) - 1;
		int day = getDay(date);

		Calendar cal = new GregorianCalendar(year, month, day);
		int day_of_week = cal.get(Calendar.DAY_OF_WEEK);

		switch (day_of_week) {
		case 1:
			rtn = "SUNDAY";
			break;

		case 2:
			rtn = "MONDAY";
			break;

		case 3:
			rtn = "TUESDAY";
			break;

		case 4:
			rtn = "WEDNESDAY";
			break;

		case 5:
			rtn = "THURSDAY";
			break;

		case 6:
			rtn = "FRIDAY";
			break;

		case 7:
			rtn = "SATURDAY";
			break;

		default:
			rtn = "NONE";
			break;
		}

		return rtn;
	}

}
