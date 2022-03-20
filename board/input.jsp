<%@ page contentType="text/html;charset=utf-8" import="java.util.*, team1.togather.domain.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="input" method="post" action="board.do?m=insert"> 
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
			<h1 align='center'>게시판 글쓰기</h1>
		   <table border="1" width="600" align="center"  cellpadding="3" cellspacing="1">
		      <tr>
			     <td width="30%" align="center">제목</td>
				 <td align="center"><input type="text" name="btitle" size="60" ></td>
			  </tr>
			  <tr>
			     <td width="30%" align="center">작성자</td>
				 <td align="center"><input type="text" name="disabled" size="60" value="${userid}" disabled></td>
				 <td align="center"><input type="hidden" name="mname" size="60" value="${userid}" hidden></td>
			  </tr>
			  <tr>
			     <td align="center">관심사</td>
				 <td align="center"><input type="text" name="bcategory" size="60"></td>
			  </tr>
			  <tr>
			     <td align="center">내용</td>
				 <td align="center"><textarea name="bcontent" rows="5" cols="53"></textarea></td>
			  </tr>
	          <tr>
			     <td align="center">파일</td>
				 <td align="center"><input type="file" name="bfile" size="60"></td> 
			  </tr>
			  <tr>
			     <td colspan="2" align="center">
				    <input type="submit" value="전송" onclick="check()">
					<input type="reset" value="다시입력">
				 </td>
			  </tr>
		   </table>
		   <!-- 여기다가 좋아요추가 -->
		   <br>
		   <hr width="600" size="2" noshade>
		</form>
</body>
</html>