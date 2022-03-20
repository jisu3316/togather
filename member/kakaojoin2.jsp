<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <link rel="icon" type="image/x-icon" href="assets/ToGather.ico" />
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


  <script type="text/javascript">
	function check(){
		var pwdval =input.pwd.value;
		var pwdval2 =input.pwd2.value;
	 	if(pwdval!=pwdval2){
  	   		alert("비밀번호가 다릅니다");  
  	   		return false;
     	}else{

    	 document.input.submit();
     	} 
	}
	</script>
	<body onload="document.input.mname.focus()">
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
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-12 col-xl-11">
            <div class="card text-black" style="border-radius: 25px">
              <div class="card-body p-md-5">
                <div class="row justify-content-center">
                  <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                    <p class="text-center h1 fw-bold mb-3 mx-1 mx-md-4 mt-2">
                    </p>
                    <p class="divider-text mt-2 mb-2">
                      <span class="bg-light">OR</span>
                    </p>
                    <p class="text-center h2 fw-bold mb-1 mx-1 mx-md-4 mt-3">
                      회원가입
                    </p>
                    <!--거주지/관심지역/이름/생년월일/비번/비번확인/전화번호/성별-->
                    <form name="kakaojoinform" action="login.do?m=kakaojoin&mname=${param.mname}&email=${param.email}" method="post">
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example1c"
                            >이름</label
                          >
                         
                          <input
                            type="text" name="mname"
                            id="form3Example1c"
                            class="form-control"   required/>
                        </div>
                      </div>

                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example3c"
                            >생년월일</label
                          >
                          <input
                            type="date" name="birth"
                            id="form3Example3c"
                            class="form-control" value="1996-01-01"
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4c"
                            >비밀번호</label
                          >
                          <input
                            type="password" name="pwd"
                            id="form3Example4c"
                            class="form-control"
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4c"
                            >비밀번호 확인</label
                          >
                          <input
                            type="password" name="pwd2"
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
                            >전화번호</label>
                          <div class="list-inline-item">
                            <input
                              type="tel" name="phone"
                              maxlength="11"
                              id="form3Example4c"
                              class="form-control-join-phone"
                              style="width: 255px"/>
                          </div>
                        </div>
                      </div>

                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4cd"
                            >거주지</label
                          >
                          <select class="form-control" name="maddr">
                            <option>선택</option>
                            <option value="서울">서울</option>
                            <option value="경기">경기</option>
                            <option value="인천">인천</option>
                          </select>
                        </div>
                      </div>

                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4cd"
                            >관심지역</label
                          >
                          <select class="form-control" name="pfrloc">
                            <option>선택</option>
                            <option value="서울">서울</option>
                            <option value="경기">경기</option>
                            <option value="인천">인천</option>
                          </select>
                        </div>
                      </div>
						<div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                       	 	<div class="form-outline flex-fill mb-2">
                          		<label class="form-label mb-0" for="form3Example4cd">
                          			관심사</label>
                          			<select class="form-control" name="category">
                           			<option>선택</option>
                            		<option value="음악">음악</option>
                            		<option value="게임">게임</option>
                            		<option value="여행">여행</option>
                            		<option value="요리">요리</option>
                            		<option value="직무">직무</option>
                           			</select>
                        	</div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4cd"
                            >성별</label
                          ><br />
                          <div
                            class="btn-group btn-group-toggle col-12"
                            data-toggle="buttons"
                          >
                            <label class="btn btn-light active">
                              <input
                                type="radio"
                                name="gender"
                                id="option1"
                                autocomplete="off"
                                checked
                              />
                              남
                            </label>
                            <label class="btn btn-light">
                              <input
                                type="radio"
                                name="gender"
                                id="option2"
                                autocomplete="off"
                              />
                              여
                            </label>
                          </div>
                          <br />
                          <br />
                        </div>
                      </div>

                      <div
                        class="form-check d-flex justify-content-center mb-3"
                      >
                        <input
                          class="form-check-input me-2"
                          type="checkbox"
                          value=""
                          id="form2Example3c"
                        />
                        <label class="form-check-label" for="form2Example3">
                          <a href="#!">ToGather 이용약관</a>에 동의합니다(필수)
                        </label>
                      </div>

                      <div
                        class="d-flex justify-content-center mx-4 mb-3 mb-lg-4"
                      >
                        <button
                          type="submit" onclick="check()"
                          class="btn btn-primary btn-lg"
                          style="margin-right: 30px"
                        >
                          가입하기
                        </button>
                        <button type="button" class="btn btn-danger btn-lg">
                          취소
                        </button>
                      </div>
                    </form>
                  </div>
                  <div
                    class="col-md-10 col-lg-5 d-flex align-items-center order-1 order-lg-2"
                  >
                    <img
                      src="../imgs/signupLogo.png"
                      class="img-fluid"
                      alt="Sample image"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
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
