<%@ page contentType="text/html;charset=utf-8" import="java.util.ArrayList, team1.togather.domain.*, team1.togather.domain.Gathering, team1.togather.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>ToGather 모임</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/ToGather.ico" />
    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
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
 <script>
	window.onpageshow = function(event) {
		if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
		       location.href='../';
		   }
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
<%
   long gSeq = (Long)request.getAttribute("groupInfo_gSeq");
   System.out.println("groupInfo jsp안 : "+ gSeq);
%>
<body>
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
              class="btn btn-outline-dark mx-1"
              type="button"
              onclick="location.href='../customer/wish.jsp'"
            >
              <i class="bi-cart-fill me-1 mx-2"></i>
              찜
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
            </button>
            <!--회원전용 메뉴. 비로그인시 로그인먼저 하도록 alert 띄우기-->
            <button
              class="btn btn-outline-danger mx-1"
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

   <c:forEach items="${groupInfo}" var="groupTab">

      
     <div class="container">
      <div class="row mb-3" style="background-color: lavender; border-radius: 2ex">
        <div class="text-center my-5">
          <h1 class="fw-bolder">${groupTab.gName}</h1>
          <p class="lead mb-0">${groupTab.gLoc}</p>
        </div>
      </div>
    </div>
    
    <!-- Page content-->
    <div class="container">
      <div class="row">
        <!-- Blog entries-->
        <div class="col-lg-8">
          <!-- Featured blog post-->
          <div class="card mb-4">
              <img class="card-img-top" style="width: 100%; height: 500px" src="../store/${groupTab.fname}" alt="..."
            />
            <div class="card-body">
              <div class="small text-muted">${groupTab.rdate}, 모임 정원: ${groupTab.limit}</div>
              <h5 class="card-title">#모임소개</h5>
              <h3 class="card-text">: ${groupTab.gIntro}</h3>
            </div>
          </div>
          <!-- Nested row for non-featured blog posts-->

          <!-- Pagination-->
        </div>
        
   </c:forEach>
   
        <!-- Side widgets-->
        <div class="col-lg-4">
          <!-- Search widget-->
          <div class="car mb-4">
            <div class="list-group">
              <li class="list-group-item list-group-item-secondary" style="background-color: lavender; text-align: center">
                <b>정모</b>
              </li>
           <c:if test="${empty gatheringList}">
           		<div class="list-group-item list-group-item-light">현재 정모가 없습니다.</div>
           </c:if>
           <c:forEach items="${gatheringList}" var="gathering">
              <a
                href="groupTab.do?m=gatheringInfo&gSeq=${gathering.gSeq}&ga_seq=${gathering.ga_seq}"
                class="list-group-item list-group-item-action"
                >${gathering.ga_name}</a
              >
              
               </c:forEach>
               
              <button
                type="button"
                class="list-group-item list-group-item-action active"
                style="text-align: center"
                onclick="location.href='groupTab.do?m=gatheringInput&gSeq=<%=gSeq%>'"
              >
                정모 만들기
              </button>
            </div>
          </div>
          <nav aria-label="Page navigation example">
            <ul
              id="notice_page"
              class="pagination pagination-sm"
              style="justify-content: center"
            >
              <li class="page-item">
                <a class="page-link" href="#"><</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">></a>
              </li>
            </ul>
          </nav>

          <br />
          <div class="card mb-4">
            <div class="card-header" style="background-color: lavender"><b>모임 멤버</b></div>
            <div class="card-body">
            <c:forEach items="${MemInGroupList}" var = "Member">
                <ul>
                    ${Member.mname}
                  </ul> 
            </c:forEach>
            </div>
          </div>
          <nav aria-label="Page navigation example">
            <ul
              id="notice_page"
              class="pagination pagination-sm"
              style="justify-content: center"
            >
              <li class="page-item">
                <a class="page-link" href="#"><</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">></a>
              </li>
            </ul>
          </nav>
          <div class="d-grid gap-2 col-6 mx-auto">
            <button class="btn btn-success mb-5 mt-3" type="button" href="gatheringBoard.html">
               게시판
            </button>
          </div>
       		
       	<div class="d-flex justify-content-center">
       		<div class="d-flex justify-content-center mt-3">
            <button
              type="button"
              class="btn btn-outline-success"
			  style="margin-right: 5px;"
              onclick="location.href='MemInGroup.do?m=MemInGroupgroupjoin&gSeq=<%=gSeq%>'">
              가입하기
            </button>
          </div>
          <div class="d-flex justify-content-center mt-3">
            <button
              type="button"
              class="btn btn-outline-danger"
              onclick="location.href='MemInGroup.do?m=MemInGroupgroupdel&gSeq=<%=gSeq%>'">
              탈퇴하기
            </button>
          </div>
		  </div>
		  <div class="d-flex justify-content-center">
          <div class="d-flex justify-content-center mt-3">
            <button
              type="button"
              class="btn btn-outline-info"
			  style="margin-right: 5px;"
              onclick="location.href='groupTab.do?m=groupGetUpdate&gSeq=<%=gSeq%>'">
              모임정보 수정하기
            </button>
          </div>
          <div class="d-flex justify-content-center mt-3">
	          <button
	              type="button"
	              class="btn btn-outline-danger"
	              onclick="location.href='groupTab.do?m=groupDelete&gSeq=<%=gSeq%>'">
              삭제하기
            </button>
           </div>
		 </div>
           
      </div>
    </div>
        </div>
  </body>
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">
        Copyright &copy; Your Website 2021
      </p>

  </footer>
  <!— Bootstrap core JS—>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!— Core theme JS—>
  <script src="js/scripts.js"></script>
</html>