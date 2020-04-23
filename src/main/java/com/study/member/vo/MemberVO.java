package com.study.member.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class MemberVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String memId;             /*  */
	private String memPass;           /*  */
	private String memName;           /*  */
	private String memRegno1;         /*  */
	private String memRegno2;         /*  */
	private String memBir;            /*  */
	private String memZip;            /*  */
	private String memAdd1;           /*  */
	private String memAdd2;           /*  */
	private String memHometel;        /*  */
	private String memHp;             /*  */
	private String memMail;           /*  */
	private String memJob;            /*  */
	private String memLike;           /*  */
	private int memMileage;           /*  */
	private String memDelYn;         /*  */
	
	private String memJobNm;
	private String memLikeNm;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemRegno1() {
		return memRegno1;
	}
	public void setMemRegno1(String memRegno1) {
		this.memRegno1 = memRegno1;
	}
	public String getMemRegno2() {
		return memRegno2;
	}
	public void setMemRegno2(String memRegno2) {
		this.memRegno2 = memRegno2;
	}
	public String getMemBir() {
		return memBir;
	}
	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}
	public String getMemZip() {
		return memZip;
	}
	public void setMemZip(String memZip) {
		this.memZip = memZip;
	}
	public String getMemAdd1() {
		return memAdd1;
	}
	public void setMemAdd1(String memAdd1) {
		this.memAdd1 = memAdd1;
	}
	public String getMemAdd2() {
		return memAdd2;
	}
	public void setMemAdd2(String memAdd2) {
		this.memAdd2 = memAdd2;
	}
	public String getMemHometel() {
		return memHometel;
	}
	public void setMemHometel(String memHometel) {
		this.memHometel = memHometel;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public String getMemJob() {
		return memJob;
	}
	public void setMemJob(String memJob) {
		this.memJob = memJob;
	}
	public String getMemLike() {
		return memLike;
	}
	public void setMemLike(String memLike) {
		this.memLike = memLike;
	}
	public int getMemMileage() {
		return memMileage;
	}
	public void setMemMileage(int memMileage) {
		this.memMileage = memMileage;
	}
	public String getMemDelYn() {
		return memDelYn;
	}
	public void setMemDelYn(String memDelYn) {
		this.memDelYn = memDelYn;
	}
	public String getMemJobNm() {
		return memJobNm;
	}
	public void setMemJobNm(String memJobNm) {
		this.memJobNm = memJobNm;
	}
	public String getMemLikeNm() {
		return memLikeNm;
	}
	public void setMemLikeNm(String memLikeNm) {
		this.memLikeNm = memLikeNm;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);

	}
	
	
}
