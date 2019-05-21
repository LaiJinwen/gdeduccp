package edu.gd.ccp.service;

public class documentsPublishException extends BaseException {

	public documentsPublishException() {
		super("服务器繁忙，发布文档失败，请稍后再试。");
	}

	public documentsPublishException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO 自动生成的构造函数存根
	}

	public documentsPublishException(String message, Throwable cause) {
		super(message, cause);
		// TODO 自动生成的构造函数存根
	}

	public documentsPublishException(String message) {
		super(message);
		// TODO 自动生成的构造函数存根
	}

	public documentsPublishException(Throwable cause) {
		super(cause);
		// TODO 自动生成的构造函数存根
	}

}
