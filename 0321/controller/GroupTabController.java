package team1.togather.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import team1.togather.domain.GroupTab;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.fileset.Path;
import team1.togather.service.GroupTabService;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("groupTab")
public class GroupTabController {
	private GroupTabService groupTabService;

	@GetMapping("groupList.do")
	public ModelAndView list() {
		List<GroupTab> list = groupTabService.selectAllS();
		ModelAndView mv = new ModelAndView("groupTab/groupList", "list", list);
		return mv;
	}
	@GetMapping("myGroup.do")
	public ModelAndView myGroup(MemInGroup memInGroup) {
		List<GroupTab> list = groupTabService.myGroup(memInGroup);
		List<Long> groupMemberCount = new ArrayList<>();
		for(int i =0;i<list.size();i++) {
			groupMemberCount.add(groupTabService.groupMemberCount(list.get(i).getGseq()));
		}
		List<Member> namelist = groupTabService.selectAllname();
		ModelAndView mv = new ModelAndView("groupTab/myGroup", "list", list);
		mv.addObject("groupMemberCount", groupMemberCount);
		mv.addObject("namelist", namelist);
		return mv;
	}
	@GetMapping("groupInfo.do")
	public ModelAndView groupInfo(long gseq,MemInGroup memInGroup) {
		GroupTab groupInfo = groupTabService.selectByGSeqS(gseq);
		Long groupMemberCount = groupTabService.groupMemberCount(gseq);
		Member groupMemberName = groupTabService.groupInfoMemberName(gseq);
		List<Map<String,String>> memInGroupName = groupTabService.memInGroupName(memInGroup);
		Long memInGroupCheck = groupTabService.memInGroupCheck(memInGroup);
		System.out.println("memInGroupName: "+memInGroupName);
		ModelAndView mv = new ModelAndView("groupTab/groupInfo", "groupInfo", groupInfo);
		mv.addObject("groupMemberCount", groupMemberCount);
		mv.addObject("groupMemberName", groupMemberName);
		mv.addObject("memInGroupCheck",memInGroupCheck);
		mv.addObject("memInGroupName",memInGroupName);

		return mv;
	}
	@GetMapping("groupCreate.do")
	public String groupCreate() {
		return "groupTab/groupCreate";
	}
	@PostMapping("groupCreate.do")
	public String groupCreate(GroupTab groupTab,HttpSession session) {
		String fname = null;
		MultipartFile uploadFile = groupTab.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String ofname = uploadFile.getOriginalFilename(); //파일의 원본이름
			String ext = FilenameUtils.getExtension(ofname); //파일의 확장자 구하기
			
			UUID uuid = UUID.randomUUID(); //UUID 구하기 -> 뭔지 잘 모르겠음. //아마 저장할 때 이름 겹치지않게 하려고 랜덤으로 이름을 부여하는 용도?...
			fname = ofname + uuid + "." + ext;
			try {
				uploadFile.transferTo(new File(Path.FILE_STORE + fname));
			}catch(IOException ie) {}
			groupTab.setFname(fname);
		}
		groupTabService.insertS(groupTab);
		GroupTab g = groupTabService.insertGroupInfo(groupTab);
		Member m =(Member)session.getAttribute("m");
		return "redirect:groupInfo.do?gseq="+g.getGseq()+"&mnum="+m.getMnum();	
	}
	@GetMapping("groupDelete.do")
	public String groupDelete(long gseq) {
		groupTabService.memInGroupDelete(gseq);
		groupTabService.deleteS(gseq);
		return "redirect:/";
	} 
	@PostMapping("groupUpdatecheck")
	@ResponseBody
	public Long groupUpdatecheck(MemInGroup memInGroup) {
		//0=모임장 1=운영진 2=일반
		Long grade = groupTabService.grade(memInGroup);
		System.out.println("grade : "+ grade);
		//ModelAndView mv = new ModelAndView("groupTab/groupUpdate", "updateList", updateList);
		if(grade ==null) {//가입안한 사람
			grade=(long) 3;
			return grade;
		}else {	
			if(grade==0 || grade ==1) {//모임장이거나 운영자
				return grade;
			}else {//일반회원
				return grade;
			}
		}
	}
	@PostMapping("groupDeletecheck")
	@ResponseBody
	public Long groupDeletecheck(MemInGroup memInGroup) {
		//0=모임장 1=운영진 2=일반
		Long grade = groupTabService.grade(memInGroup);
		System.out.println("grade : "+ grade);
		if(grade ==null) {//가입안한 사람
			System.out.println("널일때"+grade);
			grade=(long) 3;
			return grade;
		}else {	
			return grade;
		}
	}
	@GetMapping("groupUpdate.do")
	public ModelAndView groupUpdate(long gseq) {
		GroupTab updateList = groupTabService.selectByGSeqS(gseq);
		ModelAndView mv = new ModelAndView("groupTab/groupUpdate", "updateList", updateList);
		return mv;
		
	}
	@PostMapping("groupUpdate.do")
	public String groupUpdate(GroupTab groupTab, HttpServletRequest request) {
		long gseq = groupTab.getGseq();
		log.info("groupUpdate_gseq: " + gseq + "groupUpdate_groupTab: " + groupTab);
		
		groupTabService.updateS(groupTab);
		
		return "redirect:groupInfo.do?gseq="+gseq;
	}
	@PostMapping("memInGroup")
	@ResponseBody
	public String memInGroup(MemInGroup memInGroup,HttpSession session) {
		groupTabService.memInGroup(memInGroup);
		return "ok";
	}
	@PostMapping("groupQuit")
	@ResponseBody
	public String groupQuit(MemInGroup memInGroup,long gseq) {
		System.out.println("groupQuit"+memInGroup);
		List<Map<String,String>> memInGroupName = groupTabService.memInGroupName(memInGroup);
		System.out.println("memInGroupName: "+memInGroupName);
		groupTabService.groupQuit(memInGroup);
		Long groupMemberCount = groupTabService.groupMemberCount(gseq);
		System.out.println("groupMemberCount: "+groupMemberCount);
		String result="";
		if(groupMemberCount==0) {
			groupTabService.memInGroupDelete(gseq);
			groupTabService.deleteS(gseq);
			result="0";
		}else {
			result="1";
		}
		System.out.println("result: "+result);
		return result;
	}
}