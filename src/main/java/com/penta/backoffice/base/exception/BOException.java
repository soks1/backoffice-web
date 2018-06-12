package com.penta.backoffice.base.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

public class BOException extends Exception {

	private static final long serialVersionUID = 1L;
	
	public BOException() {
		super();
	}
	
	public BOException(String message) {
		super(message);
	}

	public BOException(Throwable cause) {
		super(cause);
	}
	
	public BOException(String message, Throwable cause) {
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
