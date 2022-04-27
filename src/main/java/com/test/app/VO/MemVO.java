package com.test.app.VO;

public class MemVO {

	private String mid;
	private String password;
	private String name;
	private String phone;
	private String hope_Area;
	private String sex;
	private int report;
	

	public String getHope_Area() {
		return hope_Area;
	}
	public void setHope_Area(String hope_Area) {
		this.hope_Area = hope_Area;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	@Override
	public String toString() {
		return "MemVO [mid=" + mid + ", password=" + password + ", name=" + name + ", phone=" + phone + ", Hope_Area="
				+ hope_Area + ", sex=" + sex + ", report=" + report + "]";
	}


	
	
}
