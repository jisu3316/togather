<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*, java.util.ArrayList,team1.togather.domain.*,team1.togather.model.GroupTabService"%> 
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
    <title>No.1 취미모임 웹페이지, ToGather!</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <script src="js/main.js" defer></script>
    <script src="js/splitting.js"></script>
    <script src="js/typed.js"></script>
    <script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  </head>
  
	<%
		ArrayList<GroupTab> groupList = new ArrayList<GroupTab>();
		GroupTabService service = GroupTabService.getInstance();
		groupList = service.groupListS();
	%>
   <script >
       function f_login()
       {
           baby_login = window.open(
           "member/login2.jsp", "login_name", 
                "width=600, height=900, top=100, left=100");
       }
    </script>
    <script>
       function f_join()
       {
           baby_login = window.open(
           "member/join2.jsp", "join2_name", 
                "width=1100, height=1100, top=100, left=100");
       }
    </script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">
	Kakao.init("11400a9267d93835389eb9255fcaad0b");
	if(${userid ne null}){
			function sendLinkCustom(){	
        			Kakao.Link.sendCustom({
            		templateId: 70745       			
        	});
			}
    	}
	</script>
  <body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-2 px-lg-2">
        <h1 class="logo">
          <a href="index.jsp"
            ><img src="imgs/topLogo.png" alt="ToGather" title="홈으로 이동"
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
                href="customer/introduce.jsp"
                >ToGather란?</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="customer/notice.jsp">공지사항</a>
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
                <li><a class="dropdown-item" href="customer/FAQ.jsp">FAQ</a></li>
                <li><a class="dropdown-item" href="customer/Q&A.jsp">Q&A</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex">
            <% 
            String userid=(String)session.getAttribute("userid");
            if(userid==null){    
            %>
            <button class="btn btn-outline-dark mx-1" type="button" onclick="location.href='javascript:f_login()' ">
              <i class="bi bi-person-fill"></i>
              로그인
            </button>
             <button class="btn btn-outline-dark mx-1" type="button" onclick="location.href='javascript:f_join()'">
              <i class="bi bi-person-plus-fill"></i>
              회원가입
            </button>
           <% }else {%>
            <button id = "logout" class="btn btn-outline-dark mx-1" type="button" onclick="location.href='javascript:signout()'">
              <i class="bi bi-person-fill"></i>
              로그아웃
            </button>
           
      		<%}%>
            <button class="btn btn-outline-warning mx-1" type="button" onclick="location.href='javascript:sendLinkCustom()'">
              <i class="bi bi-person-fill"></i>
              카톡공유하기
            </button>
            <% int wlistSize = 0;
            	if((ArrayList<WishList>)session.getAttribute("wishlist")!=null){
	            	ArrayList<WishList> wlist = (ArrayList<WishList>)session.getAttribute("wishlist");
	            	wlistSize = wlist.size();
          	  }
            %> 
            <c:if test="${not empty usermnum}">
            <button class="btn btn-outline-dark mx-1" type="button" onclick="location.href='group/groupTab.do?m=wishlist&userid=<%=userid%>&usermnum=${usermnum}'">
              <i class="bi-cart-fill me-1"></i>
              찜
              <span class="badge bg-dark text-white ms-1 rounded-pill"><%=wlistSize%></span>
            </button> 
            </c:if>
            <button class="btn btn-outline-danger mx-1" type="button" onclick="location.href='group/groupTab.do?m=groupInput&userid=<%=userid%>'">
              <i class="bi bi-people-fill"></i>
              모임 만들기
            </button>
            <button class="btn btn-outline-success mx-1" type="button" onclick="location.href='board/board.do' ">
              <i class="bi bi-person-fill"></i>
             	자유게시판
            </button>
          </form>
        </div>
      </div>
    </nav>
    <!-- Header-->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
      <script>
      Kakao.init('11400a9267d93835389eb9255fcaad0b');
      function signout(){
        if(Kakao.Auth.getAccessToken() != null){
    	  Kakao.Auth.logout(function(){
    	    setTimeout(function(){
              location.href="member/sessionLogout.jsp";
           },500);
         });
        }else{
        	location.href="member/sessionLogout.jsp";
        }
      }
      </script>
    <header class="header">
      <div class="wrap">
        <div id="intro">
          <div class="typing">
            <span class="txt"></span>
          </div>
          <div class="video">
            <video
              source
              src="videos/background.mp4"
              type="video/mp4"
              autoplay
              loop
              muted
            ></video>
          </div>
        </div>
      </div>
    </header>

    <!--

            <div class="container px-4 px-lg-5 my-5">
                
                <div class="text-center text-white">
                    <a href="index.html"><img src="imgs/topLogoBig.png" alt="ToGather" title="홈으로 이동"/></a>
                    <h1 class="display-4 fw-bolder">ToGather에서 <br>자기개발과 취미생활을 <br>시작해보세요</h1>
                </div>
            </div>
    -->
    <!-- 인덱스 데베-->
  
    <section class="py-5">
      <div class="container px-4 px-lg-5 mt-5">
        <div
          class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
        >
         <% for(GroupTab dto :groupList){
    %>
          <div class="col mb-5">
         
            <div class="card h-100">
              <!-- Product image-->
                <img class="card-img-top" style="width: 100%; height: 200px" src="store/<%=dto.getFname()%>" alt="..." />
              <!-- Product details-->
              <div class="card-body p-4">
                <div class="text-center">
                  <!-- Product name-->
                  <h6 class="fw-bolder"><%=dto.getgLoc() %></h6>
                  <h4 class="fw-bolder"><%=dto.getgName() %></h4>
                  <!-- Product price-->
                  <%=dto.getInterest() %>
                </div>
                
              </div>
              
              <!-- Product actions-->
              <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="text-center">
                  <a class="btn btn-outline-dark mt-auto" href="group/groupTab.do?m=groupInfo&gSeq=<%=dto.getgSeq() %>"
                    >둘러보기</a
                  >
                  <c:if test="${not empty usermnum}">
                  <button type="button" class="btn btn-outline-danger btn" onclick="location.href='group/groupTab.do?m=wish&gSeq=<%=dto.getgSeq()%>&usermnum=${usermnum}'">
                              <i class="bi bi-cart-plus"></i>
                              찜하기
                  </button>
                  </c:if>
                </div>
              </div>
              
            </div>
            
          </div> 
          <%} %>
        </div>
      </div>
    </section>
  </body>
          
   <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">
        Team 1 &copy; 김진운 김지수 조현기 송보석 박범수 최대현
      </p>
    </div>
  </footer>
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="js/scripts.js"></script>
</html>
