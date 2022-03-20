<%@ page contentType="text/html;charset=utf-8" import="java.util.*, team1.togather.domain.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>ToGather 게시판</title>
    <!-- Favicon-->
    <link rel="icon" type="../image/x-icon" href="../assets/ToGather.ico" />
    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      rel="stylesheet"
    />
	<script>
		window.onpageshow = function(event){
			if(event.persisted) || (window.performance && window.performance.naviation.type ==2)){
				location.href='board.do';
			}
		}
	</script>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="../css/groupList.css" rel="stylesheet" />
    <script src="../js/main.js" defer></script>
    <script src="../js/splitting.js"></script>
    <script src="../js/typed.js"></script>
  </head>
  <script >
       function f_login()
       {
           baby_login = window.open(
           "../member/login2.jsp", "login_name", 
                "width=600, height=900, top=100, left=100");
       }
    </script>


<script>
       function f_join()
       {
           baby_login = window.open(
           "../member/join2.jsp", "join2_name", 
                "width=600, height=1100, top=100, left=100");
       }
    </script>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
      <script>
      Kakao.init('11400a9267d93835389eb9255fcaad0b');
      function signout(){
        if(Kakao.Auth.getAccessToken() != null){
    	  Kakao.Auth.logout(function(){
    	    setTimeout(function(){
              location.href="../member/sessionLogout.jsp";
           },500);
         });
        }else{
        	location.href="../member/sessionLogout.jsp";
        }
      }
      </script>
  <body>
  <% 	int pageAt = 1;
	if((Integer)request.getAttribute("pageAt")!=null){    
		pageAt = (Integer)request.getAttribute("pageAt");
	}
	int totalPage = (Integer)request.getAttribute("totalPage");  
	int ps = (Integer)request.getAttribute("ps");
	int ps2 =ps;
