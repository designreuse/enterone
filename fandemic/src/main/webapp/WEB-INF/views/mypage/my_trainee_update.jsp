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
				<div class="col-md-8">
					<table class="myinfo">
						<tr>
							<td class="tilt"><b>활동사진</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>활동닉네임</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>지원분야1</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>
						<tr>
							<td class="tilt"><b>지원분야2</b></td>
							<td class="readolytexttd"><input type="text"
								class="updatetext"></td>
						</tr>

						<tr>
							<td class="tilt"><b>소개</b></td>
							<td class="readolytexttd"><textarea class="updatetext"></textarea></td>
						</tr>

						<tr>
							<td colspan="2"><b>수정하기</b></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
