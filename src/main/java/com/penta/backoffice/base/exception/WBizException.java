package com.penta.backoffice.base.exception;

public class WBizException extends WException {

	private static final long serialVersionUID = 2304611278920646083L;

    public WBizException() {
        super();
    }

    public WBizException(String message) {
        super(message);
    }

    public WBizException(Throwable cause) {
        super(cause);
    }

    public WBizException(String message, Throwable cause) {
        super(message, cause);
    }
    
}
