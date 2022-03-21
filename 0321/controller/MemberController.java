package team1.togather.controller;

import static team1.togather.constant.CheckedConstant.*;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import team1.togather.domain.Block;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.service.MemberService;



@Controller
@AllArgsConstructor
@RequestMapping("/member/")
public class MemberController {
	private MemberService service;
	
	@GetMapping("/joinform.do")
	public String join() {
		return "member/join";
	}
	
	
	@PostMapping("/join")
	@ResponseBody
	public int join(Member member,HttpSession session) {
		int join = service.join(member);
		System.out.println("join :"+join);
		if(join==YES_JOIN) {
			Member m = service.login(member);
			session.setAttribute("m", m);
		}
		return join;
	}
	
	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/memberInfo")
	public ModelAndView memberInfo(MemInGroup meminGroup,HttpSession session) {
		Member memberInfo = service.memberInfo(meminGroup);
		List<String> blockedNameList = service.blockedNameList(session);
		String blockedCheck="";
		if(blockedNameList.size()!=0) {
			for(int i =0;i<blockedNameList.size();i++) {
				if(blockedNameList.get(i).equals(memberInfo.getMname())) {
					blockedCheck="차단한 회원입니다";
				}
			}
		}
		ModelAndView mv = new ModelAndView("/member/memberInfo", "memberInfo", memberInfo);
		mv.addObject("blockedCheck", blockedCheck);
		return mv;
	}
	
	@PostMapping("/blocking")
	@ResponseBody
	public int blocking(Block block) {
		service.blocking(block);
		System.out.println("block: "+block);
		return 1;
	}
	@PostMapping("/blockingCancel")
	@ResponseBody
	public int blockingCancel(Block block) {
		service.blockingCancel(block);
		System.out.println("block: "+block);
		return 1;
	}
	@PostMapping("/login")
	@ResponseBody
	public int logincheck(Member member,HttpSession session) {
		int logincheck = service.logincheck(member);
		if(logincheck==YES_ID_PWD) {
			Member m = service.login(member);
			session.setAttribute("m", m);
		}
		return logincheck;
	}
	@PostMapping("/kakaologin")
	@ResponseBody
	public int kakaologincheck(Member member,HttpSession session) {
		int kakaologincheck = service.kakaologincheck(member);
		if(kakaologincheck==YES_ID_PWD) {
			Member m = service.kakaologin(member);
			session.setAttribute("m", m);
			System.out.println("로그인성공");	
		}
		return  kakaologincheck;
	}
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		String logout="";
		logout+="<script>";
		logout+="history";
		logout+="</script>";
		return "redirect:/";
	}
}