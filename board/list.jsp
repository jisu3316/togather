<%@ page contentType="text/html;charset=utf-8" import="java.util.*, team1.togather.domain.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToGather 게시판</title>
 ${userid}님 환영합니다!
</head>
<script>
	window.onpageshow = function(event){
		if(event.persisted) || (window.performance && window.performance.naviation.type ==2)){
			location.href='board.do';
		}
	}
</script>
<body>
<% 	int pageAt = 1;
	if((Integer)request.getAttribute("pageAt")!=null){    
		pageAt = (Integer)request.getAttribute("pageAt");
	}
	int totalPage = (Integer)request.getAttribute("totalPage");  
	int ps = (Integer)request.getAttribute("ps");
	int ps2 =ps;
%>
<center>
	<h1>
		ToGather 게시판
	</h1>
	<a href = "../">인덱스</a>
	<a href = "board.do?m=input">글쓰기</a>
	<form  name="f" action="board.do">
		  <input type="hidden"  name="m" value="list">
		  <select name="ps" onChange="submit()">
            <option value="5" selected>페이지 SIZE 선택</option>
			<option value=5>페이지 SIZE 5</option>
			<option value=10>페이지 SIZE 10</option>
			<option value=15>페이지 SIZE 15</option>
			<option value=20>페이지 SIZE 20</option>
		  </select>
		</form>
	<form name="input2" method="post" action="board.do?m=olist&pageAt=<%=pageAt%>&ps=<%=ps2%>">
		<select name="option">
			<option value="none">===선택===</option>
			<option value="bcategory">카테고리</option>
			<option value="btitle">제목</option>
			<option value="mname">작성자</option>
		</select>
		<input type="text" name="ocontent">
		<input type="submit" value="전송" onclick="check()">
	</form>
	<table border='1' cellpadding='7' cellspacing='2' width='50%'>
	    <tr class="text-white font-weight-bold">
		    <th class="text-white font-weight-bold">글번호</th> 1
		    <th class="text-white font-weight-bold">카테고리</th> 2
			<th class="text-white font-weight-bold">제목</th> 3 
			<th class="text-white font-weight-bold">작성자</th> 4
			<th class="text-white font-weight-bold">조회수</th> 5 
			<th class="text-white font-weight-bold">등록일</th> 6 
		</tr>



<%  ArrayList<Board> blist =(ArrayList<Board>)request.getAttribute("blist");
	ArrayList<Board> wholeblist =(ArrayList<Board>)request.getAttribute("wholeblist");
	for(int i=0; i<blist.size(); i++){
%>
    <tr>
		<td class="text-white font-weight-bold" align='center'><%=blist.get(i).getBnum()%></td>
		<td class="text-white font-weight-bold" align='center'><%=blist.get(i).getBcategory()%></td>
		<td class="text-white font-weight-bold"><a href='reply.do?m=list&bnum=<%=blist.get(i).getBnum()%>&name=<%=blist.get(i).getMname()%>'><%=blist.get(i).getBtitle()%></a></td> 
		<td class="text-white font-weight-bold"><%=blist.get(i).getMname()%></td>
		<td class="text-white font-weight-bold"><%=blist.get(i).getBview()%></td>
		<td class="text-white font-weight-bold"><%=blist.get(i).getRdate()%></td>
	 </tr>
<%} %>

	</table>
	<table>
	<tr>
		  <td colspan="3" align="center">
			<% 
				if(pageAt != 1){
					int k = pageAt;
			%>
             <a href="board.do?m=list&pageAt=<%=k-1%>&ps=<%=ps2%>">
                ◀이전
			 </a>
          	 |<%} 
           		for(int i = 1; i<=totalPage; i++){
         	  %>
             <a href="board.do?m=list&pageAt=<%=i%>&ps=<%=ps2%>">
					<%=i %>
             </a> 
             <% }%>
		   |
		  	 <% 
		   		if(pageAt != totalPage){ 
		   			int k = pageAt;
		  	 %>
             <a href="board.do?m=list&pageAt=<%=k+1%>&ps=<%=ps2%>">
			    이후▶
			  </a>
			<% } %>
			 &nbsp;&nbsp;&nbsp; 
			<%=pageAt%>page/<%=totalPage%>pages
		  </td>
		  <td colspan="2" align="center">
		  <% 
		  	 int wholeblistSize = wholeblist.size();
		  %>
		    총 게시물 수 : <%=wholeblistSize%>
		  </td>
		</tr>
	  <hr width="600" color="Maroon" size="2" noshade>
	</table>
</center>
</body>
</html>