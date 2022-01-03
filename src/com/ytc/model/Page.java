package com.ytc.model;

import java.util.ArrayList;
import java.util.List;


public class Page{

	private int from;

	private int currentPage; // 当前页
	private int lastPage; 

	private int totalRows; 
	private int pageSize = 10; // 每页条数

	private List<? extends Object> list = new ArrayList<>();  //当前页的数据
	
	public Page(int currentPage, int totalRows) {
		this.totalRows = totalRows;
		this.currentPage = currentPage;
		this.lastPage = totalRows / pageSize;
		this.from = this.pageSize*(this.currentPage - 1);
	}

	public Page() {
	}

	public Page(int from, int currentPage, int lastPage, int totalRows, int pageSize, List<? extends Object> list) {
		this.from = from;
		this.currentPage = currentPage;
		this.lastPage = lastPage;
		this.totalRows = totalRows;
		this.pageSize = pageSize;
		this.list = list;
	}

	public int getFrom() {
		return this.from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	public int getCurrentPage() {
		return this.currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLastPage() {
		return this.lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getTotalRows() {
		return this.totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<? extends Object> getList() {
		return this.list;
	}

	public void setList(List<? extends Object> list) {
		this.list = list;
	}

	public Page from(int from) {
		setFrom(from);
		return this;
	}

	public Page currentPage(int currentPage) {
		setCurrentPage(currentPage);
		return this;
	}

	public Page lastPage(int lastPage) {
		setLastPage(lastPage);
		return this;
	}

	public Page totalRows(int totalRows) {
		setTotalRows(totalRows);
		return this;
	}

	public Page pageSize(int pageSize) {
		setPageSize(pageSize);
		return this;
	}

	public Page list(List<? extends Object> list) {
		setList(list);
		return this;
	}

	@Override
	public String toString() {
		return "{" +
			" from='" + getFrom() + "'" +
			", currentPage='" + getCurrentPage() + "'" +
			", lastPage='" + getLastPage() + "'" +
			", totalRows='" + getTotalRows() + "'" +
			", pageSize='" + getPageSize() + "'" +
			", list='" + getList() + "'" +
			"}";
	}
}

	