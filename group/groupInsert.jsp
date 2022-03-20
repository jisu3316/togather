<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <script>
        if(${groupInsert}){
            alert("모임을 만들었습니다");
        }else {
        	alert("모임 만들기 실패");
        }
        location.href='../';
	</script>