package com.study.member.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.study.common.vo.PagingVO;

public class MemberSearchVO extends PagingVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String searchJob; //분류
	private String searchType; //검색 구분
	private String searchWord; //검색어
	

	
	public String getSearchJob() {
		return searchJob;
	}

	public void setSearchJob(String searchJob) {
		this.searchJob = searchJob;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.DEFAULT_STYLE);
	}
	
}
