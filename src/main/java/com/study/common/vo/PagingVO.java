package com.study.common.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class PagingVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	int curpage;//현재 페이지 번호
	int recordCountPerPage; //한 페이지당 레코드 수
	int firstRow; //페이징 SQL의 조건절에 사용되는 시작 번호
	int lastRow; //페이징 SQL의 조건절에 사용되는 마지막 번호
	int totalRowCount; //총 레코드 건수
	int totalPageCount;
	
	int pageSize;
	int firstPage;
	int lastPage;
	
	public void setting() {
		if(curpage<1)curpage=1;
		if(recordCountPerPage<1) recordCountPerPage=10;
		if(pageSize<1)pageSize=5;
		
		firstRow=((curpage-1)*recordCountPerPage)+1;
		lastRow=curpage*recordCountPerPage;
		totalPageCount=(totalRowCount-1)/recordCountPerPage+1;
		//firstPage,lastPage 계산
		firstPage= ((curpage-1)/pageSize)*pageSize+1;
		lastPage=firstPage+pageSize-1;
		if(lastPage>totalPageCount) {
			lastPage=totalPageCount;
		}
	}

	public int getCurpage() {
		return curpage;
	}

	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getLastRow() {
		return lastRow;
	}

	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.DEFAULT_STYLE);
	}
	
}
