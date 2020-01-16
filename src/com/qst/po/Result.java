package com.qst.po;
/**
 * Json对象实体类
 * @param <T>泛型为了返回json数据转化方便
 */
public class Result<T> {
	private int code;
	private boolean success;
	private T data;
	private String msg;
	public Result() {
	}
	public Result(int code, boolean success, String msg) {
		super();
		this.code = code;
		this.success = success;
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}




}
