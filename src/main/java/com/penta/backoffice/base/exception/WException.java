package com.penta.backoffice.base.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

public class WException extends Exception {

	private static final long serialVersionUID = 1L;
	
	public WException() {
		super();
	}
	
	public WException(String message) {
		super(message);
	}

	public WException(Throwable cause) {
		super(cause);
	}
	
	public WException(String message, Throwable cause) {
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
