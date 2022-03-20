<%@ page contentType="text/html;charset=utf-8" import="java.util.*, team1.togather.domain.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

	window.onpageshow = function(event) {
	if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
	       location.href='board.do';
	   }
	}

</script>
<body>
<center>
						<hr width='600' size='2' noshade>
						<h2>ToGather 게시글</h2>
						&nbsp;&nbsp;&nbsp;
						<a href='input.jsp'>글쓰기 </a>
						<hr width='600' size='2' noshade>
						<table border='1' width='600' align='center' cellpadding='3'>
					
						<tr>
							<td width='100' align='center'>글번호</td>
							<td>${board.bnum}</td>
							</tr>
						<tr>
							<td align='center'>글쓴이</td>
							<td>${board.mname}</td>
						</tr>
						<tr>
							<td align='center'>카테고리</td> 
							<td>${board.bcategory}</td>
						</tr>
						<tr>
							<td align='center'>글제목</td>
							<td>${board.btitle}</td>
						</tr>
						<tr>
							<td align='center'>글내용</td>
							<td>${board.bcontent}</td>
						</tr>
						<tr>
							<td align='center'>조회수</td>
							<td>${board.bview}</td>
						</tr>
						
						</table>
						
						<hr width='600' size='2' noshade>
						<hr width='600' size='2' noshade>
						<b>
						<% Board board = (Board)request.getAttribute("board");
						   long writer_mnum = board.getMnum();
						   long session_mnum = (Long)session.getAttribute("usermnum");
						%>
						<% if(writer_mnum==session_mnum){ %>
						<a  href='board.do?m=update&bnum=${board.bnum}&mname=${name}'>수정</a>
						 | 
						 
						<a href='board.do?m=del&bnum=${board.bnum}'>삭제</a> 
						 | 
						<%}%>
						<a href='board.do'>목록</a>
						</b>
						<hr width='600' size='2' noshade> 
						<form name="input" method="post" action="../board/reply.do?m=insert&bnum=${board.bnum}">
							댓글을 달아주세요▶<input type='text' name='rcontent' size='70%'>
							<input type="submit" value="전송" onclick="check()" hidden>
						</form>
						<hr width='600' size='2' noshade>
						<table border='1' width='1000' align='center' cellpadding='2'>
						<tr>
							<th align='center' width='15%'>작성자</th>
							<th align='center' width='40%'>글내용</th>
							<th align='center' width='15%'>좋아요 갯수</th>
							<th align='center' width='15%'>작성일</th>
							<th align='center' width='30%'></th>
						</tr>
						
						<c:if test ="${empty rlist}">
									<tr>
										<td colspan="5" style ="text-align:center">데이터가 하나도없네요</td>				
									</tr>
						</c:if>
						<% long mnum = (Long)session.getAttribute("usermnum");
						   ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist");
						  
						   for(int i=0; i<rlist.size(); i++){
						%>
						
								<tr>
							<td align='center'><%=rlist.get(i).getMname()%></td>
							<td align='center'><%=rlist.get(i).getContent()%></td>
							<td align='center'><%=rlist.get(i).getR_like()%></td>
							<td align='center'><%=rlist.get(i).getRdate()%></td>
							<td align='center'>
							<% System.out.println("rlist의 mnum: "+rlist.get(i).getMnum()+"session에서가져온 mnum: "+mnum);
							if(rlist.get(i).getMnum()==mnum){ 
							%>
								<a href = 'reply.do?m=update1&rseq=<%=rlist.get(i).getRseq()%>&bnum=${board.bnum}'> 수정 </a>
								<a href='reply.do?m=del&rseq=<%=rlist.get(i).getRseq()%>&bnum=${board.bnum}'> 삭제 </a>
							<% } %>
							<a href='reply.do?m=r_like&rseq=<%=rlist.get(i).getRseq()%>&r_like=<%=rlist.get(i).getR_like()%>&bnum=${board.bnum}'> 좋아요 </a>
							</td>
						</tr>
						<% } %>
						</table>
<hr width='600' size='2' noshade>
						</center>
						
</body>
</html>