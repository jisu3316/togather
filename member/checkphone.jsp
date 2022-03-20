<%@ page contentType="text/html;charset=utf-8" import="team1.togather.domain.Member" %>
<meta charset='utf-8'>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String phone=(String)request.getAttribute("phone");
String pwd=(String)request.getAttribute("pwd");
	System.out.println("jsp안 폰:"+phone);
	System.out.println("jsp안 비번:"+pwd);
	Member m = (Member)request.getAttribute("m");
	System.out.println("멤버 비번 : "+m.getPwd());
%>

	<c:if test ="${pwd ne m.pwd}">
			<script>
					alert("비밀번호가 다릅니다");
					location.href='login2.jsp';
			</script>	
	</c:if>
	<c:if test ="${phone eq m.phone  && pwd eq m.pwd }">
			<script>
					alert('${userid}님 환영합니다');	
					opener.parent.location.reload();
					window.close();
					location.href='../';
			</script>			
	</c:if>






		



