<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import ="java.sql.*, java.util.ArrayList,team1.togather.domain.*,team1.togather.model.BoardService"%>
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
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  </head>
  <script src="../js/trim.js"></script>
  <script type="text/javascript">
	function check(){
		var pwdval =joinform.pwd.value;
		var pwdval2 =joinform.pwd2.value;
		var mnameval = joinform.mname.value;
		mnameval = trim(mnameval);
		if(mnameval.length == 0){
			alert("아이디를 넣어주세요");
			joinform.mname.value = "";
			joinform.mname.focus();
			return false;
		}else if(pwdval!=pwdval2){
  	   		alert("비밀번호가 다릅니다");  
  	   		return false;
     	}else{
    	 	document.joinform.submit();
     	} 
	}
	</script>
	<script>
    //카카오회원가입
      window.Kakao.init("11400a9267d93835389eb9255fcaad0b");
      function kakaojoin(){
    	  Kakao.Auth.loginForm({
            scope:'profile_nickname, account_email, gender,	birthday',
            success:function(authObj){
                console.log(authObj);
                window.Kakao.API.request({
                    url:'/v2/user/me',
                    success:res => {
                        const kakao_account =res.kakao_account;
                        console.log(kakao_account);
                        input.mname.value = res.properties['nickname'];
                        input.email.value = res.kakao_account.email;
                        input.gender.value = res.kakao_account.gender;
                        input.birthday.value = res.kakao_account.birthday;
                      alert(res.kakao_account.email + ' (' + res.properties['nickname'] + ') 님 환영합니다.');
                      document.input.submit();        
                    }
                })
            }
          });
      }
      </script>
	<body onload="document.joinform.mname.focus()">
	<div class="wrapper">
  <body>
    <% BoardService service = BoardService.getInstance(); 
    ArrayList<String> cateList = service.getCategoryS();
    %>
    <section class="vh-100" style="background-color: #eee; flex: 1">
      <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-lg-12 col-xl-11">
            <div class="card text-black" style="border-radius: 25px">
              <div class="card-body p-md-5">
                <div class="row justify-content-center">
                  <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                    <p class="text-center h1 fw-bold mb-3 mx-1 mx-md-4 mt-2">
                    <!-- 카카오회원가입 버튼 -->
				<form name="input" action="kakaojoin2.jsp" method="post">
					<input type="hidden" name="mname" class="form-control" placeholder="Input name" aria-label="이름" aria-describedby="basic-addon1" required>
					<input type="hidden" name="gender">
					<input type="hidden" name="email">
					<input type="hidden" name="birthday">
				</form>
				<div class="content-center text-center">
                      <button
                        type="button"
                        class="btn btn-warning btn-lg btn-block mt-0 mb-0 content-center"
                        onclick="location.href='javascript:kakaojoin()'">
                        <i class="bi bi-chat-fill"></i>
                        카카오톡 계정으로 회원가입
                      </button>
                      </div>
                      <br/><br/>
                      
                    <p class="text-center h2 fw-bold mb-1 mx-1 mx-md-4 mt-3">
                      회원가입
                    </p>
                    <!--거주지/관심지역/이름/생년월일/비번/비번확인/전화번호/성별-->
                    <form name="joinform" class="mx-1 mx-md-4" name="input" action="login.do?m=join" method="post">
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example1c"
                            >이름</label
                          >
                          <input
                            type="text" name="mname"
                            id="form3Example1c"
                            class="form-control"
                          />
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
                          <label class="form-label mb-0" for="form3Example4c"
                            >이메일</label
                          >
                          <input
                            type="text" name="email"
                            id="form3Example4c"
                            class="form-control"
                          />
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4c"
                            >전화번호</label
                          >
                          <input
                            type="text" name="phone"
                            maxlength="11"
                            id="form3Example4c"
                            class="form-control"
                            required
                          />
                        </div>
                      </div>

                      <div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-2">
                          <label class="form-label mb-0" for="form3Example4cd"
                            >거주지</label
                          >
                          <select class="form-control" name="maddr">
                            <option disabled>선택</option>
                            <option value="서울">서울</option>
                            <option value="경기">경기</option>
                            <option value="인천">인천</option>
                            <option value="강원">강원</option>
                            <option value="전북">전북</option>
                            <option value="전남">전남</option>
                            <option value="경북">경북</option>
                            <option value="경남">경남</option>
                            <option value="충북">충북</option>
                            <option value="충남">충남</option>
                            <option value="제주">제주</option>
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
                            <option disabled>선택</option>
                            <option value="서울">서울</option>
                            <option value="경기">경기</option>
                            <option value="인천">인천</option>
                            <option value="강원">강원</option>
                            <option value="전북">전북</option>
                            <option value="전남">전남</option>
                            <option value="경북">경북</option>
                            <option value="경남">경남</option>
                            <option value="충북">충북</option>
                            <option value="충남">충남</option>
                            <option value="제주">제주</option>
                          </select>
                        </div>
                      </div>
						
					<div class="d-flex flex-row align-items-center mb-0">
                        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                       	 	<div class="form-outline flex-fill mb-2">
                          		<label class="form-label mb-0" for="form3Example4cd">
                          			관심사</label>
                          			<select class="form-control" name="category">
                           			<option value="none">선택</option>
                            		<% for(String cl: cateList){ %>
                            		<option value="<%=cl%>"><%=cl%></option>
                            		<%} %>
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
                          type="button" onclick="check()"
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
  </div>
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="js/scripts.js"></script>
</html>
