package com.tget.service.event.domain;

import java.util.List;

public class StubhubSearchList {

	///F
	//private int page; //stubhub�� ������ 'start'��� �׸��� ��(������������)
	//private String query; //stubhub�� ������ 'q'��� �׸��� ��(�˻���)	
	//���� 2���� �׸��� Search �����ο� �ִ°� ���� ��
	
	private int numFound; //�˻� ���, �̺�Ʈ ����
	private List<StubhubEvent> events; 
	//�̺�Ʈ���� ��� ����Ʈ(default�� 10��. ����� 10�� �̸��� ���, �ִ� �� ��ŭ��...)

	
	///C
	public StubhubSearchList() {
	}

	///M
//	public int getPage() {
//		return page;
//	}
//	public void setPage(int page) {
//		this.page = page;
//	}
//	public String getQuery() {
//		return query;
//	}
//	public void setQuery(String query) {
//		this.query = query;
//	}
	public int getNumFound() {
		return numFound;
	}
	public void setNumFound(Integer numFound) {
		this.numFound = numFound;
	}
	public List<StubhubEvent> getEvents() {
		return events;
	}
	public void setEvents(List<StubhubEvent> events) {
		this.events = events;
	}

	public String toString() {
		return "[StubhubSearchList] \nnumFound : "+numFound+"\n events : "+events;
	}
}
