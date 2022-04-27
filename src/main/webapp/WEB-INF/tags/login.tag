<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:choose>
	<c:when test="${id==null}">
		<ul class="icons">
			<li><a href="login.jsp" class="button">LOGIN</a></li>
		</ul>
	</c:when>
	<c:otherwise>
	
		<ul class="icons">
		<li><a href="boardinsert.jsp" class="button primary">글쓰기</a></li>
			<li><a href="mypage.do" class="button primary">MY PAGE</a></li>
			<li><a href="logout.do" class="button primary">LOGOUT</a></li>
		</ul>
	</c:otherwise>
</c:choose>