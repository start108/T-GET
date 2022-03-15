package com.tget.service.event.domain;

import java.util.List;
import java.util.Map;

public class StubhubEvent {

	///F
	private String id; //eventId, name�� eventName(display�� �����ؾ���), venueName�� eventLocation
	private String status;
	private String name; //eventName(display�� �����ؾ���)
	private String description;
	private String webURI;
	private String eventDateLocal; //�̺�Ʈ��¥�� �ð�(�� - 2019-07-27T18:00:00+0900)
	private String eventDateUTC;
	private String createdDate;
	private String lastUpdatedDate;
	
	private Map<String, String> venue;
	private String venueId;
	private String venueName; //eventLocation �̺�Ʈ ���
	private String city;
	private String state;
	private String postalCode;
	private String country;
	
	private String timezone;
	
	private List performers;
	private Integer performersId;
	private String performersName; //�⿬�ڸ�
	
	private String locale;
	private String hideEventDate;
	private String hideEventTime;
	
	private Map<String,Object> ancestors;
	private String ancestorsCategory; //ī�װ���(�� - concert)
	
	private String currencyCode;
	private Map<String,String> ticketInfo;
	
	
	private String getCategoryTwoEng;
	private String eventDate;
	private String eventTime;
	private String koName;
	private String koLocation;
	
	///C
	public StubhubEvent() {
	}

	///M
	public String getId() {
		if (id != null) {
			return id.trim();
		}
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getWebURI() {
		return webURI;
	}
	public void setWebURI(String webURI) {
		this.webURI = webURI;
	}
	public String getEventDateLocal() {
		return eventDateLocal;
	}
	public void setEventDateLocal(String eventDateLocal) {
		this.eventDateLocal = eventDateLocal;
		String[] arr = eventDateLocal.split("T");
		setEventDate(arr[0]);
		arr = arr[1].split(":");
		setEventTime(arr[0]+arr[1]);
	}
	public String getEventDateUTC() {
		return eventDateUTC;
	}
	public void setEventDateUTC(String eventDateUTC) {
		this.eventDateUTC = eventDateUTC;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getLastUpdatedDate() {
		return lastUpdatedDate;
	}
	public void setLastUpdatedDate(String lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}
	public Map<String, String> getVenue() {
		return venue;
	}
	public void setVenue(Map<String, String> venue) {
		this.venue = venue;
		setVenueId((String)venue.get("id"));
		setVenueName((String)venue.get("name"));
		setPostalCode((String)venue.get("postalCode"));
		setCity((String)venue.get("city"));
		setState((String)venue.get("state"));
		setCountry((String)venue.get("country"));
	}
	public String getVenueId() {
		return venueId;
	}
	public void setVenueId(String venueId) {
		this.venueId = venueId;
	}
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getTimezone() {
		return timezone;
	}
	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}
	public List getPerformers() {
		return performers;
	}
	public void setPerformers(List performers) {
		this.performers = performers;
		Map<String, Object> temp = null;
//		for (int i = 0; i < performers.size(); i++) {
//			temp = (Map<String, Object>)performers.get(i);
//		}
		temp = (Map<String, Object>)performers.get(0);
		setPerformersId((Integer)temp.get("id"));
		setPerformersName((String)temp.get("name"));
	}
	public Integer getPerformersId() {
		return performersId;
	}
	public void setPerformersId(Integer performersId) {
		this.performersId = performersId;
	}
	public String getPerformersName() {
		return performersName;
	}
	public void setPerformersName(String performersName) {
		this.performersName = performersName;
	}


	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getHideEventDate() {
		return hideEventDate;
	}
	public void setHideEventDate(String hideEventDate) {
		this.hideEventDate = hideEventDate;
	}
	public String getHideEventTime() {
		return hideEventTime;
	}
	public void setHideEventTime(String hideEventTime) {
		this.hideEventTime = hideEventTime;
	}
	public Map<String, Object> getAncestors() {
		return ancestors;
	}
	public void setAncestors(Map<String, Object> ancestors) {
		this.ancestors = ancestors;
		int temp = ((List)ancestors.get("categories")).size();
		List<Map<String,Object>> categoriesMap = ((List)ancestors.get("categories"));
		//String tempCategory = (String)((Map<String,Object>)(((List)ancestors.get("categories")).get(1))).get("name");
		
		if (temp == 1) {
			setAncestorsCategory((String)categoriesMap.get(0).get("name"));
		} else if (temp >= 1){
			setAncestorsCategory((String)categoriesMap.get(1).get("name"));
		}
//		setAncestorsCategory((String)((Map<String,Object>)(((List)ancestors.get("categories")).get(1))).get("name"));		
	}
	
	public void setAncestorsCategory(String ancestorsCategory) {
		this.ancestorsCategory = ancestorsCategory.toLowerCase();
	}
	public String getAncestorsCategory() {
		return ancestorsCategory;
	}
	public String getCurrencyCode() {
		return currencyCode;
	}
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	public Map<String, String> getTicketInfo() {
		return ticketInfo;
	}
	public void setTicketInfo(Map<String, String> ticketInfo) {
		this.ticketInfo = ticketInfo;
	}

	public String getCategoryTwoEng() {
		return getCategoryTwoEng;
	}
	public void setCategoryTwoEng(String getCategoryTwoEng) {
		this.getCategoryTwoEng = getCategoryTwoEng;
	}

	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventTime() {
		return eventTime;
	}
	public void setEventTime(String eventTime) {
		this.eventTime = eventTime;
	}

	/**
	 * @return the getCategoryTwoEng
	 */
	public String getGetCategoryTwoEng() {
		return getCategoryTwoEng;
	}

	/**
	 * @param getCategoryTwoEng the getCategoryTwoEng to set
	 */
	public void setGetCategoryTwoEng(String getCategoryTwoEng) {
		this.getCategoryTwoEng = getCategoryTwoEng;
	}

	/**
	 * @return the koName
	 */
	public String getKoName() {
		return koName;
	}

	/**
	 * @param koName the koName to set
	 */
	public void setKoName(String koName) {
		this.koName = koName;
	}

	/**
	 * @return the koLocation
	 */
	public String getKoLocation() {
		return koLocation;
	}

	/**
	 * @param koLocation the koLocation to set
	 */
	public void setKoLocation(String koLocation) {
		this.koLocation = koLocation;
	}

	public String toString() {
		return "\n "+"[id] " + id+" , [status] "+ status+" , [name] " + name+", [ancestors] "+ancestors+
				" , [description] "+description+" , [webURI] "+webURI+" , [eventDateLocal] " + eventDateLocal+
				" , [eventDateUTC] " + eventDateUTC+" , [createdDate] "+ createdDate+
				" , [lastUpdatedDate] " + lastUpdatedDate+" , [venueId] "+venueId+" , [venueName] " +venueName+
				" , [city] "+city+" , [state] "+state+" , [postalCode] "+postalCode+" , [country] "+country+ 
				" , [timezone] "+timezone+"	 , [performersId] "+performersId+" , [performersName] "+performersName;
	}
}
