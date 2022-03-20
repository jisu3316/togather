<%@ page contentType="text/html;charset=utf-8" import="java.util.*, team1.togather.domain.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ToGather 수정</h1>
<form name='f' method='post' action='board.do?m=updateDo'>
			<input type='hidden' name='bnum' value='${board.bnum}'>
		<!-- 	
		<input type='hidden' name='mnum' value='${board.mnum}'>
		  -->
		<table border='1' width='600' align='center' cellpadding='3' cellspacing='1'><tr>
			<td width='30%' align='center'>글쓴이</td>
			<td align='center'><input type='text'  size='60' name='mname' value='${name}' disabled></td>
		</tr>
		<tr>
			<td width='30%' align='center'>카테고리</td>
			<td align='center'><input type='text' size='60' name='bcategory'  value='${board.bcategory}'></td>
		</tr>
		<tr>
			<td width='30%' align='center'>글제목</td>
			<td align='center'><input type='text'  size='60' name='btitle' value='${board.btitle}'></td>
		</tr>
		<tr>
			<td width='30%' align='center'>글내용</td>
			<td align='center'><textarea name='bcontent' rows='5' cols='53'>${board.bcontent}</textarea></td>
		</tr>
		<tr> 
			<td width='30%' align='center'>파일</td>
			<td align='center'><input type='text' name='bfile' size='60' value='${board.bfile}'></td>
		</tr>
		<tr> 
			<td colspan='2' align='center'>
			<input type='submit' value='수정'>
		</td>
		</tr>
		</table>
	</form> 
</body>
</html>