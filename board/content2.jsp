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
    <title>게시글 제목(받아올 값)</title>
    <!-- Favicon-->
    <link rel="icon" type="../image/x-icon" href="../assets/ToGather.ico" />
    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      rel="stylesheet"
    />
	
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
  <script>
	window.onpageshow = function(event) {
		if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
		       location.href='board.do';
		   }
		}
	</script>
  <body style="background-color: #eee">

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
              onclick="location.href='../group/groupTab.do?m=groupInput&userid=<%=userid %>'"
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
            <div class="col-lg-3"></div>
     
              <table class="table table-bordered">
                <thead class="table-info text-center">
                  <tr>
                    <th scope="col" colspan="11">게시글</th> 
                  </tr>
                <tbody>
				  <tr class="text-center">
                    <th scope="col" name="ntName" class="table-secondary">글제목</th>
                    <td colspan="10">${board.btitle}</td>   
                  </tr>
                  <tr class="text-center">
                    <th scope="row" class="table-secondary" >관심사</th> 
                    <td colspan="10">${board.bcategory}</td>   
                  </tr>
                  <tr class="text-center">
                    <th scope="row" class="table-secondary" >작성자</th>
                    <td colspan="10">${board.mname}</td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="11" style="text-align: center;" class="table-secondary">글내용</th>
                  </tr>
                  <tr>
                    <td colspan="11" style="line-height: 70px; min-height: 70px; height: 200px;" >${board.bcontent}
                    </td>
                  </tr>
                </tbody>
                  <tfoot>
                  <tr>
                    <th scope="row" colspan="11" style="text-align: center;" class="table-secondary">댓글</th>  
                  </tr>
				  
                  <tr class="text-center">
                    <td>작성자</td>
                    <td colspan="5">내용</td>
                    <td colspan="2">좋아요</td>
					<td colspan="2">작성일</td>
					<td colspan="2"></td>
                  </tr>
				  <% 	long mnum = 0;
				  if(session.getAttribute("usermnum")!=null) {
				  			mnum = (Long)session.getAttribute("usermnum");
				  		}
						   ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist");
						  
						   for(int i=0; i<rlist.size(); i++){
					%>
                  <tr>
                    <th scope="row"  style="text-align: center;"><%=rlist.get(i).getMname()%></th> 
                    <td colspan="5"><%=rlist.get(i).getContent()%></td> 
                    <td colspan="2"><%=rlist.get(i).getR_like()%>
                    <% if(mnum!=0){ %>
                    <i class="bi bi-hand-thumbs-up" onclick="location.href='reply.do?m=r_like&rseq=<%=rlist.get(i).getRseq()%>&r_like=<%=rlist.get(i).getR_like()%>&bnum=${board.bnum}'" ></i>
                   <%} %>
                    </td>
					<td colspan="2"><%=rlist.get(i).getRdate()%></td>
					<td colspan="2" align='center'>
							<% System.out.println("rlist의 mnum: "+rlist.get(i).getMnum()+"session에서가져온 mnum: "+mnum);
							if(rlist.get(i).getMnum()==mnum){ 
							%>
								<a href = 'reply.do?m=update1&rseq=<%=rlist.get(i).getRseq()%>&bnum=${board.bnum}'> 수정 </a>
								<a href='reply.do?m=del&rseq=<%=rlist.get(i).getRseq()%>&bnum=${board.bnum}'> 삭제 </a>
							<% } %>
							
							</td>
                  </tr>
					<%} %>
                </tfoot>
              </table>
              <% if(mnum!=0){ %>
              	<form name="input" method="post" action="../board/reply.do?m=insert&bnum=${board.bnum}"> 
              <div class="input-group"> 
                <input type="text" name='rcontent' class="form-control" aria-label="Text input with segmented dropdown button">
                <button type="button" class="btn btn-outline-secondary" onclick="submit()" >댓글등록</button>
              </div>
              </form>
              <%} %>
              <br/>
              <div class="d-flex justify-content-center mx-1 mb-lg-4">
                <button type="button" class="btn btn-outline-primary" style="margin: 3px;" onclick="location.href='board.do'" >
                  목록으로
                </button>
                <% Board board = (Board)request.getAttribute("board"); 
                	if(board.getMnum()==mnum){
                %>
                <button
                type="button"
                class="btn btn-outline-info"
                style="margin: 3px;"
                onclick="location.href='board.do?m=update&bnum=${board.bnum}&mname=${name}'"
              >
                수정하기
              </button>
			  <button
                type="button"
                class="btn btn-outline-info"
                style="margin: 3px;"
                onclick="location.href='board.do?m=del&bnum=${board.bnum}'" 
              >
                삭제하기
              </button>
			  <%}%>
              </div>
              <br/>
              <footer class="py-5 bg-dark" style="width:150%; overflow: visible">  
			    <div class="container">
			      <p class="m-0 text-center text-white">
			        &copy; Team1 Website 2022
			      </p>
			    </div> 
			  </footer>
            <div class="col-lg-3"></div>
        </div>
    </section>
  </body>
  
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="../js/scripts.js"></script>
  
</html>



<!--<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container row">
        <div class="page-hearder col-md-offset-3" style="padding-bottom: 20px">
            <h1>메인화면</h1>
        </div>
        <div class="col-sm-offset-9">
                <form action="" method="get">
                    <select name="search" id="">
                        <option value="writer">작성자</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchkeyword" id="search">
                    <input class="btn btn-sm btn-default" type="submit" value="검색">
                </form>
            </div>
        <div class="col-md-10 col-md-offset-3">
            <table class="table table-striped ">
                <tr class="text-center">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회</th>
                </tr>
                <tr>
                    <td class="col-sm-1">1</td>
                    <td><a href="#">안녕하세요. 질문있어요.</a></td>
                    <td>아노미7</td>
                    <td>2017.09.01</td>
                    <td class="col-sm-1">10</td>
                </tr>
            </table>
        </div>
        <div class="btn-group col-md-offset-12">
          <a href="#" class="btn btn-md btn-default">글쓰기</a>
        </div>
        <div class="col-md-offset-6">
			<ul class="pagination">
                <li><a href="getList.do?nowpage=0">처음</a></li>
                <li><a href="#">이전</a></li>
                <li><a href="#">1</a></li>
				<li><a href="#">다음</a></li>
				<li><a href="#">마지막</a></li>
                
            </ul>
        </div>
    </div>
</body>

</html>-->