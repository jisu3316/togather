<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
   <head>
    <title>ToGather 정모 수정</title>
	<meta charset='utf-8'>
	<script language="javascript">
	   function check()
	   {
	       for(var i=0; i<document.input.elements.length; i++)
		   {
		      if(document.input.ga_name.value == "" || 
	    		  document.input.ga_place.value == "" ||
	    		  document.input.price.value == "" ||
	    		  document.input.ga_limit.value == "")
			  {
			     alert("필수입력란이 비었습니다.");
			     return false;
			  }
		   }
		   document.input.submit();
       }
	</script>
	
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>정모 수정하기</title>
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
 	<script>
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
  <body onload="input.ga_name.focus()">
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
            <% }else {%>
            <button id = "logout" class="btn btn-outline-dark" style="margin-right:10px"type="button" onclick="location.href='javascript:signout()'">
              <i class="bi bi-person-fill"></i>
              로그아웃
            </button>
<%}%>
            <button
              class="btn btn-outline-primary"
              type="button"
              onclick="location.href='javascript:f_join()'"
            >
              <i class="bi bi-person-plus-fill"></i>
              회원가입
            </button>
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
  </head>

  <c:forEach items="${gatheringGetUpdate}" var="gathering">
	<section class="vh-100" style="background-color: #eee">
      <div class="container h-75">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-10 col-xl-10">
            <div class="card text-black" style="border-radius: 25px">
              <div class="card-body p-md-5">
                <div class="row justify-content-center">
                  <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                    <p
                      class="text-center h1 fw-bold mb-3 mx-1 mx-md-4 mt-2"
                    ></p>
                    <p class="text-center h2 fw-bold mb-1 mx-1 mx-md-4 mt-3">
                      정모 수정
                    </p>
                    <form name ="input" class="mx-1 mx-md-4" method="post" action="groupTab.do?m=gatheringUpdate&gSeq=${gathering.gSeq}&ga_seq=${gathering.ga_seq}">
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example1c"
                            >정모 이름</label
                          >
                          <input
                            type="text"
                            name="ga_name"
                            value="${gathering.ga_name}"
                            maxlength="30"
                            id="form3Example1c"
                            class="form-control"
                          />
                        </div>
                      </div>

                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example3c"
                            >정모 날짜</label
                          >
                          <input
                            type="date"
                            name="ga_date"
                            value="${gathering.ga_date}"
                            id="form3Example3c"
                            class="form-control"
							disabled
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4c"
                            >정모 시간</label
                          >
                          <input
                            type="time"
                            name="time"
                            value="${gathering.time}"
                            id="form3Example4c"
                            class="form-control"
							disabled
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4c"
                            >정모 장소</label
                          >
                          <input
                            type="text"
                            name="ga_place"
                            value="${gathering.ga_place}"
                            id="form3Example4c"
                            class="form-control"
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label
                            class="form-label mb-0"
                            for="form3Example4c"
                            style="display: block"
                            >회비</label
                          >
                          <div class="input-group mb-3">
                            <span class="input-group-text"
                              ><i class="bi bi-cash-coin"></i
                            ></span>
                            <input
                              type="text"
                              name="price"
                              value="${gathering.price}"
                              class="form-control"
                              aria-label="Amount (to the nearest dollar)"
                            />
                          </div>
                        </div>
                      </div>

                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4c"
                            >최대 인원</label
                          >
                          <input
                            type="number"
                            name="ga_limit"
                            value="${gathering.ga_limit}"
                            id="form3Example4c"
                            min="2"
                            max="20"
                            placeholder="2~20"
                            class="form-control"
                          />
                        </div>
                      </div>

                      <div class="d-flex justify-content-center mx-1 mb-lg-4">
                        <button
                          type="submit"
                          class="btn btn-primary"
                          style="margin: 3px"
                        >
                          수정하기
                        </button>
                        <button
                          type="button"
                          class="btn btn-warning"
                          style="margin: 3px"
                        >
                          다시작성
                        </button>
                        <button
                          type="button"
                          class="btn btn-danger"
                          style="margin: 3px"
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
