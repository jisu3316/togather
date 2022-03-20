<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
String userid =null;
 if(session.getAttribute("userid") != null){
	 userid = (String)session.getAttribute("userid");
	 System.out.println(userid);
 }


/*if(userid==null){
	userid = "GUEST";
}*/
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script language="javascript">
       function f_join()
       {
           baby_login = window.open(
           "login/join.jsp", "join_name", 
                "width=600, height=900, top=100, left=100");
       }
    </script>
    <script language="javascript">
       function f_login()
       {
           baby_login = window.open(
           "login/login.jsp", "login_name", 
                "width=500, height=500, top=100, left=100");
       }
    </script>
    <script language="javascript">
       function f_fp()
       {
           baby_login = window.open(
           "login/findpassword.jsp", "login_name", 
                "width=500, height=300, top=100, left=100");
       }
    </script>
    <script language="javascript">
       function f_logintest()
       {
           baby_login = window.open(
           "login/logintest.jsp", "login_name", 
                "width=500, height=300, top=100, left=100");
       }
    </script>
    <script language="javascript">
       function f_jointest()
       {
           baby_login = window.open(
           "login/jointest.jsp", "login_name", 
                "width=500, height=500, top=100, left=100");
       }
    </script>
   

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
      window.Kakao.init("11400a9267d93835389eb9255fcaad0b");
      function kakaoLogin(){
          window.Kakao.Auth.login({
            scope:'profile_nickname, account_email, gender',
            success:function(authObj){
                console.log(authObj);
                window.Kakao.API.request({
                    url:'/v2/user/me',
                    success:res => {
                        const kakao_account =res.kakao_account;
                        console.log(kakao_account);
                      alert(res.kakao_account.email + ' (' + res.properties['nickname'] + ') 님 환영합니다.');
                      $("input[type='submit']").prop("disabled", true);
      	        	  $("input[type='hidden']").val(res.kakao_account.email);
      	        	  $("form").submit();
                       
                    }
                })
            }
          });
      }
    </script>
    <form id ="kakao"name="kakaform">
    </form>
</head>
내아이디 : ${userid} 
<body>
	<center>
		<strong>togather</strong>
		<br><br>
		 <br><br>
		 <br><br>
		 
		 <br><a href="javascript:kakaoLogin()">카톡</a> <br>
		 <br>
		 <a id = "findpassword" href="javascript:f_fp()">비밀번호찾기</a>  <br>
		 <br>
		 <a id = "join" href="javascript:f_join()">회원가입</a><br>
		 <br>
		 <a href="javascript:f_jointest()">회원가입테스트</a> <br>
		 <br>
		 <a id = "login" href="javascript:f_login()">로그인</a>
		 <br>
		 <br> <a href="javascript:f_logintest()">로그인테스트</a>
       <br><br>
       <br> <a href="login/kakaologin.jsp">ㅋㅋㅇ테스트</a>
       <br><br>
  		 <a id = "logout" href="login/sessionLogout.jsp">${userid }님 어솨~로그아웃</a>
       <br>
       <script>
        document.getElementById('logout').style.display = 'none';
      </script>
 <% 
        	boolean flag =false;
        	if(userid!=null) {
        		flag =true;
        	}
        	System.out.println(flag);
%>     
<script>      
           	if(<%=flag%>){
           		document.getElementById('join').style.display = 'none';
           		document.getElementById('login').style.display = 'none';   
                document.getElementById('logout').style.display = '';
           	}
</script>
	</center>
	
</body>
</html>