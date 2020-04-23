package com.study.member.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.common.exception.BizRegistFailException;
import com.study.common.service.ICommonCodeService;
import com.study.common.vo.CodeVO;
import com.study.common.vo.ResultMessageVO;
import com.study.member.service.IMemberService;
import com.study.member.vo.MemberSearchVO;
import com.study.member.vo.MemberVO;

// @Componemt, @Service, @controller, @mapper

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private ICommonCodeService codeService;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("/memberList.wow")
	public String memberList(@ModelAttribute("searchVO") MemberSearchVO searchVO , ModelMap model) throws Exception{
		
		List<MemberVO> list=memberService.getMemberList(searchVO);
		List<CodeVO> codes=codeService.getCodeListByParent("JB00");
		
		model.addAttribute("list",list);
		model.addAttribute("jobs", codes);
		
		return "member/memberList";
	
	}
	
	@RequestMapping(value = "/memberView.wow", method = RequestMethod.GET,params = "memId")
	public String memberView(HttpServletRequest req, HttpServletResponse resp, @RequestParam("memId")String id) throws Exception{
				
		MemberVO member=memberService.getMember(id);
			req.setAttribute("mem", member);
		// memberView.jsp 
		// ${mem.memId}<sdsdf?>
		// ${mem.memId}
		// Find :  <input.+?name="(\w+)".+?>
		// Repl : \${mem.$1}
		
		return "member/memberView";
	}
	
	@RequestMapping(value="/memberForm.wow")
	public String memberForm(ModelMap model) throws Exception{
		List<CodeVO> a=codeService.getCodeListByParent("JB00");
		List<CodeVO> b=codeService.getCodeListByParent("HB00");

		model.addAttribute("jobs",a);
		model.addAttribute("hobbys",b); 
		
		return "member/memberForm";
	}
	
	@RequestMapping(value="/memberRegist.wow",method = RequestMethod.POST)
	public String memberRegist(MemberVO member,ModelMap model) throws Exception{
		
		try {
			memberService.registMember(member);
			return "redirect://";
		} catch (BizRegistFailException e) {
			ResultMessageVO message =new ResultMessageVO();
			message.setResult(false).setTitle("회원 가입 실패").setMessage("가입에 실패했습니다.").setUrl("/member/memberList.wow").setUrlTitle("목록으로");
			model.addAttribute("resultMessage", message);
			return "common/message";
			
		}
		
	}
	
	@RequestMapping(value="/memberEdit.wow")
	public String memberEdit(String memId, ModelMap model) throws Exception{
		
		MemberVO mem = memberService.getMember(memId);
		model.addAttribute("mem", mem);

		List<CodeVO> a=codeService.getCodeListByParent("JB00");
		List<CodeVO> b=codeService.getCodeListByParent("HB00");

		model.addAttribute("jobs",a);
		model.addAttribute("hobbys",b); 
		return "member/memberEdit";
		
	}
	
	
	@RequestMapping(value="/memberModify.wow",method=RequestMethod.POST)
	public String memberModify(MemberVO member,ModelMap model) throws Exception{
		
		try {
			memberService.modifyMember(member);
			ResultMessageVO message =new ResultMessageVO();
			message.setResult(true).setTitle("회원 수정 성공").setMessage("수정에 성공했습니다.").setUrl("/member/memberList.wow").setUrlTitle("목록으로");
			model.addAttribute("resultMessage", message);
			return "common/message";
		} catch (BizRegistFailException e) {
			ResultMessageVO message =new ResultMessageVO();
			message.setResult(false).setTitle("회원 수정실패").setMessage("수정에 실패했습니다.").setUrl("/member/memberList.wow").setUrlTitle("목록으로");
			model.addAttribute("resultMessage", message);
			return "common/message";
		}

	}
	
	@RequestMapping(value = "/memberDelete.wow", method = RequestMethod.POST)
	public String memberDelete(MemberVO member,ModelMap model) throws Exception {
		
		try {
			memberService.removeMember(member);
			ResultMessageVO message =new ResultMessageVO();
			message.setResult(true).setTitle("회원 삭제 성공").setMessage("삭제에 성공했습니다.").setUrl("/member/memberList.wow").setUrlTitle("목록으로");
			model.addAttribute("resultMessage", message);
			return "common/message";
		}catch (BizRegistFailException e) {
			ResultMessageVO message =new ResultMessageVO();
			message.setResult(false).setTitle("회원 삭제 실패").setMessage("삭제에 실패했습니다.").setUrl("/member/memberList.wow").setUrlTitle("목록으로");
			model.addAttribute("resultMessage", message);
			return "common/message";
		}
		
	}
	
	
	
	

}
