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

import team1.togather.domain.Reply;
import team1.togather.model.ReplyService;

@WebServlet("/board/reply.do")
public class ReplyController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private static final HashMap<String, Long> useduser = new HashMap<>();
   
    
    public ReplyController() {
        super();
    }

   public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String m =request.getParameter("m");
      if(m!=null) {
         m = m.trim();
         switch(m){
         case "list": list(request,response); break;
			case "input": input(request,response); break;
			case "insert":insert(request,response);break;
			case "update1":update1(request,response);break;
			case "update2":update2(request,response);break;
			case "del":del(request,response);break;
			case "r_like":r_like(request,response);break;
         }
      }else {
         list(request,response);
      }
   }
   private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      ReplyService service = ReplyService.getInstance();
      long bnum = Long.parseLong(request.getParameter("bnum"));
      ArrayList<Reply> list = service.listS(bnum);
      request.setAttribute("rlist", list);
      String view ="board.do?m=content&bnum="+bnum+"";
    
      RequestDispatcher rd =request.getRequestDispatcher(view);
      rd.forward(request, response);

   }
   
   private void input(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{      
         String view ="input.jsp";
         RequestDispatcher rd =request.getRequestDispatcher(view);
         rd.forward(request, response);
   }
   
   private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      ReplyService service =ReplyService.getInstance();
      
      String rcontent = request.getParameter("rcontent");
      long bnum = Long.parseLong(request.getParameter("bnum"));
      HttpSession session = request.getSession();
      
      String mname = (String)session.getAttribute("userid");
      long mnum = (Long)session.getAttribute("usermnum") ;
      
      Reply dto = new Reply(-1L,bnum,mname,mnum,rcontent,-1L, null, -1L);
      boolean flag = service.insertS(dto);
      String view ="reply.do?m=list&bnum="+bnum+"";
      //RequestDispatcher rd =request.getRequestDispatcher(view);
      //rd.forward(request, response);
      response.sendRedirect(view);
   }
   private void update1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ReplyService service =ReplyService.getInstance();
		request.setAttribute("bnum", request.getParameter("bnum"));
		long rseq = Long.parseLong(request.getParameter("rseq"));
		ArrayList<Reply> update1 = service.updateS1(rseq);
		request.setAttribute("rupdate1", update1); 
		String view ="../reply/update1_1.jsp";
		RequestDispatcher rd =request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void update2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ReplyService service =ReplyService.getInstance();
		long bnum = Long.parseLong(request.getParameter("bnum"));
		long rseq = Long.parseLong(request.getParameter("rseq"));
		String content = request.getParameter("content");
		Reply dto = new Reply(rseq,-1,null,-1,content,-1, null, -1);
		boolean flag = service.updateS2(dto); 
		request.setAttribute("flag", flag);
		String view ="reply.do?m=list&bnum="+bnum+""; 
		RequestDispatcher rd =request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	private void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ReplyService service =ReplyService.getInstance();
		long rseq = Long.parseLong(request.getParameter("rseq"));
		long bnum = Long.parseLong(request.getParameter("bnum"));
		service.deleteS(rseq);
		response.sendRedirect("reply.do?m=list&bnum="+bnum+"");
	}
	private void r_like(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ReplyService service =ReplyService.getInstance();
		long bnum = Long.parseLong(request.getParameter("bnum"));
		long rseq = Long.parseLong(request.getParameter("rseq"));
		long r_like = Long.parseLong(request.getParameter("r_like"));
		HttpSession session  = request.getSession();
		String userphone = (String)session.getAttribute("userphone");
		
		int flag = service.like_checkS(userphone, rseq); // -1 : 없는것 확인 , 0 : 찜했다가 취소된상태, 1: 지금찜하고있는상태
		if(flag == -1) {
			System.out.println("flag == -1");
			service.like_insertS(userphone, rseq); 
			r_like++;
		}else if(flag == 1) {
			System.out.println("flag == 1");
			service.like_updateS(userphone, rseq, 0); 
			r_like--;
		}else if(flag ==0) {
			System.out.println("flag == 0");
			service.like_updateS(userphone, rseq, 1);
			r_like++;
		}
		

		//useduser.put(stop, rseq);
		Reply dto = new Reply(rseq,-1,null,-1,null,r_like, null, -1);
		service.r_likeS(dto);
		ArrayList<Reply> list = service.listS(bnum);
		request.setAttribute("rlist", list);
		//String view ="list.jsp";
		//RequestDispatcher rd =request.getRequestDispatcher(view);
		//rd.forward(request, response);
		response.sendRedirect("reply.do?m=list&bnum="+bnum+"");
		
	}
}