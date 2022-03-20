<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*, java.util.ArrayList,team1.togather.domain.*,team1.togather.model.*"%>
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

  <div class="wrapper">
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
                  href="introduce.html"
                  >ToGather란?</a
                >
              </li>
              <li class="nav-item">
                <a class="nav-link" href="notice.html">공지사항</a>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  id="navbarDropdown"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  >자주하는 질문(Q&A 게시판필요)</a
                >
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li>
                    <a class="dropdown-item" href="FAQ.html">FAQ</a>
                  </li>
                  <li>
                    <a class="dropdown-item" href="QA.html">Q&A(게시판필요)</a>
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
              onclick="location.href='javascript:f_login()'">
              <i class="bi bi-person-fill"></i>
              로그인
            </button>
            <button
              class="btn btn-outline-primary"
              type="button"
              onclick="location.href='javascript:f_join()'">
              <i class="bi bi-person-plus-fill"></i>
              회원가입
            </button>
            <% }else {%>
            <button id = "logout" class="btn btn-outline-dark" style="margin-right:10px"type="button" onclick="location.href='javascript:signout()'">
              <i class="bi bi-person-fill"></i>
              로그아웃
            </button>
            <button
              class="btn btn-outline-dark"
              type="button"
              onclick="location.href='#'"
            >
              <i class="bi-cart-fill me-1"></i>
              찜
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
            </button>
            <button
              class="btn btn-outline-danger"
              type="button"
              onclick="location.href='../group/groupInput.jsp'"
            >
              <i class="bi bi-people-fill"></i>
              모임 만들기
            </button>
			<%}%>
          </form>
          </div>
        </div>
      </nav>
      <section class="vh-100" style="background-color: #eee"  style="flex: 1">
        <div class="container h-75 contents-center">
            <div class="row justify-content-center align-items-center h-50">
              <div class="col-lg-4"></div>
              <div class="col-lg-6"></div>
              <section class="py-5">
                <div class="container px-4 px-lg-5 mt-5">
                  <div
                    class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
                  >
                <img class="align-items-center" src="../imgs/topLogoBig.png" style="width: 600px; height: auto"><br/>
              </div>
              <h2 style="text-align:center">찜목록</h2>
                </div>
              </section>
                <div class="col-lg-4"></div>
            </div>
          <div class="row justify-content-center align-items-center h-75">
              
                <div class="container px-4 px-lg-5 mt-5">
                  <div
                    class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"
                  >
                  <%ArrayList<GroupTab> glist = (ArrayList<GroupTab>)session.getAttribute("glist");
                  	for(GroupTab gl : glist){
                  %>
                    <div class="col mb-5">
                      <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="../store/<%=gl.getFname()%>" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                          <div class="text-center">
                            <!-- Product name-->
                            <h6 class="fw-bolder"><%=gl.getgLoc()%></h6>
                            <h4 class="fw-bolder"><%=gl.getgName()%></h4>
                            <!-- Product price-->
                            <%=gl.getgIntro()%>
                          </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                          <div class="text-center">
                            <a class="btn btn-outline-dark mt-auto" href="../group/groupTab.do?m=groupInfo&gSeq=<%=gl.getgSeq() %>"
                              >둘러보기</a
                            >
                            <button type="button" class="btn btn-outline-danger btn" onclick="location.href='../group/groupTab.do?m=wishdelete&gSeq=<%=gl.getgSeq()%>&usermnum=${usermnum}'">
                              <i class="bi bi-cart-plus"></i>
                              삭제하기
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <%} %>
                  </div>
                </div>
  
    </body>
    <footer class="py-5 bg-dark" style="width: 150% !important">
      <div class="container">
        <p class="m-0 text-center text-white">
          Copyright &copy; Your Website 2021
        </p>
      </div>
    </footer>
  </div>

  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="../js/scripts.js"></script>
</html>




