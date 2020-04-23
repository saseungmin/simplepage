package com.study.free.web;


import java.net.URLDecoder;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.common.exception.BizDuplicateException;
import com.study.common.exception.BizNotFoundException;
import com.study.common.exception.BizRegistFailException;
import com.study.common.service.ICommonCodeService;
import com.study.common.vaild.ModifyValid;
import com.study.common.vaild.RegistValid;
import com.study.common.vo.CodeVO;
import com.study.common.vo.ResultMessageVO;
import com.study.free.service.IFreeBoardService;
import com.study.free.vo.FreeBoardVO;
import com.study.free.vo.FreeSearchVO;
import com.study.util.CookieBox;

@Controller
@RequestMapping("/free")
public class FreeBoardController {
	
	private final Logger logger=LoggerFactory.getLogger(getClass());


	//private IFreeBoardService freeBoardService=new FreeBoardServiceImpl();
	@Autowired
	private IFreeBoardService freeBoardService;
	@Autowired
	private ICommonCodeService codeService;
	//public String freeList(HttpServletRequest req, FreeSearchVO searchVO) throws Exception 
	@RequestMapping("/freeList.wow")
	public void freeList(ModelMap model, FreeSearchVO searchVO) throws Exception {
			logger.debug("debug searchVO:{}",searchVO);
			logger.trace("trace~~~~~~~~~~~~~");
			logger.info("trace~~~~~~~~~~~~~");
			logger.warn("trace~~~~~~~~~~~~~");
			logger.error("trace~~~~~~~~~~~~~");
			List<CodeVO> a = codeService.getCodeListByParent("BC00");
			List<FreeBoardVO> list = freeBoardService.getBoardList(searchVO);
			logger.info("list size={}",list.size());
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("list", list);
			model.addAttribute("catList", a);	
			//return "free/freeList";
	
	   }
	
	
	@RequestMapping(value = "/freeView.wow" ,method = RequestMethod.GET , params = "boNum")
	public String process(HttpServletRequest req, HttpServletResponse resp, @RequestParam("boNum")int num) throws Exception {
		// 현재 글을 읽지 않았다면 조회수 증가
		try {
			FreeBoardVO board = freeBoardService.getBoard(num);
			CookieBox box=new CookieBox(req);
			String readBoard=box.getValue("free"); //23|2|1|
			if(readBoard==null)readBoard="";
			String pat="\\b"+num+"\\b";
			if(! Pattern.compile(pat).matcher(readBoard).find()){			
				freeBoardService.increaseHit(board.getBoNum());		
				// 쿠키에 다시 저장 : "23|2|1|45|"
				Cookie cookie=CookieBox.createCookie("free", readBoard+num+"|");
				resp.addCookie(cookie);
			}
			req.setAttribute("board", board);
			// memberView.jsp 
			// ${mem.memId}<sdsdf?>
			// ${mem.memId}
			// Find :  <input.+?name="(\w+)".+?>
			// Repl : \${mem.$1}
			return "free/freeView";
		} catch (BizNotFoundException e) {
			logger.error("조회 오류 boNum={}",num,e);
			ResultMessageVO message =new ResultMessageVO();
			message.setResult(false).setTitle("조회실패").setMessage("해당 글이 존재하지 않습니다..").setUrl("/free/freeList.wow").setUrlTitle("목록으로");
			req.setAttribute("resultMessage", message);
			return "common/message";
		}
	}

	@RequestMapping(value = "/freeEdit.wow")
	public String freeEdit(int boNum,ModelMap model) throws Exception{
		
		logger.debug("boNum= {}",boNum);
		FreeBoardVO vo=freeBoardService.getBoard(boNum);
		List<CodeVO> a= codeService.getCodeListByParent("BC00");
		
		model.addAttribute("board", vo);
		model.addAttribute("catList", a);
			
		return "free/freeEdit";
		
	}
	
	//@Valid group을 아직 지원하지 않아서, 스프링의 @Validated 에서 지원
	@RequestMapping(value = "/freeModify.wow" ,method = RequestMethod.POST)
	public String freeModify(@ModelAttribute("board")@Validated(value = {ModifyValid.class, Default.class}) FreeBoardVO free
														,BindingResult errors, HttpServletRequest req
														, ModelMap model) throws Exception{

		
		logger.debug("free= {}",free);
		try {
			//free 객채 검증
//			if(StringUtils.isBlank(free.getBoTitle())) {
//				errors.rejectValue("boTitle","","제목은 왜?");
//			}
			if(errors.hasErrors()) {
//				model.addAttribute("free",free);
				model.addAttribute("catList", codeService.getCodeListByParent("BC00"));
				return "free/freeEdit";
			}
			free.setBoIp(req.getRemoteAddr());
			freeBoardService.modifyBoard(free);
			return "redirect:/free/freeList.wow?msg="+URLDecoder.decode("success","utf-8");
		} catch (BizRegistFailException e) {
			
			ResultMessageVO message =new ResultMessageVO();
			message.setResult(false).setTitle("수정실패").setMessage("수정에 실패했습니다.").setUrl("/free/freeList.wow").setUrlTitle("목록으로");
			model.addAttribute("resultMessage", message);
			return "common/message";
		}
		//res>0 ok
		//else fail
	}
	
