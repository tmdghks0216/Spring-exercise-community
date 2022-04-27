package com.test.app.VO;

import java.util.Date;

public class ReplyVO {

	private int rpk;
	private int bpk;
	private String mid;
	private String msg;
	private Date rdate;
	

	public int getRpk() {
		return rpk;
	}
	public void setRpk(int rpk) {
		this.rpk = rpk;
	}
	public int getBpk() {
		return bpk;
	}
	public void setBpk(int bpk) {
		this.bpk = bpk;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rpk=" + rpk + ", bpk=" + bpk + ", mid=" + mid + ", msg=" + msg + ", rdate=" + rdate + "]";
	}
	
	
	
}
