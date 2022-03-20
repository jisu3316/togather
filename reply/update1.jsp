<%@ page contentType="text/html;charset=utf-8" import="java.util.ArrayList, team1.togather.domain.Reply" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset='utf-8'>
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
<c:if test ="${empty rupdate1}">
			<tr>
				<td colspan="5" style ="text-align:center">데이터가 하나도없네요</td>				
			</tr>
</c:if>
<% String bnum = (String)request.getAttribute("bnum"); %>
<c:forEach items = "${rupdate1}" var ="reply">
				<body onload='javascript:document.f.email.focus();'>
				<center>
				<hr width='600' size='2' noshade>
				<h2>update1 update</h2>
				<a href='update1.do'>댓글목록</a>
				<hr width='600' size='2' noshade>
				<form name='f' method='post' action='reply.do?m=update2&rseq=${reply.rseq}&bnum=<%=bnum%>'>
				<table border='1' width='600' align='center' cellpadding='3' cellspacing='1'><tr>
				<td width='30%' align='center'>작성자</td>
					<td align='center'><input type='text' name='mname' size='60' value='${reply.mname}' disabled></td>
					</tr>
					 <tr>
					 <td width='30%' align='center'>글내용</td>
					 <td align='center'><input type='text' name='content' size='60' value='${reply.content}'></td>
					 </tr>
	</c:forEach>				 
			<tr>
					 <td colspan='2' align='center'>
					 <input type='submit' value='수정'>
					 </td>
			 </tr>
</table>
</form>
</body>