package team1.togather.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team1.togather.domain.Board;
import team1.togather.model.BoardService;

@WebServlet("/board/board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HashMap<String, Long> useduser = new HashMap<>();
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch (m) {
				case "list": list(request, response); break;
				case "content": content(request, response); break;
				case "del" : delete(request, response); break;
				case "input" : input(request, response); break;
				case "insert" : insert(request, response); break;
				case "update" : update(request, response); break;
				case "updateDo" : updateDo(request, response); break;
				case "olist" : olist(request, response); break;
			}
		}else {
			list(request, response);
		}
	}
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();
		int pageAt=1;
		int ps=5;
		if(request.getParameter("pageAt")!=null) {
			pageAt=Integer.parseInt(request.getParameter("pageAt"));
		}
		if(request.getParameter("ps")!=null) {
			ps=Integer.parseInt(request.getParameter("ps"));
		}
		
		System.out.println("board컨트롤러안 pageAt: "+pageAt+" ps: "+ ps);
		ArrayList<Board> blist = service.blistS(pageAt, ps); // db내용을 갖고옴
		ArrayList<Board> wholeblist = service.blistS();
		request.setAttribute("blist", blist); // jsp한테 보내줌 
		request.setAttribute("wholeblist", wholeblist);
		int totalCount = wholeblist.size();
		int totalPage = (int) Math.ceil(totalCount / (double) ps);
		int pageCount = 5;
		int startPage = ((pageAt - 1) / pageCount) * pageCount + 1;
		int endPage = startPage + pageCount - 1;
		// 추가로 조건 설정
		if( totalPage < pageAt) {
			pageAt = totalPage;
		}
		if ( endPage > totalPage) { 
			endPage = totalPage;
		}
		if (ps>totalCount) {
			ps=totalCount;
		}
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageAt", pageAt);
		request.setAttribute("ps", ps);
		String view = "list2.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void olist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();
		String option = request.getParameter("option"); //sql문 where절 왼쪽항
		String ocontent = request.getParameter("ocontent");
		if(option.equals("none") || ocontent.equals("")) {
			String view = "board.do";
			response.sendRedirect(view);
			return;
		}
		System.out.println(option+" olist "+ocontent);
		int pageAt=1;
		int ps=5;
		if(request.getParameter("pageAt")!=null) { 
			pageAt=Integer.parseInt(request.getParameter("pageAt"));
		}
		if(request.getParameter("ps")!=null) {
			ps=Integer.parseInt(request.getParameter("ps"));
		}
		
		ArrayList<Board> blist = service.blistS(option, ocontent); // db내용을 갖고옴
		request.setAttribute("blist", blist); // jsp한테 보내줌
        
		ArrayList<Board> wholeblist = service.blistS();
		request.setAttribute("wholeblist", blist);
		int totalCount = blist.size();
		int totalPage = 1; 
		int pageCount = 5;
		int startPage = ((pageAt - 1) / pageCount) * pageCount + 1;
		int endPage = startPage + pageCount - 1;
		// 추가로 조건 설정
		if( totalPage < pageAt) {
			pageAt = totalPage;
		}
		if ( endPage > totalPage) { 
			endPage = totalPage;
		}
		if (ps>totalCount) {
			ps=totalCount;
		}
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageAt", pageAt);
		request.setAttribute("ps", ps);
		
		String view = "list2.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void content(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();
		Long bnum = Long.parseLong(request.getParameter("bnum"));
		System.out.println("bnum: "+bnum);
		Board board = service.getContentS(bnum);	
		String name = service.getNameByMnumS(board.getMnum());
		System.out.println(name);
		
		HttpSession session  = request.getSession();
		String userphone = "유저폰";
		if((String)session.getAttribute("userphone")!=null) {
		System.out.println("널값확인");
			userphone =(String)session.getAttribute("userphone");
		
		}
		
		request.setAttribute("board", board); // jsp한테 보내줌
		request.setAttribute("name", name);
		String view = "content2.jsp";
		
		
			if(useduser.get(userphone)==bnum) {
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);
				return;
			}
		
		service.updateViewS(bnum);
		useduser.put(userphone, bnum);
		
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();
		Long bnum = Long.parseLong(request.getParameter("bnum"));
		service.deleteS(bnum);
		
		response.sendRedirect("board.do?m=list");
	}
	private void input(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();
		ArrayList<String> cateList = service.getCategoryS();
		
		request.setAttribute("cateList", cateList);
		//response.sendRedirect("input2.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("input2.jsp");
		rd.forward(request, response);
	}
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();
		String btitle = request.getParameter("btitle");
		HttpSession session = request.getSession();		
		long mnum = (Long)session.getAttribute("usermnum");
		String mname = (String)session.getAttribute("userid");
		String bcategory = request.getParameter("bcategory");
		String bcontent = request.getParameter("bcontent");
		String bfile = request.getParameter("file");
		service.insertS(bcategory, btitle, mnum, mname, bcontent, bfile);
		
		response.sendRedirect("board.do");
	}
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();
		Long bnum = Long.parseLong(request.getParameter("bnum"));
		Board board = service.getContentS(bnum);	
		String name = service.getNameByMnumS(board.getMnum());
		
		request.setAttribute("board", board); // jsp한테 보내줌
		request.setAttribute("name", name);
		
		String view = "updateform2.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void updateDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();
		Long bnum = Long.parseLong(request.getParameter("bnum"));
		String bcategory=request.getParameter("bcategory");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String bfile = request.getParameter("bfile");
		String mname = request.getParameter("mname");
		Board board = new Board(bnum, bcategory, btitle, 1, mname, bcontent, bfile, -1, -1, null);
		service.updateDoS(board);
		
		String view = "board.do";
		response.sendRedirect(view);
	}
}
