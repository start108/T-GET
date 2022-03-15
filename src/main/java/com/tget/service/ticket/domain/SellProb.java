package com.tget.service.ticket.domain;

public class SellProb {
	
	private int highPrice;
	private int avgPrice;
	private int lowPrice;
	private int totalCount;
	private int sellProb;
		
	public SellProb() {
		// TODO Auto-generated constructor stub
	}

	public SellProb(int highPrice, int lowPrice, int totalCount) {
		// TODO Auto-generated constructor stub
		this.highPrice = highPrice;
		this.lowPrice = lowPrice;
		this.totalCount = totalCount;		
		
	}

	
	public int getHighPrice() {
		return highPrice;
	}

	public void setHighPrice(int highPrice) {
		this.highPrice = highPrice;
	}

	public int getLowPrice() {
		return lowPrice;
	}

	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getSellprob() {
		return sellProb;
	}

	public void setSellprob(int sellprob) {
		this.sellProb = sellprob;
	}
	
	public int getAvgPrice() {
		return avgPrice;
	}

	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}

	@Override
	public String toString() {
		return "SellProb [highPrice=" + highPrice + ", avgPrice=" + avgPrice + ", lowPrice=" + lowPrice
				+ ", totalCount=" + totalCount + ", sellprob=" + sellProb + "]";
	}
	
	

}
