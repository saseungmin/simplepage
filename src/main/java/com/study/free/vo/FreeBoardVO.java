package com.study.free.vo;

import java.io.Serializable;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.study.common.vaild.ModifyValid;
import com.study.common.vaild.RegistValid;

public class FreeBoardVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Min(groups = ModifyValid.class , message = "글번호가 존재하지 않습니다." , value = 1)
	private int boNum;                /* 글번호 */
	
	@NotBlank (message="제목은 필수입니다.")
	@Size(min=3, message="제목은 3글자 이상입니다.")
	private String boTitle;           /* 글제목 */
	
	@NotBlank (groups = RegistValid.class, message="분류는 필수입니다.")
	private String boCategory;        /* 글분류 */
	
	@NotBlank (message = "작성자는 필수입니다.")
	@Pattern (regexp = ".*[가-힣].*" ,message = "한글이 없습니다.")
	private String boWriter;          /* 글 작성자  */
	
	@NotBlank (message="패스워드는 필수입니다.")
	@Size(min=3,max = 20, message="패스워드는 4글자 이상입니다. 20글자 이하 입니다.")
	private String boPass;            /* 패스워드 */
	private String boContent;         /*  */
	private String boIp;              /*  */
	private int boHit;                /*  */
	private String boRegDate;         /*  */
	private String boModDate;         /*  */
	private String boDelYn;           /*  */
	
	private String boCateName;
	
	public String getBoCateName() {
		return boCateName;
	}
	public void setBoCateName(String boCateName) {
		this.boCateName = boCateName;
	}
	public int getBoNum() {
		return boNum;
	}
	public void setBoNum(int boNum) {
		this.boNum = boNum;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}
	public String getBoCategory() {
		return boCategory;
	}
	public void setBoCategory(String boCategory) {
		this.boCategory = boCategory;
	}
	public String getBoWriter() {
		return boWriter;
	}
	public void setBoWriter(String boWriter) {
		this.boWriter = boWriter;
	}
	public String getBoPass() {
		return boPass;
	}
	public void setBoPass(String boPass) {
		this.boPass = boPass;
	}
	public String getBoContent() {
		return boContent;
	}
	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}
	public String getBoIp() {
		return boIp;
	}
	public void setBoIp(String boIp) {
		this.boIp = boIp;
	}
	public int getBoHit() {
		return boHit;
	}
	public void setBoHit(int boHit) {
		this.boHit = boHit;
	}
	public String getBoRegDate() {
		return boRegDate;
	}
	public void setBoRegDate(String boRegDate) {
		this.boRegDate = boRegDate;
	}
	public String getBoModDate() {
		return boModDate;
	}
	public void setBoModDate(String boModDate) {
		this.boModDate = boModDate;
	}
	public String getBoDelYn() {
		return boDelYn;
	}
	public void setBoDelYn(String boDelYn) {
		this.boDelYn = boDelYn;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);

	}
	
}