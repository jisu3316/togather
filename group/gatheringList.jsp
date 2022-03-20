<%@ page contentType="text/html;charset=utf-8" import="java.util.ArrayList, team1.togather.domain.Gathering"%>
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
<%
	//long gSeq= Long.parseLong(request.getParameter("gSeq"));
	long gSeq = (Long)request.getAttribute("gatheringList_gSeq");
	System.out.println("gatheringList jsp안 : "+ gSeq);
%>

<center>
	<hr width='600' size='2' noshade>
	<h2>정모 목록</h2>
	&nbsp;&nbsp;&nbsp;
	<a href='groupTab.do?m=gatheringInput&gSeq=<%=gSeq%>'>정모 개설</a>
	&nbsp;&nbsp;&nbsp;
	<a href='groupTab.do?m=groupInfo&gSeq=<%=gSeq%>'>모임 정보</a>
	&nbsp;&nbsp;&nbsp;
	<a href='groupTab.do?m=groupList'>모임 목록</a>
	<hr width='600' size='2' noshade>
</center>
<table border='1' width='600' align='center' cellpadding='2'>
	<tr>
		<th align='center' width='20%'>정모 이름</th>
		<th align='center' width='20%'>정모 날짜</th>
		<th align='center' width='10%'>정모 시간</th>
		<th align='center' width='15%'>정모 장소</th>
		<th align='center' width='15%'>정모 비용</th>
		<th align='center' width='10%'>정원</th>
		<th align='center' width='10%'>삭제</th>
	</tr>
	<c:if test="${empty gatheringList}">
		<tr>
			<td colspan="7" style="text-align: center">모임이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach items="${gatheringList}" var="gathering">
		<tr>
			<td align='center'><a href="groupTab.do?m=gatheringGetUpdate&ga_seq=${gathering.ga_seq}">${gathering.ga_name}</a></td>
			<td align='center'>${gathering.ga_date}</td>
			<td align='center'>${gathering.time}</td>
			<td align='center'>${gathering.ga_place}</td>
			<td align='center'>${gathering.price}</td>
			<td align='center'>${gathering.ga_limit}</td>
			<td align='center'><a href='groupTab.do?m=gatheringDelete&ga_seq=${gathering.ga_seq}'>삭제</a></td>
		</tr>
	</c:forEach>
</table>
<hr width='600' size='2' noshade>

