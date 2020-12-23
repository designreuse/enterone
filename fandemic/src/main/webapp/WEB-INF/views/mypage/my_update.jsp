<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">

/* 수정 테이블 스타일 */
.myinfo {
	width: 100%
}

/* readonly 스타일 */
.readolytexttd {
	
}

.tilt {
	width: 140px;
	margin: 5%
}

/*수정가능한 text필드*/
.updatetext {
	
}
/*수정불가능한 text필드*/
.readolytext {
	
}
</style>
</head>
<body>
	<section class="single">
		<div class="container">
			<div class="row">
				<div class="col-md-8" style="margin-left: 30%">
					<div class="line">
						<div>내정보 수정</div>
					</div>
					<table class="myinfo">
						<tr>
							<td class="tilt"><b>사진</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>아이디</b></td>
							<td class="readolytexttd"><input type="text"
								class="readolytext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>비밀번호</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>비밀번호확인</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>이름</b></td>
							<td class="readolytexttd"><input type="text"
								class="readolytext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>생년월일</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>



						<tr>
							<td class="tilt"><b>휴대폰 번호</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>이메일</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>

						<tr>
							<td class="tilt"><b>우편번호</b></td>
							<td class="readolytexttd"><input type="text"
								class="readolytext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>주소</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>가입일</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
					</table>

					<div class="row">
						<h1>쪽지 나오는곳</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
