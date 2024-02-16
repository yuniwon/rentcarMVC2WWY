<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!-- <!DOCTYPE html> -->
<!-- <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> -->
<link rel="stylesheet" href="${ctx}/css/login.css">
<link rel="stylesheet" href="${ctx}/css/style.css">
<!-- </head>
<body> -->
<div class="login-container" >
  <form action="${ctx}/login.do" method="post">
    <h2>로그인</h2>
    <div class="input-group">
      <input type="text" name="id" required>
      <label>아이디</label>
    </div>
    <div class="input-group">
      <input type="password" name="pw" required>
      <label>비밀번호</label>
    </div>
    <button type="submit">로그인</button>
  </form>
</div>
<!-- </body>
</html> -->