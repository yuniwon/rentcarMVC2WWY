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
<c:set var="tPrice" value="${car.price*resvo.qty *resvo.dday}" />
<c:set var="oPrice" value="${((resvo.usein eq 1 ? resvo.usein * 10000 : 0)+(resvo.usewifi eq 1 ? resvo.usewifi * 10000 : 0)+(resvo.useseat eq 1 ? resvo.useseat * 10000 : 0))*resvo.dday}" />
<c:set var="totalPrice" value="${tPrice+oPrice}" />

<h1>차량 예약이 완료되었습니다</h1>
<table border="1">
<tr>
<td>
<img src="${ctx}/img/${car.img}" width="500">
</td>
<td>
<h2>차량 예약일 : ${resvo.dday}일</h2>
<h2>차량 총 예약 금액 : ${tPrice}원  </h2>
<h2>차량 총 옵션금액 : ${oPrice}원 </h2>
<h2>합계 : ${totalPrice}원</h2>
</td>
</tr>
</table>
</body>
</html>