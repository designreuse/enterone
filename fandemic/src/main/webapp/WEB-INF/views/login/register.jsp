<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<section class="login first grey">
			<div class="container">
				<div class="box-wrapper">				
					<div class="box box-border">
						<div class="box-body">
							<h4>회원가입</h4>
							<form id="memFrm" name="memFrm" method="post">
								<div class="form-group">
									<div style="text-align: right;">
										<input type="radio" id="gender" name="gender" value="남" class="gender" checked="checked"> &nbsp; 남 &nbsp;&nbsp;
										<input type="radio" id="gender" name="gender" value="여" class="gender" > &nbsp; 여 &nbsp;&nbsp;
									</div>
									
									<label>아이디</label>
									<input type="text" name="memId" id="memId" class="form-control">
	
								</div>
								<div class="form-group">
									<label>이름</label>
									<input type="text" name="memName" id="memName" class="form-control">
								</div>
								
								<div class="form-group">
									<label class="fw">비밀번호</label>
									<input type="password" id="memPw" name="memPw" class="form-control">
								</div>
								
								<div class="form-group">
									<label>생년월일</label>
									<input type="date" name="memBirth" id="memBirth" class="form-control">
								</div>
								
								<div class="form-group">
									<label>연락처</label>
									<input type="text" name="memPhone" id="memPhone" class="form-control">
								</div>

								<div class="form-group">
									<label>이메일</label>
									<input type="text" id="memEmail" name="memEmail" class="form-control">
								</div>
								
								<div class="form-group">
									<label>주소</label>
									<input type="text" id="memAddr1" name="memAddr1" class="form-control">
									<input type="text" id="memAddr2" name="memAddr2" class="form-control">
								</div>
									
								<div class="form-group text-right">
									<button class="btn btn-primary btn-block">가입</button>
								</div>
								<div class="form-group text-right">
									<a href="login">로그인</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>