	@RequestMapping(value = "/freeForm.wow")
	public String freeForm(ModelMap model,HttpSession session) throws Exception {
		//중복 제한 토큰 생성
		String dup_key=UUID.randomUUID().toString();
		session.setAttribute("DUP_SUBMIT_PREVENT",dup_key);
		
		List<CodeVO> a = codeService.getCodeListByParent("BC00");
		model.addAttribute("catList", a);
		model.addAttribute("dup_key", dup_key);
		model.addAttribute("board",new FreeBoardVO());

		// memberView.jsp 
		// ${mem.memId}<sdsdf?>
		// ${mem.memId}
		// Find :  <input.+?name="(\w+)".+?>
		// Repl : \${mem.$1}
		return "free/freeForm";
	}
	
	
	@RequestMapping(value = "/freeRegist.wow", method = RequestMethod.POST)
	public String freeRegist( @ModelAttribute("board")@Validated(value = {RegistValid.class,Default.class}) FreeBoardVO free
														,BindingResult errors,  ModelMap model
														, HttpSession session,HttpServletRequest req 
														,@RequestParam("dup_key") String p_dup_key) throws Exception {
		//중복 제한 토큰 생성

		// memberView.jsp 
		// ${mem.memId}<sdsdf?>
		// ${mem.memId}
		// Find :  <input.+?name="(\w+)".+?>
		// Repl : \${mem.$1}
		
		if(errors.hasErrors()) {
			return "free/freeForm";
		}
		String s_dup_key=(String)session.getAttribute("DUP_SUBMIT_PREVENT"); 
		
		
		 if(p_dup_key==null || p_dup_key.isEmpty()){
//			 resp.sendRedirect(req.getContextPath()+"/");
			return "redirect:/"; //메소드에서 빠져나감 서블릿 서비스 메소드에서
		}else{
			if(s_dup_key==null || !s_dup_key.equals(p_dup_key)){ 
				ResultMessageVO message =new ResultMessageVO();
				message.setResult(false).setTitle("중복등록").setMessage("새롭게 작성하여 주세요").setUrl("/free/freeForm.wow").setUrlTitle("새글등록");
				model.addAttribute("resultMessage", message);
				return "common/message";

			}
		}
		
		 free.setBoIp(req.getRemoteAddr());			
		try {
			
			freeBoardService.registBoard(free);
			
			
			session.removeAttribute("DUP_SUBMIT_PREVENT");
			return "redirect:/free/freeView.wow?boNum="+free.getBoNum();
		}catch (BizDuplicateException e) {
			ResultMessageVO message =new ResultMessageVO();
			message.setResult(false).setTitle("등록실패")
															.setMessage("해당 키가 중복되었습니다. 다른 키를 사용해주세요.");
			model.addAttribute("resultMessage", message);
			
			return "common/message";	
			
		}
	}
	
	
	@RequestMapping(value = "/freeDelete.wow" ,method = RequestMethod.POST)
	public String freeDelete(@ModelAttribute("board")@Validated(value = {ModifyValid.class, Default.class}) FreeBoardVO free,BindingResult errors,ModelMap model) throws Exception {
		
			try {
				if(errors.hasErrors()) {
					return "free/freeEdit";
				}
				freeBoardService.removeBoard(free);
				
				ResultMessageVO message =new ResultMessageVO();
				message.setResult(true).setTitle("삭제성공").setMessage("삭제에 성공했습니다.").setUrl("/free/freeList.wow").setUrlTitle("목록으로");
				model.addAttribute("resultMessage", message);
				return "common/message";
			} catch (BizRegistFailException e) {
				ResultMessageVO message =new ResultMessageVO();
				message.setResult(false).setTitle("수정실패").setMessage("수정에 실패했습니다.").setUrl("/free/freeList.wow").setUrlTitle("목록으로");
				model.addAttribute("resultMessage", message);
				return "common/message";			
			}	
			
	}
	
	@RequestMapping("/removeCheckedBoard.wow")
	public String removeCheckedBoard(int[] boNums,ModelMap model) throws Exception{
		
		logger.debug("boNums={}",boNums);
		freeBoardService.removeCheckedBoard(boNums);
		
		ResultMessageVO message =new ResultMessageVO();
		message.setResult(true).setTitle("삭제성공").setMessage("삭제에 성공했습니다.").setUrl("/free/freeList.wow").setUrlTitle("목록으로");
		model.addAttribute("resultMessage", message);
		return "common/message";	
	}
	

}