%>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-gray">
      <div class="container px-4 px-lg-5">
        <h1 class="logo">
          <a href="../"
            ><img src="../imgs/topLogo.png" alt="ToGather" title="홈으로 이동"
          /></a>
        </h1>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
            <li class="nav-item">
              <a
                class="nav-link active"
                aria-current="page"
                href="../customer/introduce.jsp"
                >ToGather란?</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../customer/notice.jsp">공지사항</a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                id="navbarDropdown"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                >자주하는 질문</a
              >
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li>
                  <a class="dropdown-item" href="../customer/FAQ.jsp">FAQ</a>
                </li>
                <li>
                  <a class="dropdown-item" href="../customer/Q&A.jsp">Q&A</a>
                </li>
              </ul>
            </li>
          </ul>
          <form class="d-flex">
           
           <% 
            String userid=(String)session.getAttribute("userid");
            if(userid==null){    
            %>
            <button
              class="btn btn-outline-dark"
              type="button"
              onclick="location.href='javascript:f_login()'"
            >
              <i class="bi bi-person-fill"></i>
              로그인
            </button>
            <button
              class="btn btn-outline-primary"
              type="button"
              onclick="location.href='javascript:f_join()'"
            >
              <i class="bi bi-person-plus-fill"></i>
              회원가입
            </button>
          <% }else {%>
            		<button id = "logout" class="btn btn-outline-dark" style="margin-right:10px"type="button" onclick="location.href='javascript:signout()'">
             			 <i class="bi bi-person-fill"></i>
             				 로그아웃
           			 </button>
			<%}%>
              <script >
			       function check(){   
			          if(<%=userid%>==null){
			        	  alert('로그인후 가능합니다');
			        	  return;
			          }
			          else{
			        	  location.href = "../";
			        	  return;
			          }
			       }
    		</script>
            <button
              class="btn btn-outline-dark"
              type="button"
              onclick="location.href='../customer/wish.jsp'"
            >
              <i class="bi-cart-fill me-1"></i>
              찜
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
            </button>
            <!--회원전용 메뉴. 비로그인시 로그인먼저 하도록 alert 띄우기-->
            <button
              class="btn btn-outline-danger"
              type="button"
              onclick="check()"
            >
              <i class="bi bi-people-fill"></i>
              모임 만들기
            </button>
          </form>
        </div>
      </div>
    </nav>

    <section class="vh-100" style="background-color: #eee">
      <div class="container h-75 contents-center">
        <div class="row justify-content-center align-items-center h-75">
          <div class="col-lg-2"></div>
          <div class="col-lg-8">
            <p class="text-center h1 fw-bold mb-1 mx-1 mx-md-4 mt-3">
              자유게시판 
            </p>
            <div class="button_group">
              <button
                class="btn btn-outline-primary btn-sm dropdown-toggle mb-1 mx-md-0"
                type="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                style="float: left;"
              >
                페이지당 게시글 수
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="board.do?ps=5">5</a></li>
                <li><a class="dropdown-item" href="board.do?ps=10">10</a></li>
                <li><a class="dropdown-item" href="board.do?ps=15">15</a></li>
              </ul>
              
              <!--운영자만 가능한 글쓰기 버튼--> 
              <c:if test="${not empty userphone}">
              <a
                type="submit"
                class="btn btn-secondary btn-sm mb-1"
                style="float: right"
                href = "board.do?m=input"
              >
                글쓰기
              </a>
              </c:if>
          </div>
			
          <table
            class="table table-striped table-hover table-bordered contents-center text-center"
          >
            <thead class="table-primary">
              <tr>
                <th scope="col" style="width: 20px; height: auto">#</th>
                <th scope="col" style="width: 10px; height: auto">관심사</th>
                <th scope="col" style="width: 120px; height: auto">제목</th>
				<th scope="col" style="width: 10px; height: auto">작성자</th>
				<th scope="col" style="width: 10px; height: auto">조회수</th>
				<th scope="col" style="width: 10px; height: auto">등록일</th>
              </tr>
            </thead>
            <tbody>
               <%  ArrayList<Board> blist =(ArrayList<Board>)request.getAttribute("blist");
				ArrayList<Board> wholeblist =(ArrayList<Board>)request.getAttribute("wholeblist");
				for(int i=0; i<blist.size(); i++){
			%>
              <tr>
                <th scope="row"><%=blist.get(i).getBnum()%></th>
                <td>
					<%=blist.get(i).getBcategory()%>
                </td>
                <td><a style="text-decoration: none; color: black" href='reply.do?m=list&bnum=<%=blist.get(i).getBnum()%>&name=<%=blist.get(i).getMname()%>'><%=blist.get(i).getBtitle()%></a>
				</td>
				<td>
					<%=blist.get(i).getMname()%>
				</td>
				<td>
					<%=blist.get(i).getBview()%>
				</td>
				<td>
					<%=blist.get(i).getRdate()%>
				</td>
              </tr>
              <%}%>
            </tbody>
          </table>
          
          <nav aria-label="Page navigation example">
          <form class="btn btn-outline-primary btn-sm mb-1 mx-md-0" name="input2" method="post" action="board.do?m=olist&pageAt=<%=pageAt%>&ps=<%=ps2%>">
				<select name="option">
					<option value="bcategory">관심사</option>
					<option value="btitle">제목</option>
					<option value="mname">작성자</option>
				</select>
				<input type="text" name="ocontent">
				<input type="submit" value="전송" onclick="check()" hidden> 
			 </form> 
            <ul
              id="notice_page"
              class="pagination pagination-sm"
              style="justify-content: center"
            >
			<% 
				if(pageAt != 1){
					int k = pageAt;
			%>
              <li class="page-item">
                <a class="page-link" href="board.do?m=list&pageAt=<%=k-1%>&ps=<%=ps2%>">Previous</a>
              </li>
              
			  <%} 
           		for(int i = 1; i<=totalPage; i++){
         	  %>
              <li class="page-item"><a class="page-link" href="board.do?m=list&pageAt=<%=i%>&ps=<%=ps2%>"><%=i%></a></li>
			  <% }%>
			  <% 
		   		if(pageAt != totalPage){ 
		   			int k = pageAt;
		  	  %>
              <li class="page-item">
                <a class="page-link" href='board.do?m=list&pageAt=<%=k+1%>&ps=<%=ps2%>'>Next</a>
              </li>
              <%} %>
            </ul>
          </nav>
        </div>
        <div class="col-lg-2"></div>
      </div>
    </section>
  </body>
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">
        Copyright &copy; Your Website 2021
      </p>
    </div>
  </footer>
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="../js/scripts.js"></script>
</html>
