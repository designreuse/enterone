<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#pro_addr1 {
	width: 100%
}

#pro_postcode {
	width: 50%;
}

#pro_tall {
	width: 50%;
}

.table .table-hover {
	
}

.font-g {
	font-size: 15px;
}

.font-f {
	font-size: 20px;
	width: 20%;
	background-color: lightskyblue;
	font-weight: bold;
}

.jumbotron {
	text-align: left !important;
}

.wtitle {
	font-size: 1em !important;
	font-weight: bold;
	color: blue;
	margin: 5px;
}

.qtitle {
	font-size: 2em !important;
}

table {
	border: 3px solid;
	border-color: black;
	width: 100%;
}

.agree box-agree {
	width: 100%;
	max-height: 300px;
	padding: 2rem;
	font-size: 1.2rem;
	line-height: 1.8rem;
	-webkit-transition: .1s ease-in-out;
	transition: .1s ease-in-out;
	background-color: #ffffff;
	border: 1px solid #c8c8c8;
	overflow-y: auto;
}

.form-group {
	margin-bottom: 2rem;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	display: inline-block;
	background: #898989;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #e0e0e0;
	color: #222;
}

.tab-content {
	display: none;
	background: #e0e0e0;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}
</style>
<script>
	$(function() {

		$("#btn_next_apply1").on("click", function() {

			var ok = agreeChk(); //변수=메소드()
			var agr = agChk();

			if (ok && agr) { //만약 이 메소드가 yes라면 
				$('.tab-content').removeClass('current');
				$('.tab-link').removeClass('current');

				$('.tab-link2').addClass('current');
				$("#tab-2").addClass('current');
			}
			//포커스

		});
		$("#btn_next_apply2").on("click", function() {

			$('.tab-content').removeClass('current');
			$('.tab-link2').removeClass('current');

			$('.tab-link3').addClass('current');
			$("#tab-3").addClass('current');

		});

		$("#btn_next_apply3").on("click", function() {

			$('.tab-content').removeClass('current');
			$('.tab-link3').removeClass('current');

			$('.tab-link4').addClass('current');
			$("#tab-4").addClass('current');

		});

		$("#btn_next_apply4").on("click", function() {

			$('.tab-content').removeClass('current');
			$('.tab-link4').removeClass('current');

			$('.tab-link5').addClass('current');
			$("#tab-5").addClass('current');

		});

		$("#btn_next_minus1").on("click", function() {

			$('.tab-content').removeClass('current');
			$('.tab-link2').removeClass('current');

			$('.tab-link').addClass('current');
			$("#tab-1").addClass('current');

		});

		$("#btn_next_minus2").on("click", function() {

			$('.tab-content').removeClass('current');
			$('.tab-link3').removeClass('current');

			$('.tab-link2').addClass('current');
			$("#tab-2").addClass('current');

		});

		$("#btn_next_minus3").on("click", function() {

			$('.tab-content').removeClass('current');
			$('.tab-link4').removeClass('current');

			$('.tab-link3').addClass('current');
			$("#tab-3").addClass('current');

		});

		$("#btn_next_minus4").on("click", function() {

			$('.tab-content').removeClass('current');
			$('.tab-link5').removeClass('current');

			$('.tab-link4').addClass('current');
			$("#tab-4").addClass('current');

		});
		
		$('#btn_search_postcode').click(function() {
			openDaumZipAddress($("#pro_postcode"),$("#pro_addr1"));
		});  
		

	});
	function agChk() {
		var ccc = $(':radio[name="pro_terms_privacy_must_yn"]:checked').val();
		if (ccc == 'N') {
			alert("약관에 동의하여 주십시오");
			return false;
		} else {
			return true;
		}
	}

	function agreeChk() {

		if ($(':radio[name="pro_terms_privacy_must_yn1"]:checked').length < 1) {
			//체크를 안했으니 0
			alert("약관에 체크 하셔야 다음 단계로 진행 가능합니다.");
			return false;

		} else {
			return true;
		}
	}
	//주소 찾기
	function openDaumZipAddress() {

		new daum.Postcode({

			oncomplete:function(data) {

				$(pro_postcode).val(data.zonecode); 

				$(pro_addr1).val(data.address); // 주소

			}

		}).open();
	}
</script>
<body>
	<section class="page">
		<div class="container">
			<!-- 탭 메뉴 상단 시작 -->
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">이용약관</li>
				<li class="tab-link2" data-tab="tab-2">지원자 정보</li>
				<li class="tab-link3" data-tab="tab-3">지원서 입력</li>
				<li class="tab-link4" data-tab="tab-4">파일 업로드</li>
				<li class="tab-link5" data-tab="tab-5">지원서 확인</li>
			</ul>
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div id="tab-1" class="tab-content current">

				<div class="section join">
					<h1 class="required hr">이용약관</h1>

					<div class="jumbotron">
						<div class="form-group">

							<h3 class="title">개인정보 수집 및 이용 동의 (필수)</h3>
							<div class="agree box-agree">

								본인은 ㈜YG엔터테인먼트(이하 ‘회사’)가 본인이 오디션 지원을 통해 제공하는 개인정보를 아래와 같이 수집 및
								이용함에 대하여 동의합니다.<br> <br>
								<table>
									<tbody>
										<tr>
											<td>수집 및 이용목적</td>
											<td>▷ 오디션 지원자 식별 및 오디션 결과 통보</td>
										</tr>
										<tr>
											<td>수집 항목</td>
											<td>▷ (필수정보) 이름, 성별, 생년월일, 휴대폰 번호, E-MAIL, 국적, 주소, 신장,
												체중, 지원자 사진, 지원자 영상</td>
										</tr>
										<tr>
											<td>보유 및 이용기간</td>
											<td>▷ 오디션 지원서 제출일부터 1년 동안<br> ▷ 오디션 지원자가 개인정보의 파기를
												요청할 경우, 회사는 지체없이 해당 개인정보를 파기합니다. 단, 다른 법령에 따라 특정기간 동안 해당
												개인정보를 보존해야 할 경우, 회사는 동 기간 동안 해당 개인정보를 안전하게 보유할 수 있습니다.
											</td>
										</tr>
										<tr>
											<td>동의를 거부할 권리 및 동의를 거부할 경우의 불이익</td>
											<td>▷ 오디션 지원자는 필수 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있는 권리가 있다.
												단, 오디션 지원자가 이와 같이 동의를 거부할 경우 오디션 지원대상자에서 제외될 수 있습니다.</td>
										</tr>
										<tr>
											<td>개인정보 열람 및 수정할 권리</td>
											<td>▷ 오디션 지원자는 언제든지 개인정보에 대한 열람, 정정 또는 삭제를 요구 할 수 있으며,
												회사는 해당 개인정보를 열람할 수 있도록 하거나 정정 또는 삭제를 위하여 필요한 조치를 하여야 합니다.<br>
												▷ 오디션 지원자는 개인정보의 수집 및 이용 동의를 언제든 철회 할 수 있습니다.
											</td>
										</tr>
										<tr>
											<td>개인정보보호를 위한 회사의 노력</td>
											<td>▷ 회사는 모든 개인정보를 내부와 외부의 모든 위험으로부터 안전하게 보호해야 합니다.<br>
												▷회사는 오디션 지원자의 동의 없이 수집된 개인정보를 제3자에게 제공하지 않습니다.<br> ▷회사는
												개인정보 관련 문의사항을 위하여 개인정보보호책임자와 개인정보보호담당자를 지정하고 있습니다.
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="form-group row">

								<div class="col">
									<div class="form-radio"
										style="float: left; margin-left: 400px;">
										<input type="radio" id="pro_terms_privacy_must_y"
											name="pro_terms_privacy_must_yn" value="Y" checked="checked">
										<label class="form-label" for="pro_terms_privacy_must_y">동의합니다.</label>
									</div>
								</div>
								<div class="col">
									<div class="form-radio"
										style="float: right; margin-right: 400px;">
										<input type="radio" id="pro_terms_privacy_must_n"
											name="pro_terms_privacy_must_yn" value="N"> <label
											class="form-label" for="pro_terms_privacy_must_n">동의하지
											않습니다.</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="jumbotron">
						<div class="form-group">
							<h3 class="title">개인정보 수집 및 이용 동의 (선택)</h3>
							<div class="agree box-agree">

								본인은 ㈜YG엔터테인먼트(이하 ‘회사’)가 본인이 오디션 지원을 통해 제공하는 개인정보를 아래와 같이 수집 및
								이용함에 대하여 동의합니다.<br> <br>
								<table>
									<tbody>
										<tr>
											<td>수집 및 이용목적</td>
											<td>▷ 오디션 지원자 식별 및 오디션 결과 통보</td>
										</tr>
										<tr>
											<td>수집 항목</td>
											<td>▷ (선택정보) 직업/소속, 어학능력, 취미/특기사항, 관련 활동 및 수상경력, 오디션 경험,
												혈액형</td>
										</tr>
										<tr>
											<td>보유 및 이용기간</td>
											<td>▷ 오디션 지원서 제출일부터 1년 동안<br> ▷ 오디션 지원자가 개인정보의 파기를
												요청할 경우, 회사는 지체없이 해당 개인정보를 파기합니다. 단, 다른 법령에 따라 특정기간 동안 해당
												개인정보를 보존해야 할 경우, 회사는 동 기간 동안 해당 개인정보를 안전하게 보유할 수 있습니다.
											</td>
										</tr>
										<tr>
											<td>동의를 거부할 권리 및 동의를 거부할 경우의 불이익</td>
											<td>▷ 오디션 지원자는 선택 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있는 권리가 있다.
												단, 오디션 지원자가 이와 같이 동의를 거부할 경우 해당 정보에 대한 가산점이 부가 되지 않을 수 있습니다.</td>
										</tr>
										<tr>
											<td>개인정보 열람 및 수정할 권리</td>
											<td>▷ 오디션 지원자는 언제든지 개인정보에 대한 열람, 정정 또는 삭제를 요구 할 수 있으며,
												회사는 해당 개인정보를 열람할 수 있도록 하거나 정정 또는 삭제를 위하여 필요한 조치를 하여야 합니다.<br>
												▷ 오디션 지원자는 개인정보의 수집 및 이용 동의를 언제든 철회 할 수 있습니다.
											</td>
										</tr>
										<tr>
											<td>개인정보보호를 위한 회사의 노력</td>
											<td>▷ 회사는 모든 개인정보를 내부와 외부의 모든 위험으로부터 안전하게 보호해야 합니다.<br>
												▷회사는 오디션 지원자의 동의 없이 수집된 개인정보를 제3자에게 제공하지 않습니다.<br> ▷회사는
												개인정보 관련 문의사항을 위하여 개인정보보호책임자와 개인정보보호담당자를 지정하고 있습니다.
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col">
									<div class="form-radio"
										style="float: left; margin-left: 400px;">
										<input type="radio" id="pro_terms_privacy_must_y"
											name="pro_terms_privacy_must_yn1" value="Y"> <label
											class="form-label" for="pro_terms_privacy_must_y">동의합니다.</label>
									</div>
								</div>
								<div class="col">
									<div class="form-radio"
										style="float: right; margin-right: 400px;">
										<input type="radio" id="pro_terms_privacy_must_n"
											name="pro_terms_privacy_must_yn1" value="N"> <label
											class="form-label" for="pro_terms_privacy_must_n">동의하지
											않습니다.</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2 col-sm-2 col-xs-2">
									<button class="btn btn-primary" id="btn_save_apply">지원서
										저장</button>
								</div>
								<div class="col-md-1 col-sm-1 col-xs-1">
									<button class="btn btn-primary" id="btn_cancle_apply">지원
										취소</button>
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7"></div>
								<div class="col-md-2 col-sm-2 col-xs-2">
									<button class="btn btn-primary" id="btn_next_apply1"
										rel="step2">다음 단계</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="tab-2" class="tab-content">
				<h1 class="required hr" style="align: center">지원자 정보</h1>
				<div class="jumbotron">

					<table class="table table-striped">
						<tbody>
							<tr>

								<td class="font-f">이름</td>
								<td class="font-g">${member.mem_name}</td>

							</tr>
							<tr>

								<td class="font-f">성별</td>
								<td class="font-g">${member.mem_gender}</td>

							</tr>
							<tr>

								<td class="font-f">생년월일</td>
								<td class="font-g">${fn:substring(member.mem_birth,0,10)}</td>

							</tr>
							<tr>

								<td class="font-f">연락처</td>
								<td class="font-g">${member.mem_phone}</td>

							</tr>

							<tr>

								<td class="font-f">이메일</td>
								<td class="font-g">${member.mem_email}</td>

							</tr>

						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-primary" id="btn_save_apply">지원서
							저장</button>
					</div>
					<div class="col-md-1 col-sm-1 col-xs-1">
						<button class="btn btn-primary" id="btn_cancle_apply">지원
							취소</button>
					</div>
					<div class="col-md-5 col-sm-5 col-xs-5"></div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-primary" id="btn_next_minus1" rel="step2">이전
							단계</button>
					</div>

					<div class="col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-primary" id="btn_next_apply2" rel="step2">다음
							단계</button>
					</div>
				</div>
			</div>
			<div id="tab-3" class="tab-content">
				<h1>지원서 입력</h1>
				<div class="box box-light box-container">
					<div class="jumbotron">

						<h3>필수입력</h3>
						<form id="frm" name="frm" method="post"
							enctype="multipart/form-data" onsubmit="return false;">
							<input type="hidden" id="pro_last_save_step"
								name="pro_last_save_step" value="step3"> <input
								type="hidden" id="mem_idx" name="mem_idx" value="74402">
							<input type="hidden" id="adt_idx" name="adt_idx" value="1">
							<input type="hidden" id="pro_idx" name="pro_idx" value="77557">
							<table class="table table-hover">

								<tr>

									<td class="font-f">지원분야</td>
									<td>
										<div class="col">

											<select id="adf_idx" name="adf_idx" style="width: 50%">
												<option value="">지원분야 (1지망)</option>
												<option value="1">보컬</option>
												<option value="2">랩</option>
												<option value="3">댄스</option>
											</select>
										</div>
									</td>
									<td><div class="col">

											<select id="adf_idx" name="adf_idx" style="width: 50%">
												<option value="">지원분야 선택 (2지망)</option>
												<option value="1">보컬</option>
												<option value="2">랩</option>
												<option value="3">댄스</option>
											</select>
										</div></td>
									<td></td>
									<td></td>
								</tr>
								<tr>

									<td class="font-f">신장(cm)/체중(kg)</td>
									<td><div class="col">
											<input type="text" id="pro_tall" name="pro_tall"
												placeholder="신장 cm 단위. 숫자만 입력" maxlength="5"
												onkeydown="javascript:return only_num(event);"
												onkeyup="javascript:remove_char(event);"
												oninput="javascript:chk_num_len(this); return false;">
										</div></td>
									<td><div class="col">
											<input type="text" id="pro_tall" name="pro_weight"
												placeholder="체중 kg 단위. 숫자만 입력" maxlength="5"
												onkeydown="javascript:return only_num(event);"
												onkeyup="javascript:remove_char(event);"
												oninput="javascript:chk_num_len(this); return false;">
										</div></td>
									<td></td>
									<td></td>
								</tr>
								<tr>

									<td class="font-f">주소</td>

									<td>
										<div class="col">
											<input type="text" id="pro_postcode" name="pro_postcode"
												placeholder="우편번호">
									</td>
									<td><div class="col">
											<button class="button btn-primary" id="btn_search_postcode"
												style="width: 60%">우편번호찾기 (대한민국 한정)</button>
										</div></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2"><input type="text" id="pro_addr1"
										name="pro_addr1" placeholder="기본주소"></td>
									<td></td>
									<td></td>
								</tr>


								<tr>
									<td></td>
									<td colspan="2"><input type="text" id="pro_addr2"
										name="pro_addr2" placeholder="상세주소"></td>
									<td></td>
									<td></td>
								</tr>


								<tr>

									<td class="font-f">취미/특기</td>

									<td>
										<div class="col">
											<textarea id="pro_hobby" name="pro_hobby"
												aria-label="With textarea"
												placeholder="예시. 피아노,현대무용,미디,작곡 등"></textarea>
										</div>
									</td>
									<td></td>
									<td></td>
									<td></td>
								</tr>

							</table>
						</form>
					</div>

					<div class="jumbotron">
						<h3>선택입력</h3>
						<form id="frm" name="frm" method="post"
							enctype="multipart/form-data" onsubmit="return false;">
							<table class="table table-hover">
								<tr>

									<td class="font-f">직업</td>

									<td>
										<div class="col">
											<input id="pro_job" type="text" name="pro_job"
												placeholder="학생인 경우, 학교명/학년 기재" value="">
										</div>
									</td>
									<td></td>
									<td></td>
								</tr>


								<tr>
									<td class="font-f">혈액형</td>
									<td><select id="pro_blood_type" name="pro_blood_type">
											<option value="">혈액형을 선택하세요.</option>
											<option value="1">A형</option>
											<option value="2">B형</option>
											<option value="3">O형</option>
											<option value="4">AB형</option>
									</select></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td class="font-f">경력사항</td>
									<td><div class="col">
											<textarea id="pro_career" name="pro_career"
												aria-label="With textarea"
												placeholder="지원 분야 관련 대회 수상 경력, 방송 출연 경험, 연습생 경력 등 기재"></textarea>
										</div></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</form>
						<div class="row">
						<div class="col-md-2 col-sm-2 col-xs-2">
							<button class="btn btn-primary" id="btn_save_apply">지원서
								저장</button>
						</div>
						<div class="col-md-1 col-sm-1 col-xs-1">
							<button class="btn btn-primary" id="btn_cancle_apply">지원
								취소</button>
						</div>
						<div class="col-md-5 col-sm-5 col-xs-5"></div>
						<div class="col-md-2 col-sm-2 col-xs-2">
							<button class="btn btn-primary" id="btn_next_minus2" rel="step2">이전
								단계</button>
						</div>

						<div class="col-md-2 col-sm-2 col-xs-2">
							<button class="btn btn-primary" id="btn_next_apply3" rel="step2">다음
								단계</button>
						</div>
					</div>
					</div>
					
				</div>
			</div>
			<div id="tab-4" class="tab-content">

				<table class="table table-hover">


					<tr>
						<td class="font-f">프로필사진(필수)</td>
						<td colspan="2"><div class="invalid-feedback">
								<button class="btn btn-primary" id="btnfile">파일 첨부</button>


							</div></td>
						<td>- 과도한 보정이나 어플로 찍은 사진이 아닌 정면 사진 원본으로 첨부 (10MB 이하)</td>
						<td></td>
					</tr>
					<tr>

						<td class="font-f">사진 첨부(선택)</td>
						<td colspan="2"><div class="invalid-feedback">
								<button class="btn btn-primary" id="btnfile">파일 첨부</button>
								<br>

							</div></td>
						<td>- 상반신, 정면, 전신 등 본인의 사진을 추가로 첨부 - 과도한 보정이나 어플로 찍은 사진이 아닌
							정면 사진 원본으로 첨부 (10MB 이하)</td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">영상 첨부</td>
						<td><button class="btn btn-primary" id="btnfile">파일
								첨부(필수)</button></td>
						<td><div class="invalid-feedback">
								<button class="btn btn-primary" id="btnfile">파일 첨부(선택)</button></td>
						<td>- <strong>노래/랩 부문</strong>: 1분 30초 내에 밝은 곳, 얼굴 정면으로 상반신까지
							나오게 촬영한 노래/랩 영상 첨부<br> - <strong>댄스 부문</strong>: 1분 30초 내에
							밝은 곳, 전신이 나오게 촬영한 댄스 영상 첨부<br> - <strong>외모 부문</strong>: 1분
							내에 밝은 곳, 얼굴 정면으로 상반신까지 나오게 촬영한 자기소개 영상 첨부<br> - <strong>연기
								부문</strong>: 1분 내에 밝은 곳, 얼굴 정면으로 상반신까지 나오게 촬영한 자유연기 영상 첨부
						</td>
						<td></td>
					</tr>

				</table>


				<div class="row">
					<div class="col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-primary" id="btn_save_apply">지원서
							저장</button>
					</div>
					<div class="col-md-1 col-sm-1 col-xs-1">
						<button class="btn btn-primary" id="btn_cancle_apply">지원
							취소</button>
					</div>
					<div class="col-md-5 col-sm-5 col-xs-5"></div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-primary" id="btn_next_minus3" rel="step2">이전
							단계</button>
					</div>

					<div class="col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-primary" id="btn_next_apply4" rel="step2">다음
							단계</button>
					</div>
				</div>
			</div>


			<div id="tab-5" class="tab-content">
				<h3>내 지원서</h3>
				<table class="table table-hover">
					<tr>
						<td class="font-f">이름</td>
						<td>${member.mem_name}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">성별</td>
						<td>${member.mem_gender}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">생년월일</td>
						<td>${member.mem_birth}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">연락처</td>
						<td>${member.mem_phone}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">이메일</td>
						<td>${member.mem_email}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">신장/체중</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">주소</td>
						<td>${member.mem_address}</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				<br>

				<table class="table table-hover">
					<tr>
						<td class="font-f">직업</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">사용가능 언어 및 수준</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">취미/특기</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="font-f">경력사항</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>

				</table>
				<br>
				
				<table class="table table-hover">
					<tr>
						<td class="font-f">영상첨부(필수)</td>
						<td><div class="video-embed-area">
                                <video src="" controls="" muted=""></video>
                            </div></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
				</table>

				<div class="row">
					<div class="col-md-1 col-sm-1 col-xs-1">
						<button class="btn btn-primary" id="btn_cancle_apply">지원
							취소</button>
					</div>
					<div class="col-md-7 col-sm-7 col-xs-7"></div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-primary" id="btn_next_minus4" rel="step2">이전
							단계</button>
					</div>

					<div class="col-md-2 col-sm-2 col-xs-2">
						<button class="btn btn-primary" id="btn_next_apply4" rel="step2">최종
							지원</button>
					</div>
				</div>
			</div>
			<!-- 탭 메뉴 내용 끝 -->
		</div>
		</div>
	</section>
</body>
</html>