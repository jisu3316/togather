package team1.togather.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import team1.togather.domain.BoardCriteria;
import team1.togather.domain.Member;
import team1.togather.domain.PageMaker;
import team1.togather.domain.QandA;
import team1.togather.domain.QaReply;
import team1.togather.service.QandA_Service;

@Controller
@AllArgsConstructor
public class CustomerController {

	private QandA_Service service;

	@GetMapping("/qa")
	public String list(BoardCriteria cri,Model model, HttpServletRequest request) {
		model.addAttribute("list", service.listCri(cri)); // =listPageCri()
		model.addAttribute("nameList", service.qaNameList());
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			cri.setPage(Integer.parseInt(pageAt));
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			cri.setPageSize(Integer.parseInt(pageSize));
		}
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(service.pageCount()); //calcDate()실행
		
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		return "customer/Q&A";
		//List<QandA> list = service.QAlist();
		//ModelAndView mv = new ModelAndView("customer/Q&A", "list", list);
		//mv.addObject("nameList", service.qaNameList());
		//System.out.println(list);
		//return mv;
	}
	@GetMapping("/qaContent")
	public ModelAndView qacontent(QandA qanda,HttpServletRequest request) {
		qanda = service.qaContent(qanda);
		List<QaReply> qaReply = service.qreplyList(qanda);
		Long qreplyCount = service.qreplyCount(qanda);
		service.views(qanda);
		ModelAndView mv = new ModelAndView("customer/Q&AContent", "qanda", qanda);
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			mv.addObject("page", pageAt);
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			mv.addObject("pageSize", pageSize);
		}
		mv.addObject("qaReply", qaReply);
		mv.addObject("qreplyCount", qreplyCount);
		return mv;
	}
	
	@PostMapping("/qaPwdContent")
	@ResponseBody
	public String qaPwdContent(QandA qanda) {
		qanda = service.pwdQA(qanda);
		if(qanda==null) {
			return "0";
		}else {
			List<QaReply> qrList = service.qreplyList(qanda);
			ModelAndView mv = new ModelAndView("customer/Q&AContent", "qanda", qanda);
			mv.addObject("qrList", qrList);
			return "1";
		}
	}
	
	@GetMapping("/qaCreate")
	public String qaCreate() {
		return "customer/Q&AInput";
	}
	
	@PostMapping("/qaCreate")
	public String qaCreate(QandA qanda) {
		service.qaCreate(qanda);
		QandA q = service.createqaInfo(qanda);
		return "redirect:qaContent?qseq="+q.getQseq()+"&page=1&pageSize=10";
	}
	
	@PostMapping("/qaUpdateCheck")
	@ResponseBody
	public Long qaUpdatecheck(QandA qanda) {
		
		return service.upDateCheck(qanda);
		
	}
	@PostMapping("/qaNextPostCheck")
	@ResponseBody
	public Long qaNextPostCheck(long qseq,Member member) {
		System.out.println("권한: "+member.getAthur());
		Long nextQseq = (long) 0;
		System.out.println("qseq: " +qseq);
		if(member.getAthur()==0) {
			nextQseq=service.nextPost(qseq);
		}else {
			nextQseq=service.nextPostUser(qseq);
		}
		return nextQseq;
		
	}
	
	@PostMapping("/qaPreviousPostCheck")
	@ResponseBody
	public Long previousPost(long qseq,Member member) {
		System.out.println("previousPost시작");
		System.out.println("qanda: " +qseq);
		System.out.println("권한: "+member.getAthur());
		Long previousQseq = (long) 0;
		
		if(member.getAthur()==0) {
			System.out.println("if안");
			previousQseq=service.previousPost(qseq);
			System.out.println("if 안 previousQseq :"+previousQseq);
		}else {
			System.out.println("else안");
			previousQseq=service.previousPostUser(qseq);
			System.out.println("else 안 previousQseq :"+previousQseq);
			System.out.println("else 안 previousQseq :"+qseq);
		}
		System.out.println("previousQseq :"+previousQseq);
		return previousQseq;
		
	}
	
	@GetMapping("/qaUpDate")
	public ModelAndView qaUpDate(QandA qanda) {
		
		qanda = service.qaContent(qanda);
		ModelAndView mv = new ModelAndView("customer/Q&AupDate", "qanda", qanda);
		return mv;
	}
	
	@PostMapping("/qaUpDate")
	public String qaUpDate2(QandA qanda) {
		service.update(qanda);
		return "redirect:qaContent?qseq="+qanda.getQseq();
	}
	
	@RequestMapping("/qaDelete")
	public String qaDelete(QandA qanda) {
		service.delete(qanda);
		return "redirect:qa";
	}
	
	@RequestMapping("/admin/qaReply")
	public String adminQaReply(QaReply qaReply) {
		service.qaReply(qaReply);
		return "redirect:../qaContent?qseq="+qaReply.getQseq();
	}
	
	@RequestMapping("/qaReply")
	public String UserQaReply(QaReply qaReply) {
		service.qaReply(qaReply);
		return "redirect:qaContent?qseq="+qaReply.getQseq();
	}
}
