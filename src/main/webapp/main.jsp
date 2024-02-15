<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="./css/style.css"> -->
</head>
<style>
body {
	display: flex;
	justify-content: center;
}
</style>
<body>
	<div class="main">
		<jsp:include page="/WEB-INF/rentcar/header2.jsp" />
		<c:set var="center"
			value="${center != null ? center : 'rentcar/center.jsp'}" />
		<!-- 센터에 들어갈 페이지를 다른곳에서 불러온다. -->
		<jsp:include page="/WEB-INF/${center}" />
		<jsp:include page="/WEB-INF/rentcar/footer.jsp" />
	</div>
</body>
</html>
