package com.dreamer.bean;

public class LogBean {
	private int id;
	private int type;
	private int user;
	private int operate;
	private String descriptio;
	private int result;
	private String ip_address;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	public int getOperate() {
		return operate;
	}
	public void setOperate(int operate) {
		this.operate = operate;
	}
	public String getDescriptio() {
		return descriptio;
	}
	public void setDescriptio(String descriptio) {
		this.descriptio = descriptio;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getIpAddress() {
		return ip_address;
	}
	public void setIpAddress(String ipAddress) {
		ip_address = ipAddress;
	}
}
