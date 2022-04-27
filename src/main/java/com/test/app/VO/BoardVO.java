package com.test.app.VO;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {

	
	private int bpk;//pk
	private String bArea; //지역
	private String bcategory;//카테고리
	private String event;//종목
	private String condition;// 성별 조건
	private String bPhoto;//사진
	private String title;//제목
	
	private String mid;//작성자
	private String content;//내용
	private  Date bdate;//현재시간
	
	private  String period;//모집기간 
	private int views;//조회수
	private String badrr;//주소
	private String status;//모집상태
	
	
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String evant) {
		this.event = evant;
	}
	public int getBpk() {
		return bpk;
	}
	public void setBpk(int bpk) {
		this.bpk = bpk;
	}
	public String getbArea() {
		return bArea;
	}
	public void setbArea(String bArea) {
		this.bArea = bArea;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public String getbPhoto() {
		return bPhoto;
	}
	public void setbPhoto(String bPhoto) {
		this.bPhoto = bPhoto;
	}

	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getBadrr() {
		return badrr;
	}
	public void setBadrr(String badrr) {
		this.badrr = badrr;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BoardVO [bpk=" + bpk + ", bArea=" + bArea + ", bcategory=" + bcategory + ", evant=" + event
				+ ", condition=" + condition + ", bPhoto=" + bPhoto + ", title=" + title + ", mid=" + mid + ", content="
				+ content + ", bdate=" + bdate + ", period=" + period + ", views=" + views + ", badrr=" + badrr
				+ ", status=" + status + "]";
	}
	
	
	
	
}
