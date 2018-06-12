package com.penta.backoffice.base.util;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Random;
import java.util.StringTokenizer;

/**
 * @class	: LangUtil.java
 * @author	: Jeong Kyo-Hyun.
 * @since	: 2014. 11. 12.
 * 
 * @description	: 평소에 많이 사용되면 문자열 변환 공식 모음 클래스
 *
 * Copyright (C) by WIMO All right reserved.
 */
public class LangUtil {

	private static final String EMPTY_STRING = "";

	private static BitSet dontNeedEncoding;

	static {
		dontNeedEncoding = new BitSet(256);
		for (int i = 97; i <= 122; i++) {
			dontNeedEncoding.set(i);
		}
		for (int j = 65; j <= 90; j++) {
			dontNeedEncoding.set(j);
		}
		for (int k = 48; k <= 57; k++) {
			dontNeedEncoding.set(k);
		}
		dontNeedEncoding.set(32);
		dontNeedEncoding.set(45);
		dontNeedEncoding.set(95);
		dontNeedEncoding.set(46);
		dontNeedEncoding.set(42);
	}

	/**
	 * SQL 인젝션 방치 처리 코드
	 * 
	 * @param str
	 *            인입되는 문자열
	 * @return 인젝션 처리 후 반환 문자열
	 */
	public static String replaceInjection(String str) {
		if (str == null) {
			return "";
		}
		int length = str.length();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < length; i++) {
			String comp = str.substring(i, i + 1);
			if ("<".compareTo(comp) == 0) {
				buffer.append("&lt;");
			} else if (">".compareTo(comp) == 0) {
				buffer.append("&gt;");
			} else if ("'".compareTo(comp) == 0) {
				buffer.append("&#39;");
			} else if (";".compareTo(comp) == 0) {
				buffer.append("&#59;");
			} else if ("&".compareTo(comp) == 0) {
				buffer.append("&amp;");
			} else if ("script".compareTo(comp) == 0) {
				buffer.append("noscript");
			} else if ("SCRIPT".compareTo(comp) == 0) {
				buffer.append("NOSCRIPT");
			} else {
				buffer.append(comp);
			}
		}
		return buffer.toString();
	}

	/**
	 * 인입 문자열을 split 이 후 ArrayList 형식으로 리턴함.
	 * 
	 * @param str
	 *            인입 문자열
	 * @param separator
	 *            구분자
	 * @return 구분자로 구축된 ArrayList 데이터 리턴
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList splitCustom(String str, String separator) {
		String arrayItem = null;
		ArrayList arrayList = new ArrayList();
		StringTokenizer token = new StringTokenizer(str, separator);
		while (token.hasMoreTokens()) {
			arrayItem = token.nextToken();
			arrayList.add(arrayItem);
		}
		return arrayList;
	}

	/**
	 * 1234561234567 형식의 주민번호를 123456-1234567 형식으로 변경(법인 번호도 해당 함)
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 변경 문자열 리턴
	 */
	public static String fmtJumin(String str) {
		if (str.length() == 13) {
			StringBuffer sb = new StringBuffer();
			sb.append(str.substring(0, 6));
			sb.append("-");
			sb.append(str.substring(6));
			return sb.toString();
		} else if (str.length() == 10) {
			StringBuffer sb = new StringBuffer();
			sb.append(str.substring(0, 3));
			sb.append("-");
			sb.append(str.substring(3, 5));
			sb.append("-");
			sb.append(str.substring(5));
			return sb.toString();
		} else {
			return str;
		}
	}

	/**
	 * 123456 형식의 우편번호를 123-456 형식으로 변경
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 변경 문자열 리턴
	 */
	public static String fmtPost(String str) {
		if (str == null) {
			return EMPTY_STRING;
		} else if (str.trim().length() == 6) {
			return str.substring(0, 3) + "-" + str.substring(3, 6);
		} else {
			return str;
		}
	}

	/**
	 * 스트링 Null 확인(Null 우선) Null 이면 True, Not Null 이면 False
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 문자열의 참,거짓
	 * 
	 */
	public static boolean isEmpty(String str) {
		if (str == null) {
			return true;
		} else if ((str.trim()).equals(EMPTY_STRING)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 문자형 배열을 콤마(,)구분자를 붙여 문자열로 변환
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 반환 문자열
	 */
	public static String fmtArrayToStringComma(String[] str) {
		String rtn = "";
		if (str.length > 0) {
			for (int i = 0; i < str.length; i++) {
				rtn = rtn + str[i];
				if (i + 1 != str.length) {
					rtn += ", ";
				}
			}
		}
		return rtn;
	}

	/**
	 * 숫자형 문자를 999,999,999 또는 999,999,999.99 형식으로 변환
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 반환 문자열
	 */
	public static String fmtComma(String str) {
		if (str == null) {
			return EMPTY_STRING;
		}

		Double num;

		try {
			num = new Double(str);
		} catch (NumberFormatException nfe) {
			return "invalid argument";
		} catch (NullPointerException npe) {
			return "err-commaFormat(null)";
		}

		DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.##");

		return df.format(num);
	}

	/**
	 * 스트링 줄임을 표현 (...) : 바이트
	 * 
	 * @param str
	 *            인입 문자열
	 * @param limit
	 *            표시할 문자열 크기 : 바이트
	 * @return 반환 문자열
	 */
	public static String ellipsis(String str, int limit) {
		String rtn;
		rtn = getByteCut(str, limit - 3);
		if (str == null || str.equals(rtn)) {
			return rtn;
		} else {
			return rtn + "...";
		}
	}

	/**
	 * 바이트 단위 스트링 절삭 (한글 인코딩에 따라 안될 수도 있음)
	 * 
	 * @param str
	 *            인입 문자열
	 * @param limit
	 *            절삭 바이트
	 * @return 반환 문자열
	 */
	public static String getByteCut(String str, int limit) {

		if (str == null) {
			return str;
		}

		int len = str.length();
		int cnt = 0, index = 0;

		while (index < len && cnt < limit) {
			if (str.charAt(index++) < 256) {
				cnt++;
			} else {
				cnt += 2;
			}
		}

		if (index < len && limit >= cnt) {
			str = str.substring(0, index);
		} else if (index < len && limit < cnt) {
			str = str.substring(0, index - 1);
		}
		return str;
	}

	/**
	 * 인입 문자열 중 from 에 문자를 to 문자로 치환
	 * 
	 * @param str
	 *            인입 문자열
	 * @param from
	 *            변경 대상 문자
	 * @param to
	 *            변경 할 문자
	 * @return 반환 문자열
	 */
	public static String replace(String str, String from, String to) {
		String strCheck = new String(str);
		StringBuffer strBuf = new StringBuffer();
		while (strCheck.length() != 0) {
			int begin = strCheck.indexOf(from);
			if (begin == -1) {
				strBuf.append(strCheck);
				break;
			} else {
				int end = begin + from.length();
				strBuf.append(strCheck.substring(0, begin));
				strBuf.append(to);
				strCheck = strCheck.substring(end);
			}
		}
		return new String(strBuf);
	}

	/**
	 * SQL Left Like Type ('%str')
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 반환 문자열
	 */
	public static String getSqlLLike(String str) {
		str = replace(str, "'", "&#39;");
		str = "%" + str;
		str = "'" + str + "'";
		return str;
	}

	/**
	 * SQL Right Like Type ('str%')
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 반환 문자열
	 */
	public static String getSqlRLike(String str) {
		str = replace(str, "'", "&#39;");
		str = str + "%";
		str = "'" + str + "'";
		return str;
	}

	/**
	 * SQL Like Type ('%str%')
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 반환 문자열
	 */
	public static String getSqlLike(String str) {
		str = replace(str, "'", "&#39;");
		str = "%" + str + "%";
		str = "'" + str + "'";
		return str;
	}

	/**
	 * 문자열 양 끝에 "'" 삽입 ('str')
	 * 
	 * @param str
	 *            인입 문자열
	 * @return 반환 문자열
	 */
	public static String getSqlChar(String str) {
		str = nvl(str, EMPTY_STRING);
		str = replace(str, "'", "&#39;");
		str = str.trim();
		return new String("'" + str + "'");
	}

	/**
	 * 인입 문자열이 null 이면 지정 문자열을 반환
	 * 
	 * @param str
	 *            인입 문자열
	 * @param val
	 *            반환 될 문자열
	 * @return 반환 문자열
	 */
	public static String nvl(String str, String val) {
		if (str == null || str.equals("null") || str.equals(EMPTY_STRING)) {
			return val;
		} else {
			return str;
		}
	}

	/**
	 * 인입 문자열이 null 이면 val 문자열을, null 아니면 nval 문자열을 반환
	 * 
	 * @param str
	 *            인입 문자열
	 * @param val
	 *            null 일때 반환 될 문자
	 * @param nval
	 *            not null 일때 반환 될 문자
	 * @return
	 */
	public static String nvl(String str, String val, String nval) {
		if (str == null || str.equalsIgnoreCase("null")
				|| str.equals(EMPTY_STRING)) {
			return val;
		} else {
			return nval;
		}
	}

	/**
	 * 인입 문자열이 매칭 문자열과 같은경우 rtn_yes를, 아니면 rtn_no를 반환
	 * 
	 * @param str
	 *            인입 문자열
	 * @param mat
	 *            비교 대상 문자열
	 * @param rtn_yes
	 *            조건 성립 반환 문자열
	 * @param rtn_no
	 *            조건 비성립 반환 문자열
	 * @return 반환 문자열
	 */
	public static String nvl(String str, String mat, String rtn_yes,
			String rtn_no) {
		str = LangUtil.nvl(str, EMPTY_STRING);
		if (str.equals(mat)) {
			return rtn_yes;
		} else {
			return rtn_no;
		}
	}

	/**
	 * 인입 숫자가 매칭 숫자와 같은경우 rtn_yes를, 아니면 rtn_no를 반환
	 * 
	 * @param num
	 *            인입 숫자
	 * @param mat
	 *            비교 대상 숫자
	 * @param rtn_yes
	 *            조건 성립 반환 문자열
	 * @param rtn_no
	 *            조건 비성립 반환 문자열
	 * @return 반환 문자열
	 */
	public static String nvl(int num, int mat, String rtn_yes, String rtn_no) {
		if (num == mat) {
			return rtn_yes;
		} else {
			return rtn_no;
		}
	}

	/**
	 * 폼 전송시에 데이터 정제
	 * 
	 * @param src
	 * @return
	 */
	public static String toForm(String src) {
		String strBuffer = src;
		if (src == null) {
			return EMPTY_STRING;
		}
		strBuffer = replace(strBuffer, "&", "&amp;");
		strBuffer = replace(strBuffer, "<", "&lt;");
		strBuffer = replace(strBuffer, ">", "&gt;");
		strBuffer = replace(strBuffer, "\"", "&quot;");
		strBuffer = replace(strBuffer, "\'", "&#039;");
		strBuffer = replace(strBuffer, "&amp;amp;#", "&amp;#");
		return strBuffer;
	}

	/**
	 * 텍스트 형식으로 변경
	 * 
	 * @param src
	 * @return
	 */
	public static String toText(String src) {
		String strBuffer = nvl(src, "");
		strBuffer = replace(strBuffer, "&", "&amp;");
		strBuffer = replace(strBuffer, "<", "&lt;");
		strBuffer = replace(strBuffer, ">", "&gt;");
		strBuffer = replace(strBuffer, "\"", "&quot;");
		strBuffer = replace(strBuffer, "\'", "&#039;");
		strBuffer = replace(strBuffer, " ", "&nbsp;");
		strBuffer = replace(strBuffer, "\n", "<br/>");
		strBuffer = replace(strBuffer, "&amp;#", "&#");
		return strBuffer;
	}

	/**
	 * @param msg
	 *            에러 메세지.
	 * @return 에러 메세지 자바 스크립트로 출력할 문자열
	 */
	public static String getErrMessage(String msg) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script type=\"text/javascript\">\n");
		sb.append("  alert(\"" + msg + "\");\n");
		sb.append("  history.go(-1);\n");
		sb.append("</script>\n");
		return sb.toString();
	}

	/**
	 * @param msg
	 *            에러 메세지.
	 * @return 에러 메세지 자바 스크립트로 출력할 문자열
	 */
	public static String getErrMessage(String msg, String url) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script type=\"text/javascript\">\n");
		sb.append("  alert(\"" + msg + "\");\n");
		sb.append("  location.href=\"" + url + "\";\n");
		sb.append("</script>\n");
		return sb.toString();
	}

	public static String getMessageOnly(String msg) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script type=\"text/javascript\">\n");
		sb.append("  alert(\"" + msg + "\");\n");
		sb.append("</script>\n");
		return sb.toString();
	}
	
	/**
	 * @param msg
	 *            메세지.
	 * @return 메세지 자바 스크립트로 출력할 문자열
	 */
	public static String getMessage(String msg) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script type=\"text/javascript\">\n");
		sb.append("  alert(\"" + msg + "\");\n");
		sb.append("  history.go(-1);\n");
		sb.append("</script>\n");
		return sb.toString();
	}

	/**
	 * @param msg
	 *            메세지.
	 * @return 메세지 자바 스크립트로 출력할 문자열
	 */
	public static String getMessage(String msg, String url) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script type=\"text/javascript\">\n");
		sb.append("  alert(\"" + msg + "\");\n");
		sb.append("  location.href=\"" + url + "\";\n");
		sb.append("</script>\n");
		return sb.toString();
	}
	
	/**
	 * 액션 URL 얻기(전자정부 프레임워크 용)
	 * @param str
	 * @return
	 */
	public static String getActionUrl(String str) {
		String rtn = "";
		
		String tmp[] = str.split("/");
		for(int i = 1; i < tmp.length; i++) {
			if(!tmp[i].equals("WEB-INF") && !tmp[i].equals("jsp")){
				rtn = rtn + "/" + tmp[i];
			}
		}
		
		return rtn.replace(".jsp", ".do");
	}
	
	/**
	 * 랜덤 코드 생성
	 * @param len
	 * @return
	 */
	public static String getMakeRandomCode(int len) {
		Random ran = new Random();
		StringBuffer buf = new StringBuffer();
		
		for(int i = 0; i < len; i++) {
			if(ran.nextBoolean()){
				buf.append((char)((int)(ran.nextInt(26))+97));
			} else {
				buf.append((ran.nextInt(10)));
			}
		}
		
		return buf.toString();
	}
}
