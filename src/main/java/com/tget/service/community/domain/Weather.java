package com.tget.service.community.domain;

public class Weather {
	
	
		private String lat;	//����
		private String lon; //�浵
		private String weather; //����
		private String temp; // �µ�
		private String wind; // ǳ��
		private String clouds; // �帲
		
		
		public String getLat() {
			return lat;
		}
		public void setLat(String lat) {
			this.lat = lat;
		}
		public String getLon() {
			return lon;
		}
		public void setLon(String lon) {
			this.lon = lon;
		}
		public String getWeather() {
			return weather;
		}
		public void setWeather(String weather) {
			this.weather = weather;
		}
		public String getTemp() {
			return temp;
		}
		public void setTemp(String temp) {
			this.temp = temp;
		}
		public String getWind() {
			return wind;
		}
		public void setWind(String wind) {
			this.wind = wind;
		}
		public String getClouds() {
			return clouds;
		}
		public void setClouds(String clouds) {
			this.clouds = clouds;
		}
		@Override
		public String toString() {
			return "Weather [lat=" + lat + ", lon=" + lon + ", weather=" + weather + ", temp=" + temp + ", wind=" + wind
					+ ", clouds=" + clouds + "]";
		}
		
}
		