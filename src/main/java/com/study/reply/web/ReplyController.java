package com.study.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.study.common.exception.BizAccessFailException;
import com.study.common.exception.BizNotFoundException;
import com.study.login.vo.UserVO;
import com.study.reply.service.IReplyService;
import com.study.reply.vo.ReplySearchVO;
import com.study.reply.vo.ReplyVO;

@RestController
public class ReplyController {
	
	private final Logger logger=LoggerFactory.getLogger(getClass());

	@Autowired
	private IReplyService replyService;
	// Map : result, data, count, msg
	// 또는 위 정보를 담는 VO 생성
	
	
	//클라이언트에서 서버한테 줄것 consumes
	//서버가 클라이언트한테 줄것을 알려준다 produces
	@RequestMapping(value="/reply/replyList",produces="application/json; charset=UTF-8")
	public Map<String, Object> replyList(ReplySearchVO searchVO) throws Exception{
		logger.debug("searchVO= {}",searchVO);
		List<ReplyVO> list= replyService.getReplyList(searchVO);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		map.put("count", list.size());

		return map; //reply/replyList
	}
	
	
	@RequestMapping(value="/reply/replyRegist")
	@PostMapping
	public Map<String, Object> replyRegist(ReplyVO reply, HttpServletRequest req, HttpSession session) throws Exception {
		reply.setReIp(req.getRemoteAddr());
		UserVO user=(UserVO)session.getAttribute("USER_INFO");
		reply.setReMemId(user.getUserID());
		replyService.registReply(reply);

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result", true);
		//map.put("data", replyService.getReply(reply.getReNo()));
		map.put("msg", "정상 등록 되었습니다.");
		return map; //reply/replyRegist
	}
	
	
	@RequestMapping(value="/reply/replyRemove")
	public Map<String, Object> replyRemove(ReplyVO reply, HttpSession session) throws Exception {
		UserVO user=(UserVO)session.getAttribute("USER_INFO");
		reply.setReMemId(user.getUserID());
		Map<String, Object> map=new HashMap<String, Object>();
		
		try {
			replyService.removeReply(reply);
			map.put("result", true);
			//map.put("data", replyService.getReply(reply.getReNo()));
			map.put("msg", "정상 삭제 되었습니다.");
			return map; //reply/replyRegist
		} catch (BizNotFoundException e) {
			map.put("result", false);
			//map.put("data", replyService.getReply(reply.getReNo()));
			map.put("msg", "글이 존재하지 않습니다.");
			return map; //reply/replyRegist
		} catch (BizAccessFailException e) {
			map.put("result", false);
			//map.put("data", replyService.getReply(reply.getReNo()));
			map.put("msg", "접근에 거부되었습니다.");
			return map; //reply/replyRegist
		}
		
	}
	
	@RequestMapping(value="/reply/replyModify")
	@PostMapping
	public Map<String, Object> replyModify(ReplyVO reply, HttpServletRequest req, HttpSession session) throws Exception {
		
		UserVO user=(UserVO)session.getAttribute("USER_INFO");
		reply.setReMemId(user.getUserID());
		System.out.println(reply.getReContent());
		Map<String, Object> map=new HashMap<String, Object>();
		
		try {
			replyService.modifyReply(reply);
			map.put("result", true);
			//map.put("data", replyService.getReply(reply.getReNo()));
			map.put("msg", "정상 수정 되었습니다.");
			return map; //reply/replyRegist
		} catch (BizNotFoundException e) {
			map.put("result", false);
			//map.put("data", replyService.getReply(reply.getReNo()));
			map.put("msg", "글이 존재하지 않습니다.");
			return map; //reply/replyRegist
		} catch (BizAccessFailException e) {
			map.put("result", false);
			//map.put("data", replyService.getReply(reply.getReNo()));
			map.put("msg", "접근에 거부되었습니다.");
			return map; //reply/replyRegist
		}
	
	}
}
