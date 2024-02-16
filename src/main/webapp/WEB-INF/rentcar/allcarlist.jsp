<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량정보관리</title>
</head>
<body>
<script type="text/javascript">
// 차량정보 삭제
	function deleteFn(no) {
		location.href = "${ctx}/carDelete.do?no="+no;
	}
// 차량정보 수정
	function modifyFn(no) {
		location.href = "${ctx}/carInfoUpdate.do?no="+no;
	}
//신차등록
		function newcarFn(no) {
		location.href = "${ctx}/carInfoUpdate.do";
	}
</script>
<table border="1">
<tr><td colspan="10"><button style="width: 100%; height: 100px;" onclick="newcarFn()"><h2>새로운 차량 등록</h2></button></td></tr>
 <tr>
<th>이미지</th>
<th>이름</th>
<th>차종</th>
<th>가격</th>
<th>승차인원</th>
<th>차량보유대수</th>
<th>제조회사</th>
<th>차량정보</th>
<th>삭제</th>
<th>정보수정</th>
</tr>
<c:forEach var="vo" items="${cars}">
<tr>
<td><img src="${ctx}/img/${vo.img}" width="50"></td>
<td>${vo.name}</td>
<td>${vo.category eq 1 ? "소형" : vo.category eq 2 ? "중형" : vo.category eq 3 ? "대형" : vo.category}</td>
<td>${vo.price}원</td>
<td>${vo.usepeople}명</td>
<td>${vo.totalQty}대</td>
<td>${vo.company}</td>
<td>${vo.info}</td>
<td><button onclick="deleteFn('${vo.no}')">삭제</button></td>
<td><button onclick="modifyFn('${vo.no}')">수정</button></td>
</tr>
</c:forEach>

</table>
</body>
</html>