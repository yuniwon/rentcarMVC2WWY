<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ONECAR Inspired Header</title>
<link rel="stylesheet" href="./css/header.css">
</head>
<body>
	<header class="header">
		<div class="container">
			<a href="${ctx}/main.jsp" class="logo">ONECAR</a>
			<nav class="navbar">
				<ul class="nav-menu">
					<li><a href="${ctx}/reservation.do">예약하기</a></li>
					<li><a href="${ctx}/mypage.do?id=${loginId}">마이페이지</a></li>
					<li><a href="#">이벤트</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</nav>
			<div class="header-right">
				<c:if test="${loginId eq null}">
					<a href="${ctx}/loginForm.do" class="login">로그인</a>
				</c:if>
				<c:if test="${loginId ne null}">
					<a href="${ctx}/logout.do" class="login">로그아웃</a>
				</c:if>
				<c:if test="${loginId eq null}">
					<a href="#" class="register">회원가입</a>
				</c:if>
				<c:if test="${loginId ne null}">
				<a href="#" class="register">회원정보수정</a>
				</c:if>

			</div>
		</div>
	</header>
</body>

</html>