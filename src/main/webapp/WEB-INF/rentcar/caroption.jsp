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
<body>
	<div class="carCont">
		<h1>차량정보</h1>
		<div class="carInfo">
			<div class="image">
				<h3>대여옵션 선택</h3>
				<p>
					<img src="${ctx}/img/${car.img}" width="500">
				</p>
				<p>하루 렌트당 가격 ${car.price} 원</p>
			</div>
			<div class="info">
				<form action="${ctx}/reservationpro.do" method="post">
					<div class="col">
						대여기간 <select name="dday">
							<option value="1">1일</option>
							<option value="2">2일</option>
							<option value="3">3일</option>
							<option value="4">4일</option>
							<option value="5">5일</option>
							<option value="6">6일</option>
							<option value="7">7일</option>
						</select>
					</div>
					<div class="col">
						대여일 <input type="date" name="rday" id="today" />
					</div>
					<script>
						document.getElementById("today").value = new Date()
								.toISOString().substring(0, 10);
					</script>
					<div class="col">
						보험적용 <select name="usein">
							<option value="1">적용(1일 1만원)</option>
							<option value="2">비적용</option>
						</select>
					</div>
					<div class="col">
						WIFI 적용 <select name="usewifi">
							<option value="1">적용(1일 1만원)</option>
							<option value="2">비적용</option>
						</select>
					</div>
					<div class="col">
						네비게이션 적용 <select name="usenavi">
							<option value="1">적용(무료)</option>
							<option value="2">비적용</option>
						</select>
					</div>
					<div class="col">
						베이비시트 적용 <select name="useseat">
							<option value="1">적용(1일 1만원)</option>
							<option value="2">비적용</option>
						</select>
					</div>
					<input type="hidden" name="no" value="${car.no}" /> 
					<input type="hidden" name="id" value="${loginId}" />
					<input type="hidden" name="qty" value="${qty}" />
					<button>차량예약하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>