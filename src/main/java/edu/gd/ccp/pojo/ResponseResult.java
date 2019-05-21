package edu.gd.ccp.pojo;

import java.io.Serializable;

public class ResponseResult<T> implements Serializable{

	public static final int State_OK = 1;
	public static final int State_ERR = -1;
	public static final int State_NotDone = 0; 
	
	private static final long serialVersionUID = 3060783744255249502L;
	private String message;
	private int state = State_NotDone;
	private T data;
	
	public ResponseResult() {
		super();
	}


	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
}
