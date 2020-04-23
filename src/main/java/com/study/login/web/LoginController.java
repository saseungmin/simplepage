package com.study.login.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.common.exception.BizNotFoundException;
import com.study.common.vo.ResultMessageVO;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private IMemberService memberservice;

	@RequestMapping(value = "/login/login.wow",method = RequestMethod.GET)
	public String login() throws Exception{
		return "login/login";
	}
	
	@RequestMapping(value = "login/login.wow",method = RequestMethod.POST)
	public String loginPost(String userID,String userPass,String idRemember ,HttpSession session,ModelMap model) throws Exception{
		
		ResultMessageVO messageVO = null; 
		
		
		try {
			MemberVO mem=memberservice.getMember(userID);
			if (mem.getMemPass().equals(userPass)) {
				UserVO vo = new UserVO();

				vo.setUserID(mem.getMemId());
				vo.setUserName(mem.getMemName());
				vo.setUserPass(mem.getMemPass());
				vo.setUserRole("MEMBER"); // ADMIN,MANAGER,MEMBER
				//쿠키에 id remember
				
				session.setAttribute("USER_INFO", vo);
				// resp.sendRedirect(req.getContextPath()+"/");
				return "redirect:/";
			} else {
				// 비번 오류
				messageVO = new ResultMessageVO().setResult(false).setTitle("로그인 실패").setMessage("아이디/비밀번호를 확인해 주세요.");
			}
		} catch (BizNotFoundException e) {
			// 아이디가 없거나 회원이 아님.
			messageVO = new ResultMessageVO().setResult(false).setTitle("로그인 실패").setMessage("해당 회원이 존재하지 않습니다.")
					.setUrl("/join/join.wow").setUrlTitle("회원가입");
		}

		model.addAttribute("resultMessage", messageVO);
		return "common/message";
		
		}
	
	@RequestMapping("/login/logout.wow")
	public String logout(HttpSession session, ModelMap model) throws Exception{
		//loginservice.logout(user); 로그아웃관련 기록 등 
		ResultMessageVO messageVO = null; 
		session.invalidate();
		messageVO = new ResultMessageVO().setResult(true).setTitle("로그아웃 성공").setMessage("로그아웃되셨습니다.");
		model.addAttribute("resultMessage", messageVO);
		return "common/message";
	}
	}
