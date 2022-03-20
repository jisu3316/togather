<%@ page contentType="text/html;charset=utf-8" import="java.util.ArrayList, team1.togather.domain.Gathering"%>
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
    <title>ToGather 회원가입</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/ToGather.ico" />
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
<%
	//long gSeq= Long.parseLong(request.getParameter("gSeq"));
	long gSeq = (Long)request.getAttribute("gatheringInfo_gSeq");
	System.out.println("gatheringInfo jsp안 gSeq : "+ gSeq);
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
              onclick="location.href='login.html'"
            >
              <i class="bi bi-person-fill"></i>
              로그인
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
    <c:forEach items="${gatheringInfo}" var="gathering">
		<section class="vh-100" style="background-color: #eee">
	      <div class="container h-75">
	        <div class="row d-flex justify-content-center align-items-center h-100">
	          <div class="col-lg-10 col-xl-11">
	            <div class="card text-black" style="border-radius: 25px">
	              <div class="card-body p-md-5">
	                <div class="row justify-content-center">
	                  <div class="col-md-5 col-lg-10 col-xl-6 order-2 order-lg-1">
	                    <div>
	                    <img
	                      src="../imgs/gathering.jpg"
	                      class="img-fluid"
	                      alt="Sample image"
	                    />
	                  </div>
	                  </div>
	                  <div class="col-md-5 col-lg-10 col-xl-6 order-2 order-lg-1">
	                    <p
	                      class="text-center h1 fw-bold mb-3 mx-1 mx-md-4 mt-2" style="height: 10%;"
	                    ></p>
	
	                    <p class="text-center h3 fw-bold mb-1 mx-1 mx-md-4">
	                      ${gathering.ga_name}
	                    </p>
	                    <form class="mx-1 mx-md-4">
	                      <div class="d-flex flex-row align-items-center mb-0">
	                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
	                        <div class="form-outline flex-fill mb-2">
	                          <label class="form-label mb-0" for="form3Example1c"
	                            ><i class="bi bi-calendar"></i></label
	                          >
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${gathering.ga_date}"
	                            readonly
	                          />
	                        </div>
	                      </div>
	
	                      <div class="d-flex flex-row align-items-center mb-0">
	                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
	                        <div class="form-outline flex-fill mb-2">
	                          <label class="form-label mb-0" for="form3Example4c"
	                            ><i class="bi bi-clock"></i></label
	                          >
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${gathering.time}"
	                            readonly
	                          />
	                        </div>
	                      </div>
	
	                      <div class="d-flex flex-row align-items-center mb-0">
	                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
	                        <div class="form-outline flex-fill mb-2">
	                          <label class="form-label mb-0" for="form3Example4c"
	                            ><i class="bi bi-pin-map-fill"></i></label
	                          >
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${gathering.ga_place}"
	                            readonly
	                          />
	                        </div>
	                      </div>
	
	                      <div class="d-flex flex-row align-items-center mb-0">
	                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
	                        <div class="form-outline flex-fill mb-2">
	                          <label class="form-label mb-0" for="form3Example4c"
	                            ><i class="bi bi-cash-coin"></i></label
	                          >
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${gathering.price}"
	                            readonly
	                          />
	                        </div>
	                      </div>
	
	                      <div class="d-flex flex-row align-items-center mb-0">
	                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
	                        <div class="form-outline flex-fill mb-2">
	                          <label class="form-label mb-0" for="form3Example4c"
	                            ><i class="bi bi-people-fill"></i></label
	                          >
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${gathering.ga_limit}"
	                            readonly
	                          />
	                        </div>
	                      </div>
	                      <div
	                      class="d-flex justify-content-center mx-4 mb-3 mb-lg-4 my-md-3"
	                    >
	                      <button
	                        type="button"
	                        class="btn btn-outline-primary btn-sm"
	                        style="margin-right: 15px"
	                      >
	                        참가하기
	                      </button>
	                      <button type="button" class="btn btn-outline-warning btn-sm"
	                      onclick="location.href='groupTab.do?m=gatheringGetUpdate&gSeq=${gathering.gSeq}&ga_seq=${gathering.ga_seq}'">
	                        수정하기
	                      </button>
	                      <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='groupTab.do?m=groupInfo&gSeq=${gathering.gSeq}'">
	                        돌아가기
	                      </button>
	                      <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='groupTab.do?m=gatheringDelete&gSeq=${gathering.gSeq}&ga_seq=${gathering.ga_seq}'">
	                        삭제하기(바로 삭제)
	                      </button>
	                    </div>
	                        </div>
	                    </form>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	    </section>
    </c:forEach>
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
  <script src="js/scripts.js"></script>
</html>

