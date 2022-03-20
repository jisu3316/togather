<%@ page contentType="text/html;charset=utf-8" import="java.util.*, team1.togather.domain.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<meta charset="utf-8">
<script src="../js/trim.js"></script>
	<script language="javascript">
	   function check()
	   {
	       for(var i=0; i<document.input.elements.length; i++)
		   {
		      if(document.input.elements[i].value == "")
			  {
			     alert("모든 값을 입력 하셔야 합니다. ");
				 return false;
			  }
		   }
	       var pwdval =input.pwd.value;
	       var pwdval2 =input.pwd2.value;
	       if(pwdval!=pwdval2){
	    	   alert("비밀번호가 다릅니다");
	    	   return false;
	       }  
	       else{
		   document.input.submit();
	       }
       }
	   function enterCheck(elm){
			if(event.keyCode == 13){
				if(elm == input.maddr){
					input.pfrloc.focus();
					
				}else if(elm==input.pfrloc){
					input.mname.focus();
					
				}else if(elm==input.mname){
					input.birth.focus();
					
				}else if(elm==input.birth){
					input.pwd.focus();
					
				}else if(elm==input.pwd){
					input.phone1.focus();
					
				}else if(elm==input.phone1){
					input.phone2.focus();
					
				}else if(elm==input.phone2){
					input.phone3.focus();
					
				}else if(elm==input.phone3){
					input.gender.focus();
					
				}else {
					check();
				}
			}
		}
	</script>
	<script type="text/javascript">
		
		function closeWin() {
		
		window.close();
		}
	</script>
	<script>
		
	</script>
<style>
	table, th, td {
	   border: 1px solid black;
	   border-collapse: collapse;
	}
	th, td {
	   padding: 5px;
	}
	a { text-decoration:none }
</style>
<body onload="document.input.maddr.focus()">
<center>
   <h1>
		회원가입
   </h1>
   <form name="input" action="../login.do?m=join" method="post">
       <table border="1" width="300" height="200">
       <input type="hidden" value="1">
	      <tr>
		     <td align="center">거주지</td>
			 <td align="center"><input type="text" name="maddr" size="60" onkeydown="enterCheck(this)"></td>
		  </tr>
	      <tr>
		     <td width="30%" align="center">관심지역</td>
			 <td align="center"><input type="text" name="pfrloc" size="60" onkeydown="enterCheck(this)"></td>
		  </tr>
		     <tr>
		     <td align="center">이름</td>
			 <td align="center"><input type="text" name="mname" size="60" onkeydown="enterCheck(this)" ></td>
		  </tr>	   
		  <tr>
		     <td align="center">생년월일</td>
			 <td align="center"><input type="date" name="birth" size="60"  value="2000-01-04" onkeydown="enterCheck(this)"></td>
		  </tr>
		  <tr>
		     <td align="center">비밀번호</td>
			 <td align="center"><input type="password" name="pwd" size="60" onkeydown="enterCheck(this)"></td>
		  </tr>
		  <tr>
		     <td align="center">비밀번호확인</td>
			 <td align="center"><input type="password" name="pwd2" size="60" onkeydown="enterCheck(this)"></td>
		  </tr>
		  <tr>
		     <td align="center">폰번호</td>
			 <td><input type="tel" name="phone1" size="10" onkeydown="enterCheck(this)" value="010" readOnly>
			 -
			 <input type="tel" name="phone2" size="10" onkeydown="enterCheck(this)">
			 -
			 <input type="tel" name="phone3" size="10" onkeydown="enterCheck(this)"></td>
			 </td>
		  </tr>	
 			<tr>
		     <td align="center">성별</td>
			 <td colspan='2' align="center">			
			 <label><input type="radio" name="gender"  value ="남"size="60" onkeydown="enterCheck(this)">남</label>
			 <label><input type="radio" name="gender"  value ="여"size="60" >여</label></td>		 
		  </tr>	
		  <tr>
		     <td colspan="2" align="center">
			     <input type="button" value="전송" onclick="check()"/>
				 <input type="reset" value="취소" onclick="closeWin()"/>
			 </td> 
		  </tr>
	   </table>
   </form>
</center>
</body>


