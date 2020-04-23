package com.study.common.sql;

public class CommonSQL {
	
	public final static String PRE_PAGING_ORY="SELECT * FROM ( SELECT a.*, ROWNUM rnum FROM (";
	public final static String POST_PAGING_ORY=" )a where ROWNUM <= ?)b WHERE rnum BETWEEN ? AND ?";
	

}
