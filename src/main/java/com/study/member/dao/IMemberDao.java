package com.study.member.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;

@Mapper
public interface IMemberDao {
	/**
	  * 회원테이블 목록 조회
	 * @return 회원목록
	 * @throws SQLException
	  */
	public List<MemberVO> getMemberList(MemberSearchVO searchVO) throws SQLException;
	
	/**
	  * 
	  * 요청한 <b>회원아이디</b>에 해당하는 회원을 조회한다.
	 * @param memId
	 * @return MemberVO
	 * @throws SQLException
	  */
	public MemberVO getMemberVO(String memId) throws SQLException;
	
	/**
	  * 회원등록
	 * @param member
	 * @return int
	 * @throws SQLException
	  */
	public int insertMember(MemberVO member) throws SQLException;
	
	/**
	  * 회원 정보 수정<br>
	  * 비밀번호 정보는 수정되지 않음
	 * @param member
	 * @return int
	 * @throws SQLException
	 */
	public int updateMember(MemberVO member) throws SQLException;
	
	/**
	  * 회원탈퇴<br>
	  * 회원테이블의 mem_del_yn을  "Y"로 변경
	 * @param member
	 * @return int
	 * @throws SQLException
	 */
	public int deleteMember(MemberVO member) throws SQLException;
	
	public int getMemberCount(MemberSearchVO searchVO)throws SQLException;

}
