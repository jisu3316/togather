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
    <title>게시글 수정</title>
    <!-- Favicon-->
    <link rel="icon" type="../image/x-icon" href="../assets/ToGather.ico" />
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
  <body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-gray">
      <div class="container px-4 px-lg-5">
        <h1 class="logo">
          <a href="board.do" 
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
            <!-- 로그인시 보이게하기
            <button class="btn btn-outline-success" type="button" onclick="location.href='logout.html'">
              <i class="bi bi-person-check-fill"></i>
              로그아웃
            </button>
          -->
            <c:if test="${empty userphone}">
            <button
              class="btn btn-outline-dark"
              type="button"
              onclick="location.href='login.html'"
            >
              <i class="bi bi-person-fill"></i>
              로그인
            </button>
            <button
              class="btn btn-outline-primary"
              type="button"
              onclick="location.href='join.html'"
            >
              <i class="bi bi-person-plus-fill"></i>
              회원가입
            </button>
           </c:if>
            <button
              class="btn btn-outline-dark"
              type="button"
              onclick="location.href='wish.html'"
            >
              <i class="bi-cart-fill me-1"></i>
              찜
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
            </button>
            <!--회원전용 메뉴. 비로그인시 로그인먼저 하도록 alert 띄우기-->
            <button
              class="btn btn-outline-danger"
              type="button"
              onclick="location.href='groupCreate.html'"
            >
              <i class="bi bi-people-fill"></i>
              모임 만들기
            </button>
          </form>
        </div>
      </div>
    </nav>
    <section class="vh-100" style="background-color: #eee">
      <div class="container h-75">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-3 col-xl-10"></div>
          <div class="col-lg-10 col-xl-7">
            <div class="card text-black" style="border-radius: 25px">
              <div class="card-body p-md-5">
                <div class="row justify-content-center">
                  <div class="col-md-10 col-lg-8 col-xl-7 order-2 order-lg-1">
                    <p
                      class="text-center h1 fw-bold mb-3 mx-1 mx-md-4 mt-2"
                    ></p>
                    <p class="text-center h2 fw-bold mb-1 mx-1 mx-md-4 mt-3">
                      Board Edit
                    </p>
                    <form class="mx-1 mx-md-4" name='f' method='post' action='board.do?m=updateDo'>
					<input type='hidden' name='bnum' value='${board.bnum}'>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example1c"
                            >글쓴이</label
                          >
                          <input
                            type="text"
							name='mname' 
							value='${name}' 
                            maxlength="12"
                            id="form3Example1c"
                            class="form-control"
							readonly
                          />
                        </div>
                      </div>
					  <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example1c"
                            >카테고리</label
                          >
                          <input
                            type="text"
							name='bcategory'  
							value='${board.bcategory}'
                            maxlength="12"
                            id="form3Example1c"
                            class="form-control"
                          />
                        </div>
                      </div>
					  <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example1c"
                            >글제목</label
                          >
                          <input
                            type="text"
							name='btitle' 
							value='${board.btitle}'
                            maxlength="12"
                            id="form3Example1c"
                            class="form-control"
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4c"
                            >글내용</label
                          >
                          <textarea
                            name='bcontent'
                            placeholder="질문을 작성해주세요"
                            row="10"
                            cols="53"
                            id="form3Example4c"
                            class="form-control"
                          >${board.bcontent}</textarea>
                        </div>
                      </div>

                      <br />
                      <br />
                      <div class="d-flex justify-content-center mx-1 mb-lg-4">
                        <button
                          type="submit"
                          class="btn btn-primary"
                          style="margin: 3px"
                        >
                          등록하기
                        </button>
                        
                        <button
                          type="button"
                          class="btn btn-danger"
                          style="margin: 3px"
                          onclick="location.href='board.do'"
                        >
                          취소
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xl-10"></div>
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
  <script src="js/scripts.js"></script>
</html>
