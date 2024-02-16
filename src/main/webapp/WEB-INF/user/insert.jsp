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
</head>
<body>
	<h1 class="py-3">회원 가입</h1>
	<form name="memberForm" action="${ctx}/memberUpload.do" method="post">
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td><input class="col-12" type="text" id="id" name="id"  /></td>
				<td><input type="button" value="중복체크" id="checkId"
					class="btn btn-outline-dark"><br>
					<div id="checkMessage"></div></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="2"><input class="col-12" type="password" name="pw" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="2"><input class="col-12" type="text" name="email" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td colspan="2"><input class="col-12" type="text" name="tel" /></td>
			</tr>
			<tr>
				<td>취미</td>
				<td colspan="2"><input class="col-12" type="text" name="hobby" /></td>
			</tr>
			<tr>
				<td>직업</td>
				<td colspan="2"><input class="col-12" type="text" name="job" /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td colspan="2"><input class="col-12" type="text" name="age" /></td>
			</tr>
			<tr>
				<td>소개</td>
				<td colspan="2" height=200><textarea placeholder="내용을 입력하세요"
						style='height: 200px;' name="content">
				</textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="button" value="가입"
					class="col-3 btn btn-primary" onclick="validCheck(form)" /> <input
					type="reset" value="취소" class="col-3 btn btn-warning" /></td>
		</table>
	</form>


</body>
</html>
<script>
	let check = 0;
	function validCheck(form) {

		if (!form.id.value.trim()) {
			alert("아이디를 입력해주세요");
			form.id.focus();
			return false;
		}
		if (!form.pw.value.trim()) {
			alert("패스워드를 입력해주세요");
			form.id.focus();
			return false;
		}

		if (!form.age.value.trim()) {
			alert("나이를 입력해주세요");
			form.age.focus();
			return false;
		} else {
			if (Number(form.age.value.trim()) < 10
					|| Number(form.age.value.trim()) > 99) {
				alert("나이 값(10-99)을 정확하게 입력하세요");
				form.age.focus();
				return false;
			}
		}

		/*
		@ 앞에는 영어소문자,숫자 . _ % + - 만 허용
		@ 골뱅이 필수.
		@ 뒤 . 앞에는 영어소문자,숫자 . - 만 허용
		. 점 필수
		. 뒤에는 영어소문자 2자리 이상
		 */

		if (!form.email.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/)) {
			alert("이메일 형식이 다릅니다");
			form.email.value = "test@test.com";
			form.email.focus();
			return false;
		}

		if (!form.tel.value.match(/010-\d{3,4}-\d{4}/)) {
			alert("전화번호 형식이 다릅니다");
			form.phone.value = "010-1234-1234";
			form.phone.focus();
			return false;
		}

		if (check == 0) {
			alert('id 중복체크 해주세요');
			return false;
		} else if (check == -1) {
			alert('id 중복체크 다시하세요');
			return false;
		}

		alert("회원가입 성공!")
		form.submit();
	}

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

	//document.getElementById("checkId").addEventListener("keyup", (){

	//	document.getElementById("checkMessage").innerHTML = "아이디 중복체크를 해주세요";
	//})
	document
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
					})
</script>