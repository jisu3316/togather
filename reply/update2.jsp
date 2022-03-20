<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
					if(${flag}){
                    	alert("수정성공");
                    }else{
                    	alert("수정실패");
                    }
                    location.href='reply.do';
</script>