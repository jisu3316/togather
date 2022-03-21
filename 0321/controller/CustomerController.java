package team1.togather.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import team1.togather.domain.BoardCriteria;
import team1.togather.domain.PageMaker;
import team1.togather.domain.QandA;
import team1.togather.domain.Qreply;
import team1.togather.service.QandA_Service;

@Controller
@AllArgsConstructor
public class CustomerController {
	private QandA_Service service;
	@GetMapping("/qa")
	public String list(BoardCriteria cri,Model model, HttpServletRequest request) {
		System.out.println("qa컨트롤러안 listpageGET: cri값: " +cri);
		model.addAttribute("list", service.listCri(cri)); // =listPageCri()
		
		if(request.getParameter("page")!=null) {
			String pageAt = request.getParameter("page");
			System.out.println("현재 페이지: "+pageAt);
			cri.setPage(Integer.parseInt(pageAt));
		}
		if(request.getParameter("pageSize")!=null) {
			String pageSize = request.getParameter("pageSize");
			System.out.println("현재 페이지사이즈: "+pageSize);
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
	public ModelAndView qacontent(QandA qanda) {
		qanda = service.qaContent(qanda);
		List<Qreply> qrList = service.qreplyList(qanda);
		ModelAndView mv = new ModelAndView("customer/Q&AContent", "qanda", qanda);
		mv.addObject("qrList", qrList);
		return mv;
	}
	@GetMapping("/qaCreate")
	public String qaCreate() {
		return "customer/Q&AInput";
	}
	
	@PostMapping("/qaCreate")
	public String qaCreate(QandA qanda) {
		System.out.println("qanda: "+qanda);
		service.qaCreate(qanda);
		QandA q = service.createqaInfo(qanda);
		System.out.println(q);
		return "redirect:qaContent?qseq="+q.getQseq();
	}
	
}
