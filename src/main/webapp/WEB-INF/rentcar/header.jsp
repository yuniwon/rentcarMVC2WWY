<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/rentcarMVC2WWY/css/style.css">
<style>

</style>
</head>
<body>

	<header>
		<div class="inner" align="center">
		<ul><li>
			<a href="${ctx}/main.jsp" class="logo">ONECAR</a>
		</li>
		</ul>
			<div id="gnb">
				<ul>
					<li><a href="${ctx}/reservation.do">예약하기</a></li>
					<li><a href="">마이페이지</a></li>
					<li><a href="">이벤트</a></li>
					<li><a href="">고객센터</a></li>

				</ul>
			</div>
			
			<!-- 만약 로그인되어있지 않다면  -->
			<c:if test="${loginId eq null}">
			<a href="${ctx}/loginForm.do">로그인</a>
			</c:if>
			<c:if test="${loginId ne null}">
			<a href="${ctx}/logout.do">로그아웃</a>
			</c:if>
			
		<!-- 로그인 되어있으면 -->
		</div>
	</header>

</body>
</html>