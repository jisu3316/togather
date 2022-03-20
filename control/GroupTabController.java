package team1.togather.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import team1.togather.domain.FileSet;
import team1.togather.domain.Gathering;
import team1.togather.domain.GroupTab;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.domain.WishList;
import team1.togather.model.BoardService;
import team1.togather.model.GroupTabService;
import team1.togather.model.MemInGroupService;

@WebServlet("/group/groupTab.do")
public class GroupTabController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
				case "groupList": groupList(request, response); break;
				case "groupInfo": groupInfo(request, response); break;
				case "groupInput": groupInput(request, response); break;
				case "groupInsert": groupInsert(request, response); break;
				case "groupGetUpdate": groupGetUpdate(request, response); break;
				case "groupUpdate": groupUpdate(request, response); break;
				case "groupDelete": groupDelete(request, response); break;
				
				case "gatheringList": gatheringList(request, response); break;
				case "gatheringInput": gatheringInput(request, response); break;
				case "gatheringInsert": gatheringInsert(request, response); break;
				
				case "gatheringInfo": gatheringInfo(request, response); break;
				
				case "gatheringDelete": gatheringDelete(request, response); break;
				case "gatheringGetUpdate": gatheringGetUpdate(request, response); break;
				case "gatheringUpdate": gatheringUpdate(request, response); break;
				case "wish": wish(request, response); break;
				case "wishlist": wishlist(request, response); break;
				case "wishdelete": wishdelete(request, response); break;
			}
		}else {
			response.sendRedirect("../");
		}
	}
	private void wish(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		long usermnum = Long.parseLong(request.getParameter("usermnum"));
		long gseq = Long.parseLong(request.getParameter("gSeq"));
		System.out.println("wish안 usermnum: "+ usermnum+" gSeq: "+gseq);
		int flag = service.selectWishListS(usermnum, gseq);
		System.out.println("wish안 flag: "+flag);
		if(flag==-1) {
			service.insertWishListS(usermnum, gseq);
		}else if(flag==1) {
			service.deleteWishList(usermnum, gseq);
		}
		ArrayList<WishList> wlist = service.getWishListsS(usermnum);
		HttpSession session = request.getSession();
		session.setAttribute("wishlist", wlist);
		response.sendRedirect("../");
	}
	private void wishdelete(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		long usermnum = Long.parseLong(request.getParameter("usermnum"));
		long gseq = Long.parseLong(request.getParameter("gSeq"));
		service.wishDelS(usermnum, gseq);
		response.sendRedirect("../");
	}
	private void wishlist(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		long usermnum = Long.parseLong(request.getParameter("usermnum"));
		ArrayList<WishList> wlist = service.getWishListsS(usermnum);
		ArrayList<Long> gseqList = new ArrayList<>();
		ArrayList<GroupTab> glist = new ArrayList<>();
		for(WishList wli: wlist) {
			gseqList.add(wli.getGseq());
		}
		for(Long gsli: gseqList) {
			glist.add(service.getGroupS(gsli));
		}
		HttpSession session = request.getSession(); 
		session.setAttribute("wishlist", wlist);
		session.setAttribute("glist", glist);
		response.sendRedirect("../wishlist/wishlist.jsp");
	}
	private void groupList(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		ArrayList<GroupTab> groupList = service.groupListS();
		request.setAttribute("groupList", groupList);
		
		//String view = "groupList.jsp";
		//RequestDispatcher rd = request.getRequestDispatcher(view);
		//rd.forward(request, response);
	}
	
	private void groupInfo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		//long gSeq = getgSeq(request);
		long gSeq = Long.parseLong(request.getParameter("gSeq"));
		request.setAttribute("groupInfo_gSeq", gSeq);
		ArrayList<GroupTab> groupInfo = service.groupInfoS(gSeq);
		request.setAttribute("groupInfo", groupInfo);
		
		ArrayList<Gathering> gatheringList = service.gatheringListS(gSeq);
		request.setAttribute("gatheringList", gatheringList);

		System.out.println(gSeq);
		
		ArrayList<Member> MemInGroupList = service.MemInGroupListS(gSeq);
		request.setAttribute("MemInGroupList", MemInGroupList);
		
		String view = "groupInfo.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void groupInput(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String userid = (String)request.getParameter("userid");
		BoardService service = BoardService.getInstance();
		ArrayList<String> cateList = service.getCategoryS();
		request.setAttribute("cateList", cateList);
		System.out.println(userid);
		if(userid.equals("null")) {
			System.out.println("인풋안 ");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('로그인한후 이용가능합니다')");
			pw.println("location.href='../'");
			pw.println("</script>");
			pw.close();
			
		}else {
			System.out.println("엘스 ");
			String view = "groupInput.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}
	private void groupInsert(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();		
		//파일 업로드
		String saveDir = FileSet.FILE_DIR;
		File fSaveDir = new File(saveDir);
		if(!fSaveDir.exists()) fSaveDir.mkdirs(); //폴더 없으면 새로 생성
		
		int maxPostSize = 10*1024*1024;
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, saveDir, maxPostSize, "utf-8", policy);
		}catch(IOException ie) {
			System.out.println("파일 업로드 실패" + ie);
		}
		
		String fname = mr.getFilesystemName("fname");
		String ofname = mr.getOriginalFileName("fname");
		System.out.println("업로드 파일 정보: fname: " + fname + ", ofname: " + ofname);
		request.setAttribute("fname", fname);
			
    	HttpSession session = request.getSession(true);
    	long mNum= (Long)session.getAttribute("usermnum");
    	
		//insert정보
    	
		String gLoc = mr.getParameter("gLoc");
		String gName = mr.getParameter("gName");
		String gIntro = mr.getParameter("gIntro");
		String interest = mr.getParameter("interest");
		int limit = Integer.parseInt(mr.getParameter("limit"));
		GroupTab dto = new GroupTab(-1, gLoc, gName, gIntro, interest, limit, null, mNum, fname);
		boolean groupInsert = service.groupInsertS(dto);
		request.setAttribute("groupInsert", groupInsert);
		
		String view = "groupInsert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void groupGetUpdate(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		HttpSession session = request.getSession(true);
		long gSeq = getgSeq(request);
		long mNum=0;
    	if((Long)session.getAttribute("usermnum")==null) {
    		response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('로그인이 필요합니다')");
			pw.println("location.href='groupTab.do?m=groupInfo&gSeq="+gSeq+"'");
			pw.println("</script>");
			pw.close();
    	}else {
    		mNum= (Long)session.getAttribute("usermnum");
			ArrayList<GroupTab> groupGetUpdate = service.groupGetUpdateS(gSeq);
			long listmnum=0;
			for(GroupTab dto : groupGetUpdate) {
				listmnum=dto.getmNum();
			}
			if(listmnum!=mNum) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.println("<script>");
				pw.println("alert('모임장만 수정가능합니다')");
				pw.println("location.href='groupTab.do?m=groupInfo&gSeq="+gSeq+"'");
				pw.println("</script>");
				pw.close(); 
			}else {
				request.setAttribute("groupGetUpdate", groupGetUpdate);
				String view = "groupgetupdate.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);	
			}
    	}
	}
	private void groupUpdate(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		//long gSeq = getgSeq(request);
		long gSeq = Long.parseLong(request.getParameter("gSeq"));
		//request.setAttribute("groupUpdate_gSeq", gSeq);
		
		String saveDir = FileSet.FILE_DIR;
		
		int maxPostSize = 10*1024*1024;
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, saveDir, maxPostSize, "utf-8", policy);
		}catch(IOException ie) {
			System.out.println("파일 업로드 실패" + ie);
		}
		
		String gLoc = mr.getParameter("gLoc");
		String gName = mr.getParameter("gName");
		String gIntro = mr.getParameter("gIntro");
		int limit = Integer.parseInt(mr.getParameter("limit"));
		String fname = mr.getFilesystemName("fname");
			System.out.println("gSeq(Controller) groupUpdate: " + gSeq);
			System.out.println("gName(Controller) groupUpdate: " + gName);
			System.out.println("gIntro(Controller) groupUpdate: " + gIntro);
			System.out.println("gLoc(Controller) groupUpdate: " + gLoc);
			System.out.println("fname(Controller) groupUpdate: " + fname);
		
		GroupTab dto = new GroupTab(gSeq, gLoc, gName, gIntro, limit, fname);
		service.groupUpdateS(dto);
		
		response.sendRedirect("groupTab.do?m=groupInfo&gSeq=" + gSeq);
	}
	private void groupDelete(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		long gSeq = Long.parseLong(request.getParameter("gSeq"));
		HttpSession session = request.getSession(true); 
		long mNum=0;
    	if((Long)session.getAttribute("usermnum")==null) {
    		response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('로그인이 필요합니다')");
			pw.println("location.href='groupTab.do?m=groupInfo&gSeq="+gSeq+"'");
			pw.println("</script>");
			pw.close();
    	}else {
    		mNum = (Long)session.getAttribute("usermnum");
			ArrayList<GroupTab> groupGetUpdate = service.groupGetUpdateS(gSeq);
			long listmnum=0;
			for(GroupTab dto : groupGetUpdate) {
				listmnum=dto.getmNum();
			}
			if(listmnum!=mNum) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.println("<script>");
				pw.println("alert('모임장만 삭제가능합니다')");
				pw.println("location.href='groupTab.do?m=groupInfo&gSeq="+gSeq+"'");
				pw.println("</script>");
				pw.close(); 
			}else {
				mNum= (Long)session.getAttribute("usermnum");
		    	System.out.println("세션:"+(Long)session.getAttribute("usermnum"));
		    	System.out.println("long:"+mNum);
		    	MemInGroupService MemInservice = MemInGroupService.getInstance();
		    	MemInservice.MemInGroupDelS(gSeq);
				service.groupDeleteS(gSeq);		
				response.sendRedirect("../");
			}
    	}
	}
	private void gatheringInput(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		long gSeq =Long.parseLong(request.getParameter("gSeq"));
		GroupTabService service = GroupTabService.getInstance();
		HttpSession session = request.getSession(true);
		
		long mnum=0;
    	if((Long)session.getAttribute("usermnum")==null) {
	    		response.setContentType("text/html;charset=utf-8");
				PrintWriter pw = response.getWriter();
				pw.println("<script>");
				pw.println("alert('로그인이 필요합니다')");
				pw.println("location.href='groupTab.do?m=groupInfo&gSeq="+gSeq+"'");
				pw.println("</script>");
				pw.close();
    	}else {
    			mnum = (Long)session.getAttribute("usermnum");
				System.out.println("엠넘 : "+mnum);
				ArrayList<MemInGroup> MemInGroupList2 = service.MemInGroupListS2(gSeq,mnum);
				if(MemInGroupList2.size()==0) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter pw = response.getWriter();
					pw.println("<script>");
					pw.println("alert('모임에 가입한 사람만 가능합니다.')");
					pw.println("location.href='groupTab.do?m=groupInfo&gSeq="+gSeq+"'");
					pw.println("</script>");
					pw.close();
				}
				else {
					request.setAttribute("MemInGroupList2", MemInGroupList2);	
					request.setAttribute("gatheringInput_gSeq", gSeq);
					String view = "gatheringInput.jsp";
					//response.sendRedirect(view);
					RequestDispatcher rd = request.getRequestDispatcher(view);
					rd.forward(request, response);
				}
    	}
		
	}
	private void gatheringInsert(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		
		long gSeq =Long.parseLong(request.getParameter("gSeq"));
		request.setAttribute("gatheringInsert_gSeq", gSeq);
		
		System.out.println("gatherinsert 안 gseq:"+ gSeq);
		String ga_name = request.getParameter("ga_name");
		String ga_date = request.getParameter("ga_date");
		String time = request.getParameter("time");
		String ga_place = request.getParameter("ga_place");
		String price = request.getParameter("price");
		int ga_limit = getGa_Limit(request);
		Gathering dto = new Gathering(-1, ga_name, ga_date, time, ga_place, price, ga_limit, gSeq);
		System.out.println(ga_name + ga_date + time + ga_place+ price+ ga_limit+", gSeq: " + gSeq);
		request.setAttribute("gatheringInsert", dto);
		service.gatheringInsertS(dto);
		
		response.sendRedirect("groupTab.do?m=groupInfo&gSeq=" + gSeq);
		//String view = "gatheringList.jsp";
		//RequestDispatcher rd = request.getRequestDispatcher(view);
		//rd.forward(request, response);
	}
	private void gatheringList(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		long gSeq = Long.parseLong(request.getParameter("gSeq"));
		System.out.println("gatheringList-gSeq: " + gSeq);
		request.setAttribute("gatheringList_gSeq", gSeq);
		
		GroupTabService service = GroupTabService.getInstance();
		ArrayList<Gathering> gatheringList = service.gatheringListS(gSeq);
		request.setAttribute("gatheringList", gatheringList);
		
		String view = "gatheringList.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void gatheringInfo(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		
		long gSeq = Long.parseLong(request.getParameter("gSeq"));
		System.out.println("C_gatheringInfo_gSeq: " + gSeq);
		request.setAttribute("gatheringInfo_gSeq", gSeq);
		
		long ga_seq = getGa_seq(request);
		System.out.println("C_gatheringInfo의 ga_seq: " + ga_seq);
		//long ga_seq = Long.parseLong(request.getParameter("ga_seq"));
		ArrayList<Gathering> gatheringInfo = service.gatheringInfoS(gSeq, ga_seq);
		request.setAttribute("gatheringInfo", gatheringInfo);
		
		String view = "gatheringInfo.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void gatheringDelete(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		long gSeq = Long.parseLong(request.getParameter("gSeq"));
		//System.out.println("C_gatheringDelete의 gSeq: " + gSeq);
		long ga_seq = getGa_seq(request);
		//System.out.println("C_gatheringDelete의 ga_seq: " + ga_seq);
		service.gatheringDeleteS(ga_seq);
		
		response.sendRedirect("groupTab.do?m=groupInfo&gSeq=" + gSeq); 
		//String view = "groupInfo.jsp";
		//RequestDispatcher rd = request.getRequestDispatcher(view);
		//rd.forward(request, response);
	}
	private void gatheringGetUpdate(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		//long gSeq = getgSeq(request); -1
		//long gSeq = Long.parseLong(request.getParameter("gSeq"));
		//System.out.println("C_gatheringGetUpdate_gSeq: " + gSeq);
		//request.setAttribute("gatheringGetUpdate_gSeq", gSeq);
		
		long ga_seq = getGa_seq(request);
		System.out.println("C_gatheringGetUpdate_ga_seq: " + ga_seq);
		
		ArrayList<Gathering> gatheringGetUpdate = service.gatheringGetUpdateS(ga_seq);
		request.setAttribute("gatheringGetUpdate", gatheringGetUpdate);
		
		String view = "gatheringGetUpdate.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void gatheringUpdate(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		GroupTabService service = GroupTabService.getInstance();
		long gSeq = Long.parseLong(request.getParameter("gSeq"));
		System.out.println("C_gatheringUpdate_gSeq: " + gSeq);
		long ga_seq = Long.parseLong(request.getParameter("ga_seq"));
		System.out.println("C_gatheringUpdate_ga_seq: " + ga_seq);
		String ga_name = request.getParameter("ga_name");
		String ga_place = request.getParameter("ga_place");
		String price = request.getParameter("price");
		int ga_limit = Integer.parseInt(request.getParameter("ga_limit"));
		
		Gathering dto = new Gathering(ga_seq, ga_name, ga_place, price, ga_limit);
		service.gatheringUpdateS(dto);
		
		response.sendRedirect("groupTab.do?m=groupInfo&gSeq=" + gSeq + "&ga_seq=" + ga_seq);
	}
	
	private long getgSeq(HttpServletRequest request){
		long seq = -1;
		String seqStr = request.getParameter("gSeq");
		System.out.println("gSeq: " + seqStr);
		if(seqStr != null){
			seqStr = seqStr.trim();
			if(seqStr.length() != 0){
				try{
					seq = Long.parseLong(seqStr);
					return seq;
				}catch(NumberFormatException nfe){
				}
			}
		}
		return seq;
	}
	private int getGa_Limit(HttpServletRequest request){
		int ga_limit = -1;
		String ga_limitStr = request.getParameter("ga_limit");
		if(ga_limitStr != null){
			ga_limitStr = ga_limitStr.trim();
			if(ga_limitStr.length() != 0){
				try{
					ga_limit = Integer.parseInt(ga_limitStr);
					return ga_limit;
				}catch(NumberFormatException nfe){
				}
			}
		}
		return ga_limit;
	}
	private long getGa_seq(HttpServletRequest request){
		long ga_seq = -1;
		String ga_seqStr = request.getParameter("ga_seq");
		System.out.println("getGa_seq의 ga_seq: " + ga_seqStr);
		if(ga_seqStr != null){
			ga_seqStr = ga_seqStr.trim();
			if(ga_seqStr.length() != 0){
				try{
					ga_seq = Long.parseLong(ga_seqStr);
					return ga_seq;
				}catch(NumberFormatException nfe){
				}
			}
		}
		return ga_seq;
	}
}

