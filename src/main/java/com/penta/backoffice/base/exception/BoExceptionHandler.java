package com.penta.backoffice.base.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @class	: BoExceptionHandler.java
 * @author	: Jeong Kyo-Hyun.
 * @since	: 2015. 3. 19.
 * 
 * @description	: 백오피스 익셉션 핸들러
 *
 * Copyright (C) by WIMO All right reserved.
 */
@ControllerAdvice
public class BoExceptionHandler {
	
    /**
     * 백오피스 메시지 익셉션 핸들러
     * @param e
     * @return
     */
    @ExceptionHandler(BOException.class)
    public ModelAndView handleBoMessageException(BOException e) {
    	
    	ModelAndView model = new ModelAndView();
    	model.setViewName("/application/dashboard");
    
		return model;
	}
    
    @ExceptionHandler(BOAcceccDeniedException.class)
    public ModelAndView handleBoMessageException(BOAcceccDeniedException e) {
    	
    	ModelAndView model = new ModelAndView();
    	model.setViewName("/application/common/error/access_error");
    
		return model;
	}
	
    
    
    
}
