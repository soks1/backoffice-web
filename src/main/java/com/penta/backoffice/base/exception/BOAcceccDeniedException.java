package com.penta.backoffice.base.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

public class BOAcceccDeniedException extends Exception {

	private static final long serialVersionUID = 1L;
	
	public BOAcceccDeniedException() {
		super();
	}
	
	public BOAcceccDeniedException(String message) {
		super(message);
	}

	public BOAcceccDeniedException(Throwable cause) {
		super(cause);
	}
	
	public BOAcceccDeniedException(String message, Throwable cause) {
		super(message, cause);
	}
	
	public String getPrintStackTrace() {
		StringWriter stringWriter = new StringWriter();
		printStackTrace(new PrintWriter(stringWriter));
		
	    return stringWriter.toString();
	}
	
	public Throwable getRootCause() {
		Throwable rootCause = null;
		Throwable cause = getCause();
		
		while(cause != null && cause != rootCause) {
			rootCause = cause;
			cause = cause.getCause();
		}
		  
		return rootCause;	
	}	
	
}
