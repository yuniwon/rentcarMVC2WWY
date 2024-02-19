<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>원렌트카에 오신것을 환영합니다</title>
<link rel="stylesheet" href="${ctx}/css/style.css"> 
</head>
<body>
	<div class="body-content">
		<%@ include file="/WEB-INF/rentcar/header.jsp"%>
		<c:set var="center"
			value="${center != null ? center : 'rentcar/center.jsp'}" />
		<!-- 센터에 들어갈 페이지를 다른곳에서 불러온다. -->
		<jsp:include page="/WEB-INF/${center}" />
	</div>
	<%@ include file="/WEB-INF/rentcar/footer.jsp"%>
</body>
</html>
