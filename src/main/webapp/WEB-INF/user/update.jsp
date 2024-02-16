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
	<c:if test="${m eq null}">
		<h1 class="py-3">일치하는 회원이 없습니다</h1>
	</c:if>
	<c:if test="${m ne null}">
		<h1 class="py-3">${m.id}회원의상세보기</h1>
		<form name="memberForm" action="${ctx}/memberUpdatepro.do"
			method="post">
			<input type="hidden" name="id" value="${m.id}" />
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td class="left">${m.id}</td>
					
				</tr>
				<tr>
					<td>비밀번호</td>
					<td class="left">${m.pw}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2"><input class="col-12" type="text" name="email" value="${m.email}" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td colspan="2"><input class="col-12" type="text" name="tel" value="${m.tel}" /></td>
				</tr>
				<tr>
					<td>취미</td>
					<td colspan="2"><input class="col-12" type="text" name="hobby" value="${m.hobby}" /></td>
				</tr>
				<tr>
					<td>직업</td>
					<td colspan="2"><input class="col-12" type="text" name="job" value="${m.job}" /></td>
				</tr>
				<tr>
					<td>나이</td>
					<td colspan="2"><input class="col-12" type="text" name="age" value="${m.age}" /></td>
				</tr>
				<tr>
					<td>소개</td>
					<td colspan="2" height=200><textarea 
							style='height: 200px;' name="info">${m.info}
				</textarea></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="button" value="수정"
						class="col-3 btn btn-primary" onclick="validCheck(form)" /> <input
						type="reset" value="취소" class="col-3 btn btn-warning" /></td>
			</table>
		</form>
		</c:if>
</body>
</html>
<script>
	let check = 0;
	function validCheck(form) {

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

		alert("회원수정 성공!")
		form.submit();
	}


</script>