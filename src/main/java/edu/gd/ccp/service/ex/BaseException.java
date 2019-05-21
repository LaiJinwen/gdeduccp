package edu.gd.ccp.service.ex;

import java.io.Serializable;

public class BaseException extends RuntimeException implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1001985866190114834L;
	
	public BaseException() {
		super();
		// TODO 自动生成的构造函数存根
	}

	public BaseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO 自动生成的构造函数存根
	}

	public BaseException(String message, Throwable cause) {
		super(message, cause);
		// TODO 自动生成的构造函数存根
	}

	public BaseException(String message) {
		super(message);
		// TODO 自动生成的构造函数存根
	}

	public BaseException(Throwable cause) {
		super(cause);
		// TODO 自动生成的构造函数存根
	}
	
	
}
