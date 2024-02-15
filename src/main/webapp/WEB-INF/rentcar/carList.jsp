<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="./css/style.css"> -->
</head>
<body>
<div class="carlist">
검색창
<form action="${ctx}/carCategory.do" method="post">
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select>
		<input type="submit" value="검색" />&nbsp;&nbsp;
</form>
<button onclick="location.href='${ctx}/reservation.do'">전체 검색</button>
<table>
<tr>
<th>
이름
</th>
<th>사진</th>
<th>차종</th>
<th>가격</th>
<th>예약가능 수량</th>
</tr>
<c:forEach var="vo" items="${list}">
<tr>
<td>
  <a>${vo.name}</a>
</td>
<td>
<a href="${ctx}/carinfo.do?num=${vo.no}">
  <img alt="" src="${ctx}/img/${vo.img}" width="300" height="220">
</a>
</td>
<td>
<c:if test="${vo.category eq 1}">
소형
</c:if>
<c:if test="${vo.category eq 2}">
중형
</c:if>
<c:if test="${vo.category eq 3}">
대형
</c:if>
  </td>
</tr>
  </c:forEach>
</table>
</div>
</body>
</html>