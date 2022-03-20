<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <meta charset="utf-8">
<!DOCTYPE html>
<html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
      window.Kakao.init("11400a9267d93835389eb9255fcaad0b");
      function kakaoLogin(){
    	  var kakao="";
          window.Kakao.Auth.login({
            scope:'profile_nickname, account_email, gender',
            success:function(authObj){
                console.log(authObj);
                window.Kakao.API.request({
                    url:'/v2/user/me',
                    success:res => {
                        const kakao_account =res.kakao_account;
                        console.log(kakao_account);
                        input.mname.value=res.properties['nickname'];
                      alert(res.kakao_account.email + ' (' + res.properties['nickname'] + ') 님 환영합니다.');
                      document.input.submit();
                    }
                })
            }
          });
      }
    </script>
<head>

<title>Insert title here</title>
</head>
<body>
<form name="input" action="../login.do?m=loginkakao" method="post">
<br><a href="javascript:kakaoLogin()">카톡</a> <br>
<input type="hidden" name="mname" class="form-control"
							placeholder="Input name" aria-label="이름"
							aria-describedby="basic-addon1" required>
</form>
</body>
</html>