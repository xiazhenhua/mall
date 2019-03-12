package com.cacro.mall.shopping.model;

import io.swagger.annotations.ApiModel;

@ApiModel
public class Page {
	private int v_pageSize;
	private int current_page;
	private int nextStartPage;
	private String searchName;
	
	public Page(String current_page,String v_pageSize) {
		int pageSize = Integer.valueOf(v_pageSize);
		int currentPage = Integer.valueOf(current_page);
		this.setV_pageSize(pageSize);
		this.setNextStartPage(currentPage * pageSize);
	}
	
	public int getV_pageSize() {
		return v_pageSize;
	}

	public void setV_pageSize(int v_pageSize) {
		this.v_pageSize = v_pageSize;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}

	public int getNextStartPage() {
		return nextStartPage;
	}

	public void setNextStartPage(int nextStartPage) {
		this.nextStartPage = nextStartPage;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

}
