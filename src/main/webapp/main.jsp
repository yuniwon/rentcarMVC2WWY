<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" />
</head>

<body>
<div align="center">
<%-- <c:set var="center" value="${param.center != null ? param.center : '/WEB-INF/rentcar/center.jsp'}" />
 --%><jsp:include page="/WEB-INF/rentcar/header.jsp" />
<%-- <jsp:include page="/WEB-INF/${center}" />
 --%><jsp:include page="/WEB-INF/rentcar/footer.jsp" />

	</div>
</body>
</html>