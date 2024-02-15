<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function deleteFn(no,reserveSeq,qty) {
		location.href = "${ctx}/reserveDelete.do?reserveSeq="+reserveSeq+"&no="+no+"&qty="+qty;
	}
</script>
<table border="1">
<tr>
<th>이미지</th>
<th>이름</th>
<th>대여일</th>
<th>대여기간</th>
<th>금액</th>
<th>수량</th>
<th>보험가입</th>
<th>와이파이</th>
<th>카시트</th>
<th>네비</th>
<th>삭제</th>
</tr>
<c:forEach var="vo" items="${views}">
<tr>
<td><img src="${ctx}/img/${vo.img}" width="50"></td>
<td>${vo.name}</td>
<td>${vo.rday}</td>
<td>${vo.dday}일</td>
<td>${(vo.price*vo.dday*vo.qty)+(vo.usein eq 1 ? vo.usein * 10000 : 0)+(vo.usewifi eq 1 ? vo.usewifi * 10000 : 0)+(vo.useseat eq 1 ? vo.useseat * 10000 : 0)}</td>
<td>${vo.qty}</td>
<td>${vo.usein eq 1 ? "적용" : "비적용"}</td>
<td>${vo.usewifi eq 1 ? "적용" : "비적용"}</td>
<td>${vo.usenavi eq 1 ? "적용" : "비적용"}</td>
<td>${vo.useseat eq 1 ? "적용" : "비적용"}</td>
<td><button onclick="deleteFn('${vo.no}','${vo.reserveSeq}','${vo.qty}')"
	<c:if test="${loginId == null and loginId!='admin'}"> 
disabled="disabled"
</c:if>/>삭제</button></td>
</tr>
</c:forEach>

</table>
</body>
</html>