<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <title>ToGather 로그인</title>
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
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  </head>
  <script>
      //카카오로그인
      window.Kakao.init("11400a9267d93835389eb9255fcaad0b");
      function kakaoLogin(){
    	  Kakao.Auth.loginForm({
            scope:'profile_nickname, account_email, gender,	birthday',
            success:function(authObj){
                console.log(authObj);
                window.Kakao.API.request({
                    url:'/v2/user/me',
                    success:res => {
                        const kakao_account =res.kakao_account;
                        console.log(kakao_account);
                        kakaologin.mname.value = res.properties['nickname'];      
                        kakaologin.email.value = res.kakao_account.email;
                        kakaologin.gender.value = res.kakao_account.gender;
                        kakaologin.birthday.value = res.kakao_account.birthday;
                      alert(res.kakao_account.email + ' (' + res.properties['nickname'] + ') 님 환영합니다.');
                      document.kakaologin.submit();        
                    }
                })
            }
          });
      }
    </script>
  <body onload="f.phone.focus()">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-gray">
      <div class="container px-4 px-lg-5">
        <h1 class="logo">
          <a href=""
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
                href=""
                >ToGather란?</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">공지사항</a>
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
                  <a class="dropdown-item" href="">FAQ</a>
                </li>
                <li>
                  <a class="dropdown-item" href="">Q&A</a>
                </li>
              </ul>
            </li>
          </ul>
          <form class="d-flex">
            
            <button
              class="btn btn-outline-dark"
              type="button"
              onclick="location.href=''"
            >
              <i class="bi bi-person-fill"></i>
              로그인
            </button>
            <button
              class="btn btn-outline-primary"
              type="button"
              onclick="location.href=''"
            >
              <i class="bi bi-person-plus-fill"></i>
              회원가입
            </button>
            <button
              class="btn btn-outline-dark"
              type="button"
              onclick="location.href=''"
            >
              <i class="bi-cart-fill me-1"></i>
              찜
              <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
            </button>
            <!--회원전용 메뉴. 비로그인시 로그인먼저 하도록 alert 띄우기-->
            <button
              class="btn btn-outline-danger"
              type="button"
              onclick="location.href=''"
            >
              <i class="bi bi-people-fill"></i>
              모임 만들기
            </button>
          </form>
        </div>
      </div>
    </nav>

    <section class="vh-100" style="background-color: #f8f9fa">
      <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-75">
          <div class="col-12 col-md-8 col-lg-6 col-xl-5">
            <div class="card shadow-2-strong" style="border-radius: 1rem">
              <div class="card-body p-5 text-center">
                <h3 class="mb-5">로그인</h3>
			<form name = "f" action="login.do?m=login" method="post">
                <div class="form-outline mb-4">
                  <input
                    type="text"
                    id="typeEmailX-2" name="phone"
                    class="form-control form-control-lg"
                    placeholder="전화번호"
                  />
                </div>

                <div class="form-outline mb-4">
                  <input
                    type="password"
                    id="typePasswordX-2" name="pwd"
                    class="form-control form-control-lg"
                    placeholder="비밀번호"
                  />
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-start mb-4">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="form1Example3"
                    style="margin-right: 6px"
                  />
                  <label class="form-check-label" for="form1Example3">
                    로그인 유지하기
                  </label>
                </div>

                <button class="btn btn-primary btn-lg col-12" type="submit">
                  Login
                </button>
				</form>
                <p class="divider-text">
                  <span class="bg-light">OR</span>
                </p>
                <form name="kakaologin" action="login.do?m=kakaologin" method="post">
					<input type="hidden" name="mname">
					<input type="hidden" name="gender">
					<input type="hidden" name="email">
					<input type="hidden" name="birthday">
				</form>
                <button
                  type="button"
                  class="btn btn-warning btn-lg btn-block mt-0 mb-0"
                  onclick="location.href='javascript:kakaoLogin()'">
                  <i class="bi bi-chat-fill"></i>
                  카카오톡 로그인
                </button>
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
