package team1.togather.controller;

import static team1.togather.constant.CheckedConstant.*;

import java.util.ArrayList;
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
import team1.togather.domain.Category;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.domain.Message;
import team1.togather.service.MemberService;



@Controller
@AllArgsConstructor
@RequestMapping("/member/")
public class MemberController {
	private MemberService service;
	
	@GetMapping("/joinform.do")
	public ModelAndView join() {
		List<Category> firstCategory = service.firstCategory();
		ModelAndView mv = new ModelAndView("member/join","firstCategory",firstCategory);
		return mv;
	}
	
	@GetMapping("/category")
	@ResponseBody
	public List<Category> category(Category category,long sequence) {

		List<Category> categorys= new ArrayList<>();
		if(sequence==2) {
			categorys = service.secondCategory(category);
			System.out.println("categorys: "+categorys);
		}else if(sequence==3) {
			categorys = service.thirdCategory(category);
			System.out.println("sequence: "+sequence);
		}
		
		return categorys;
	}
	
	
	@RequestMapping("/join")
	@ResponseBody
	public int join(Member member,HttpSession session,String category_first,String category_second,String category_third) {
		System.out.println("member: "+member);
		System.out.println("category_first: "+category_first);
		System.out.println("category_second: "+category_second);
		System.out.println("category_third: "+category_third);
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
		long gseq=meminGroup.getGseq();
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
		mv.addObject("gseq", gseq);
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
			System.out.println("카카오로그인 m: "+m);
			System.out.println("로그인성공");	
		}
		return  kakaologincheck;
	}
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/sendMessageForm")
	public ModelAndView sendMessageForm(Message message,long gseq) {
		System.out.println("gseq: "+gseq);
		System.out.println("message: "+message);
		ModelAndView mv = new ModelAndView("member/sendMessageForm", "message", message);
		mv.addObject("gseq", gseq);
		return mv;
	}
	
	@PostMapping("/sendMessage")
	public String sendMessage(Message message,long gseq) {
		System.out.println("message: "+message);
		service.sendMessage(message);
		String memberInfoBack="";
		memberInfoBack+="redirect:memberInfo?mnum="+message.getFrommnum()+"&gseq="+gseq;
		System.out.println("memberInfoBack: "+memberInfoBack);
		return memberInfoBack;
	}
	
	@GetMapping("/messageList")
	public ModelAndView messageList(long mnum) {
		List<Message> messageList = service.messageList(mnum);
		ModelAndView mv = new ModelAndView("member/messageList", "messageList", messageList);
		return mv;
	}
}