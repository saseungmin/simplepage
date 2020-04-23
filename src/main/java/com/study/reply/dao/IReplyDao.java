package com.study.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.reply.vo.ReplySearchVO;
import com.study.reply.vo.ReplyVO;

@Mapper
public interface IReplyDao {

	/**
	 * re_category,re_parent_no 가 설정되어 있어요
	 * @param searchVO
	 * @return
	 */
	public int getReplyCount(ReplySearchVO searchVO);
	
	public List<ReplyVO> getReplyList(ReplySearchVO searchVO);
	
	public ReplyVO getReply(int reNo);
	
	public int insertReply(ReplyVO reply);
	
	public int updateReply(ReplyVO reply);
	
	public int deleteReply(ReplyVO reply);
	
}
