<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>

<!-- 이미지 미리보기 -->
<script>
	function setThumbnail(event) {
		//파일이 비어있으면 돌아가기
		 if(event.target.files.length == 0) return;
		 //이미 선택한 파일이 있는경우 원래 미리보기를 지워줌
		  document.querySelector("#thumbnail").innerHTML = "";
		  
		let reader = new FileReader();

		reader.onload = function(event) {
			let img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.setAttribute("width", "200");
			document.querySelector("#thumbnail").appendChild(img); 
		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>

<body>
	<c:if test="${car ne null}">
		<h1 class="py-3">자동차 정보 수정</h1>
	</c:if>
	<c:if test="${car eq null}">
		<h1 class="py-3">자동차 등록</h1>
	</c:if>
	<form name="carForm" action="${ctx}/carUpload.do" method="post"
		enctype="multipart/form-data">
		<c:if test="${car.no ne null}"><input type="hidden" name="no" value="${car.no}" /></c:if>
		<table class="table table-bordered">
			<tr>
				<td>차량이름</td>
				<td colspan="1"><input class="col-12" type="text" id="name"
					name="name"
					<c:if test="${car.name ne null}"> value="${car.name}" </c:if> /></td>
			</tr>
			<tr>
				<td>차량 종류</td>
				<td colspan="1"><input
					<c:if test="${car.category ne null}"> value="${car.category}" </c:if>
					placeholder="1:소형 2:중형 3:대형" class="col-12" type="number"
					name="category" /></td>
			</tr>
			<tr>
				<td>렌트가격</td>
				<td colspan="1"><input
					<c:if test="${car.price ne null}"> value="${car.price}" </c:if>
					class="col-12" type="number" name="price" /></td>
			</tr>
			<tr>
				<td>승차인원</td>
				<td colspan="1"><input
					<c:if test="${car.usepeople ne null}"> value="${car.usepeople}" </c:if>
					class="col-12" type="number" name="usepeople" /></td>
			</tr>
			<tr>
				<td>렌트카 총 수량</td>
				<td colspan="1"><input
					<c:if test="${car.totalQty ne null}"> value="${car.totalQty}" </c:if>
					class="col-12" type="number" name="qty" /></td>
			</tr>
			<tr>
				<td>차량 회사 정보</td>
				<td colspan="1"><input
					<c:if test="${car.company ne null}"> value="${car.company}" </c:if>
					class="col-12" type="text" name="company" /></td>
			</tr>
			<tr>
				<td>차량 이미지</td>
				<td colspan="1" style="text-align: left;" ><input type="file"
					name="uploadFile" accept="image/*" onchange="setThumbnail(event);">
					<div id="thumbnail"><c:if test="${car.img ne null}"><img src="${ctx}/img/${car.img}" width="200"> </c:if></div>
					</td>
			</tr>
			<tr>
				<td>차량 정보</td>
				<td colspan="1" height=200><textarea placeholder="내용을 입력하세요"
						style='height: 200px; width: 100%;' name="info"><c:if test="${car.info ne null}"> ${car.info} </c:if>
				</textarea></td>
			</tr>
			<tr>
				
				<td colspan="2" align="center"><input type="button" value="등록"
					class="col-3 btn btn-primary" onclick="validCheck(form)" /> <input
					type="reset" value="취소" class="col-3 btn btn-warning" /></td>
		
		</table>
		
	</form>
</body>
</html>
<script>
	let check = 0;
	function validCheck(form) {

		if (!form.name.value.trim()) {
			alert("차량이름을 입력해주세요");
			form.name.focus();
			return false;
		}
		if (!form.category.value.trim()) {
			alert("종류를 입력해주세요");
			form.category.focus();
			return false;
		}

		if (!form.price.value.trim()) {
			alert("가격을 입력해주세요");
			form.price.focus();
			return false;
		}

		/*
		@ 앞에는 영어소문자,숫자 . _ % + - 만 허용
		@ 골뱅이 필수.
		@ 뒤 . 앞에는 영어소문자,숫자 . - 만 허용
		. 점 필수
		. 뒤에는 영어소문자 2자리 이상
		 */

		if (!form.usepeople.value.trim()) {
			alert("승차인원을 입력해주세요");
			form.usepeople.focus();
			return false;
		}

		if (Number(form.qty.value.trim()) < 1) {
			alert("렌트카 수량은 최소 1대 이상이어야 합니다");
			form.qty.focus();
			return false;
		}
		if (!form.company.value.trim()) {
			alert("회사정보를 입력해주세요");
			form.company.focus();
			return false;
		}

		if (!form.info.value.trim()) {
			alert("차량정보를 입력해주세요");
			form.info.focus();
			return false;
		}

		alert("차량등록 성공!")
		form.submit();
	}
	/* 
	 $("#checkId").click(function() {
	 if ($("#id").val()) {
	 let query = {
	 id : $("#id").val()
	 };

	 $.ajax({ // ajax 요청 명령어
	 type : "post", // 요청방식
	 url : "confirm.do",
	 data : query, // 위에서 만든 id값을 넣어줌
	 success : function(data) { // 요청페이지 호출 및 처리에 성공하면 다음 함수를 실행
	 if (data == 1) {
	 alert('사용할 수 없는 id 입니다');
	 $("#id").val(''); // 입력되어있는 값을 초기화
	 check = -1;
	 } else {
	 alert('사용 가능한 아이디입니다');
	 $("#passwd").focus();
	 check = 1;
	 }
	 ;// if문 끝
	 } // 성공 호출함수 끝
	 }) // ajax문 끝

	 } else { // 아이디 값이 비어있다면
	 alert("사용할 아이디를 입력해주세요")
	 $("#id").focus();
	 }

	 })
	 */
	//document.getElementById("checkId").addEventListener("keyup", (){
	//	document.getElementById("checkMessage").innerHTML = "아이디 중복체크를 해주세요";
	//})
	/* document
			.getElementById("id")
			.addEventListener(
					"keyup",
					function() {

						//아이디 길이는 4자 이상이어야 함
						if (document.getElementById("id").value.length < 4) {
							document.getElementById("checkMessage").innerHTML = "아이디는 4자 이상이어야 합니다";
							return;
						} else {
							document.getElementById("checkMessage").innerHTML = "";
						}
					}) */
</script>