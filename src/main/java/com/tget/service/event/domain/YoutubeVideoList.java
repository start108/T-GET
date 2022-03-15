package com.tget.service.event.domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class YoutubeVideoList {
	///F
	private String kind;
	private String etag;
	private String nextPageToken;
	private String prevPageToken;
	private String regionCode;
	private Map<String,Object> pageInfo = new HashMap<String,Object>(){
		private Integer totalResults;
		private Integer resultsPerPage;

		public Integer getTotalResults() {
			return totalResults;
		}
		public void setTotalResults(Integer totalResults) {
			this.totalResults = totalResults;
		}
		public Integer getResultsPerPage() {
			return resultsPerPage;
		}
		public void setResultsPerPage(Integer resultsPerPage) {
			this.resultsPerPage = resultsPerPage;
		}		
	};
	private Integer totalResults;
	private Integer resultsPerPage;
	private List<YoutubeVideo> items;
	
	///C
	public YoutubeVideoList() {
	}

	///M
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getEtag() {
		return etag;
	}
	public void setEtag(String etag) {
		this.etag = etag;
	}
	public String getNextPageToken() {
		return nextPageToken;
	}
	public void setNextPageToken(String nextPageToken) {
		this.nextPageToken = nextPageToken;
	}
	public String getPrevPageToken() {
		return prevPageToken;
	}
	public void setPrevPageToken(String prevPageToken) {
		this.prevPageToken = prevPageToken;
	}
	public String getRegionCode() {
		return regionCode;
	}
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}
	
	public Map<String,Object> getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(Map<String,Object> pageInfo) {
		this.pageInfo = pageInfo;
		setTotalResults((Integer)pageInfo.get("totalResults"));
		setResultsPerPage((Integer)pageInfo.get("resultsPerPage"));
	}
	public Integer getTotalResults() {
		return totalResults;
	}
	public void setTotalResults(Integer totalResults) {
		this.totalResults = totalResults;
	}
	public Integer getResultsPerPage() {
		return resultsPerPage;
	}
	public void setResultsPerPage(Integer resultsPerPage) {
		this.resultsPerPage = resultsPerPage;
	}
	
	public List<YoutubeVideo> getItems() {
		return items;
	}
	public void setItems(List<YoutubeVideo> items) {
		this.items = items;
	}
	
	
	public String toString() {
		return "[kind] "+kind+", [etag]"+etag+", [nextPageToken]"+nextPageToken+", [prevPageToken]"+prevPageToken+", [regionCode]"+regionCode
	+", [pageInfo]"+pageInfo+", [totalResults]"+totalResults+", [resultsPerPage]"+resultsPerPage+", [items]"+items;
	}
}
