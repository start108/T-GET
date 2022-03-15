package com.tget.service.coupon.domain;

import java.sql.Date;

public class Coupon {

	private int couponNo;
	private String couponCode;
	private String userId;
	private Date couponUseDate;
	private Date couponRegDate;
	private String couponStatement;
	
	public Coupon() {
		// TODO Auto-generated constructor stub
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getCouponUseDate() {
		return couponUseDate;
	}

	public void setCouponUseDate(Date couponUseDate) {
		this.couponUseDate = couponUseDate;
	}

	public Date getCouponRegDate() {
		return couponRegDate;
	}

	public void setCouponRegDate(Date couponRegDate) {
		this.couponRegDate = couponRegDate;
	}

	public String getCouponStatement() {
		return couponStatement;
	}

	public void setCouponStatement(String couponStatement) {
		this.couponStatement = couponStatement;
	}

	@Override
	public String toString() {
		return "coupon [couponNo=" + couponNo + ", couponCode=" + couponCode + ", userId=" + userId + ", couponUseDate="
				+ couponUseDate + ", couponRegDate=" + couponRegDate + ", couponStatement=" + couponStatement + "]";
	}
	

	
}
