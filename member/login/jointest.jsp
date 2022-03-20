<%@ page contentType="text/html;charset=utf-8" import="java.util.*, team1.togather.domain.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="../../css/bootstrap.css">
<script type="text/javascript" src="../../js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<!-- 헤드 레이아웃 include -->
	<script type="text/javascript">
	function check(){
	 var pwdval =input.pwd.value;
	 var pwdval2 =input.pwd2.value;
	 if(pwdval!=pwdval2){
  	   alert("비밀번호가 다릅니다");  
  	   return false;
     }else{
    	 input.maddr.value=pwdval;
    	 document.input.submit();
     } 
	}
	</script>


	<div class="container">
		<div class="row">
			<!-- 입력폼 그리드 -->
			<div class="col-lg-4">
				<form name="input" action="../login.do?m=join" method="post">
					<!-- ID입력 -->
					<div class="input-group mt-3 mb-1">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">거주지</span>
						</div>
						<input type="text" name="maddr"  class="form-control"
							placeholder="Input maddr" aria-label="거주지"
							aria-describedby="basic-addon1" required>
					</div>
					<!-- PW입력 -->
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">관심지역</span>
						</div>
						<input type="text" name="pfrloc" class="form-control"
							placeholder="Input 관심지역" aria-label="관심지역"
							aria-describedby="basic-addon1" required>
					</div>
					
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">이름</span>
						</div>
						<input type="text" name="mname" class="form-control"
							placeholder="Input name" aria-label="이름"
							aria-describedby="basic-addon1" required>
					</div>
					
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">생년월일</span>
						</div>
						<input type="date" name="birth" class="form-control"
							placeholder="Input Password" aria-label="생년월일"
							aria-describedby="basic-addon1" value="1996-01-01" required>
					</div>
					
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">비밀번호</span>
						</div>
						<input type="password" name="pwd" class="form-control"
							placeholder="Input Password" aria-label="비밀번호"
							aria-describedby="basic-addon1" required>
					</div>
					
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">비밀번호확인</span>
						</div>
						<input type="password" name="pwd2" class="form-control"
							placeholder="Input Password" aria-label="비밀번호확인"
							aria-describedby="basic-addon1" required>
					</div>
					
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">폰번호</span>
						</div>
						<input type="tel" name="phone1"size="10" class="form-control"
							placeholder="Input number" aria-label="폰번호"
							aria-describedby="basic-addon1" required value="010" disabled>
							-
						<input type="tel" name="phone2"size="10" class="form-control"
							placeholder="Input number" aria-label="폰번호"
							aria-describedby="basic-addon1" required>
						 -
						 <input type="tel" name="phone3"size="10" class="form-control"
							placeholder="Input number" aria-label="폰번호"
							aria-describedby="basic-addon1" required>
						 </td>
					</div>
					
					<div class="input-group mb-2" align="center">
						<div class="input-group-prepend" >
							<span class="input-group-text" id="basic-addon1">성별</span>
						</div>
							<input type="radio" name="gender" class="form-control"
							size="60" value="남">남
							
							<input align="center" type="radio" name="gender" class="form-control"
							size="60" value="여">여							 
					</div>
					
					<!-- 자동 로그인 -->
					<div class="custom-control custom-checkbox mb-1">
						<input type="checkbox" class="custom-control-input"
							name="isAutoLogin" value="true" id="customCheck1"> <label
							class="custom-control-label" for="customCheck1">로그인 유지</label>
					</div>
					<!-- 로그인 버튼 -->
					<button type="button" class="btn btn-dark btn-sm btn-block" onclick="check()">
						회원가입 하기</button>
				</form>
	</div>

			<!-- 그림 넣을 그리드 -->
			<div class="col-lg-8"></div>
		</div>
	</div>

</body>
</html>