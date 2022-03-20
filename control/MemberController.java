package team1.togather.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team1.togather.domain.Member;
import team1.togather.model.MemberService;
import team1.togather.model.*;


@WebServlet("/member/login.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberController() {
        super();
  
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m!=null) {
			m = m.trim();
			switch(m){
			case "join":join(request,response);break;//회원가입
			case "kakaojoin":kakaojoin(request,response);break;//카카오회원가입
			case "login":login(request,response);break;//로그인 창
			case "kakaologin":kakaologin(request,response);break;//카카오로그인 
			case "findpassword":findpassword(request,response);break;//비밀번호찾기
			case "signout":signout(request,response);break;//로그아웃
			case "check":check(request,response);break;//체크박스 
			
			}
		}else {
			response.sendRedirect("../");
		}	
	}
    private void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		MemberService service = MemberService.getInstance();		
		String maddr = request.getParameter("maddr");
		String pfrloc = request.getParameter("pfrloc");
		String mname = request.getParameter("mname");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String category = request.getParameter("category");
		Member dto = new Member(-1,maddr,pfrloc,mname,gender,birth,pwd,email,phone,category,-1);
		System.out.println("-------------------");
		System.out.println(mname);
		System.out.println(birth);
		System.out.println(pwd);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(maddr);
		System.out.println(pfrloc);
		System.out.println(category);
		System.out.println(gender);
		
		
		boolean flag =service.joinS(dto);
		System.out.println(flag);
		if(flag==true) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('회원가입성공')");
			pw.println("opener.parent.location.reload();");
			pw.println("window.close();");
			pw.println("location.href='../'");
			pw.println("</script>");
			pw.close();
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('회원가입실패')");
			pw.println("location.href='join2.jsp'");
			pw.println("</script>");
			pw.close();
		}
	}
    private void kakaojoin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		MemberService service = MemberService.getInstance();		
		String mname = request.getParameter("mname");
		String maddr = request.getParameter("maddr");
		String pfrloc = request.getParameter("pfrloc");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String pwd = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String category = request.getParameter("category");
		System.out.println("카카오로그인:"+mname);
    	System.out.println("카카오로그인:"+email);
		Member dto = new Member(-1,maddr,pfrloc,mname,gender,birth,pwd,email,phone,category,-1);
		System.out.println("-------------------");
		System.out.println("maddr: "+maddr);
		System.out.println("관심지역:"+pfrloc);
		System.out.println("이름: "+mname);
		System.out.println("생일: "+birth);
		System.out.println("비번: "+pwd);
		System.out.println("비번: "+pwd);
		System.out.println("폰: "+phone);
		System.out.println("성: "+gender);
		System.out.println("이메일: "+email);
		System.out.println("category: "+category);
		request.setAttribute("mname",mname);
		boolean flag =service.joinS(dto);
		System.out.println(flag);
		if(flag==true) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('회원가입성공')");
			pw.println("opener.parent.location.reload();");
			pw.println("window.close();");
			pw.println("location.href='../'");
			pw.println("</script>");
			pw.close();
		}else{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			request.setAttribute("mname",mname);
			pw.println("<script>");
			pw.println("alert('회원가입실패')");
			pw.println("location.href='kakaojoin2.jsp'");
			pw.println("</script>");
			pw.close();
		}
	}    
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{			
    	String phone = request.getParameter("phone");
    	System.out.println("처음:"+phone);
    	int email=0;
    	MemberService service = MemberService.getInstance();
    	String pwd = request.getParameter("pwd");
    	try {
    		email=Integer.parseInt(phone);
    		System.out.println("트라이안 이메일: "+email);
    		System.out.println("트라이안 폰: "+phone);
    		Member m = service.loginS(phone);
    		System.out.println("트라이: " +phone);
    		request.setAttribute("m",m);
    		request.setAttribute("pwd",pwd);
    		request.setAttribute("phone",phone);
    		if(m==null) {
    			response.setContentType("text/html;charset=utf-8");
    			PrintWriter pw = response.getWriter();
    			pw.println("<script>");
    			pw.println("alert('아이디가없습니다')");
    			pw.println("location.href='login2.jsp'");
    			pw.println("</script>");
    			pw.close();
    		}else {
    				if(phone.equals(m.getPhone())  && pwd.equals(m.getPwd())) {
		    			HttpSession session = request.getSession(true);
		    			session.setAttribute("userid",m.getMname());
		                session.setAttribute("useraddr",m.getMaddr());
		                session.setAttribute("userpfrloc",m.getPfrloc());
		                session.setAttribute("userphone", m.getPhone());
		                session.setAttribute("userathur", m.getAthur());
		                session.setAttribute("usergender", m.getGender());
		                session.setAttribute("userbirth", m.getBirth());
		                session.setAttribute("userpwd", m.getPwd());
		                session.setAttribute("usermnum", m.getMnum());
		    			System.out.println("1");
    				}
    				String view ="checkphone.jsp";
	    			RequestDispatcher rd =request.getRequestDispatcher(view);
	    			rd.forward(request, response);
    			}
    	}catch(NumberFormatException ne) {	 
    		 Member m = service.loginemailS(phone);
    		 request.setAttribute("m",m);
    		 request.setAttribute("pwd",pwd);
    		 request.setAttribute("phone",phone);
    		 System.out.println("캐치: " +phone);
    		 if(m==null) {
     			response.setContentType("text/html;charset=utf-8");
     			PrintWriter pw = response.getWriter();
     			pw.println("<script>");
     			pw.println("alert('아이디가없습니다')");
     			pw.println("location.href='login2.jsp'");
     			pw.println("</script>");
     			pw.close();
     		}else {
    			if(phone.equals(m.getEmail()) && pwd.equals(m.getPwd())) {
    				HttpSession session = request.getSession(true);
    				session.setAttribute("userid",m.getMname());
    	            session.setAttribute("useraddr",m.getMaddr());
    	            session.setAttribute("userpfrloc",m.getPfrloc());
    	            session.setAttribute("userphone", m.getPhone());
    	            session.setAttribute("userathur", m.getAthur());
    	            session.setAttribute("usergender", m.getGender());
    	            session.setAttribute("userbirth", m.getBirth());
    	            session.setAttribute("userpwd", m.getPwd());
    	            session.setAttribute("userEmail", m.getEmail());
    	            session.setAttribute("usermnum", m.getMnum());
    				System.out.println("1");
    				}
    			String view ="checkemail.jsp";
				RequestDispatcher rd =request.getRequestDispatcher(view);
				rd.forward(request, response);
     		}
    	}
    }
    private void kakaologin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{			
    	String mname = request.getParameter("mname");
    	String email = request.getParameter("email");//번호쳐도 이메일로 넘어옴
    	System.out.println("카카오로그인:"+mname);
    	System.out.println("카카오로그인:"+email);
    	MemberService service = MemberService.getInstance();
    	System.out.println(mname);
    	request.setAttribute("mname",mname);
		request.setAttribute("email",email);
    	Member m = service.kakaologincheck(email);
    	if(m != null && m.getEmail() !=null) {
    		if(email.equals(m.getEmail()) && mname.equals(m.getMname())) {
    			HttpSession session = request.getSession(true);
    			session.setAttribute("userid",m.getMname());
                session.setAttribute("useraddr",m.getMaddr());
                session.setAttribute("userpfrloc",m.getPfrloc());
                session.setAttribute("userphone", m.getPhone());
                session.setAttribute("userathur", m.getAthur());
                session.setAttribute("usergender", m.getGender());
                session.setAttribute("userbirth", m.getBirth());
                session.setAttribute("userpwd", m.getPwd());
                session.setAttribute("usermnum", m.getMnum());
                String view ="checkemail.jsp";
				RequestDispatcher rd =request.getRequestDispatcher(view);
				rd.forward(request, response);	
    			}
    	}else {    		
			String view = "kakaojoin2.jsp";
		    RequestDispatcher rd =request.getRequestDispatcher(view);
		    rd.forward(request, response);			   
    	}
    	
    }
    private void findpassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{		
    	String phone = request.getParameter("phone");
    	String mname = request.getParameter("mname");
    	MemberService service = MemberService.getInstance();
    	Member m =service.findpasswordS(phone);   	
    	if(m != null && phone.equals(m.getPhone()) && mname.equals(m.getMname())) {
    	    m.getPwd();
    		response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('"+m.getPwd()+"')");
			pw.println("opener.parent.location.reload();");
			pw.println("window.close();");
			pw.println("location.href='../'");
			pw.println("</script>");
			pw.close();  
    	}else {
    		response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>");
			pw.println("alert('사용자가없습니다')");
			pw.println("location.href='findpassword.jsp'");
			pw.println("</script>");
			pw.close(); 
    	}
    } 
    private void signout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{			
    	HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("../");
    }
    private void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{			
    	String item1 = request.getParameter("item1");
    	String item2 = request.getParameter("item2");
    	String item3 = request.getParameter("item3");
    	String item4 = request.getParameter("item4");
    	String item=item1+item2+item3+item4;
    	System.out.println(item);
    }
}
