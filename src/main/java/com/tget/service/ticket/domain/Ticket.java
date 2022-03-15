package com.tget.service.ticket.domain;

import java.sql.Date;

import com.tget.service.event.domain.Event;
import com.tget.service.user.domain.User;

public class Ticket {
	
		///F
		private int ticketNo;
		private Event event;
		private User seller;
		private int amount;		
		private int price;
		private String type;
		private String code;
		private String seat;
		private String options;
		private Date regDate;
		private String ticketImage;	
		private String checkCode;
		private int couponNo;
		private String couponCode;
		
		public Ticket() {
			// TODO Auto-generated constructor stub
		}
		
		//M
		public int getTicketNo() {
			return ticketNo;
		}
		public void setTicketNo(int ticketNo) {
			this.ticketNo = ticketNo;
		}
		public Event getEvent() {
			return event;
		}
		public void setEvent(Event event) {
			this.event = event;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}
		public User getSeller() {
			return seller;
		}
		public void setSeller(User seller) {
			this.seller = seller;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		public String getSeat() {
			return seat;
		}
		public void setSeat(String seat) {
			this.seat = seat;
		}
		public String getOptions() {
			return options;
		}
		public void setOptions(String options) {
			this.options = options;
		}
		public Date getRegDate() {
			return regDate;
		}
		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}
		public String getTicketImage() {
			return ticketImage;
		}
		public void setTicketImage(String ticketImage) {
			this.ticketImage = ticketImage;
		}
		public String getCheckCode() {
			return checkCode;
		}
		public void setCheckCode(String checkCode) {
			this.checkCode = checkCode;
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
		@Override
		public String toString() {
			return "Ticket [ticketNo=" + ticketNo + ", event=" + event + ", amount=" + amount + ", seller=" + seller
					+ ", price=" + price + ", type=" + type + ", code=" + code + ", seat=" + seat + ", options="
					+ options + ", regDate=" + regDate + ", ticketImage=" + ticketImage + ", checkCode=" + checkCode
					+ ", couponNo=" + couponNo + ", couponCode=" + couponCode + "]";
		}
		
		
		
		
}
