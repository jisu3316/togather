package team1.togather.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import team1.togather.domain.GroupTab;
import team1.togather.domain.Member;
import team1.togather.domain.WishList;
import team1.togather.service.GroupTabService;
import team1.togather.service.MemberService;
import team1.togather.service.WishListService;

@Controller
public class IndexController {
	@Autowired
	private GroupTabService groupTabService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private WishListService wishService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		List<GroupTab> list = groupTabService.selectAllS();
		List<Member> namelist = groupTabService.selectAllname();
		long membercount = memberService.memberCount();
		long groupcount = groupTabService.groupCount();
		
		ModelAndView mv = new ModelAndView("index", "list", list);
		mv.addObject("namelist", namelist);
		mv.addObject("membercount",membercount);
		mv.addObject("groupcount",groupcount);
		return mv;
	}
	@ResponseBody
	@PostMapping("handleWishList")
	public WishList handleWishList(@RequestBody HashMap<String, Object> map) {
	
		return null;
	}
	
}
