<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/info.css">
</head>
<c:if test="${car.totalQty eq 0}">
<script>
alert("현재 예약가능한 차량이 없습니다.");
location.href="${ctx}/reservation.do"; 
</script>
</c:if>
<c:if test="${loginId eq null}">
<script>
alert("로그인 후 예약가능합니다.");
location.href="${ctx}/loginForm.do"; 
</script>
</c:if>
</script>
<body>
	<div class="carCont">
		<h1>차량정보</h1>
		<div class="carInfo">
			<div class="image">
				<img src="${ctx}/img/${car.img}" width="500">
			</div>
			<div class="info">
				<form action="${ctx}/selectedcar.do?num=${car.no}" method="post">
					<div class="col">차량이름 ${car.name}</div>
					<div class="col">총 승차인원 ${car.usepeople}</div>
					<div class="col">차량수량 <select name="qty">
					<c:forEach begin="1" end="${car.totalQty}" step="1" varStatus="status">
					<option value="${status.count}">${status.count}</option>
					</c:forEach>
					</select>
					</div>
					<div class="col">
						차량분류
						<c:if test="${car.category eq 1}">
소형
</c:if>
						<c:if test="${car.category eq 2}">
중형
</c:if>
						<c:if test="${car.category eq 3}">
대형
</c:if>
					</div>
					<div class="col">대여가격 ${car.price}
					</div>
					<div class="col">제조회사 ${car.company }
					</div>
					<button>옵션 선택 후 렌트하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>