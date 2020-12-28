<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.jumbotron{
text-align:left !important;
}
.wtitle {
font-size: 1em !important;
font-weight:bold;
color:blue;
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

td {
	border: 1px solid;
	font-size: 15px;
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

		$("#btn_next_minus1").on("click", function() {
			
			$('.tab-content').removeClass('current');
			$('.tab-link').removeClass('current');

			$('.tab-link1').addClass('current');
			$("#tab-1").addClass('current');

	});
		
$("#btn_next_minus2").on("click", function() {
			
			$('.tab-content').removeClass('current');
			$('.tab-link').removeClass('current');

			$('.tab-link2').addClass('current');
			$("#tab-2").addClass('current');

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
<div class="jumbotron">
				<div class="section join form">
					<h3 class="required hr" style="margin:10px -20px;">지원자 정보</h3>

					<div class="form-group row">
						<label class="col-3 title qtitle">이름</label>
						<div class="col wtitle">${member.mem_name}</div>
					</div>

					<div class="form-group row">
						<label class="col-3 title qtitle">성별</label>
						<div class="col wtitle">${member.mem_gender}</div>
					</div>

					<div class="form-group row">
						<label class="col-3 title qtitle">생년월일</label>
						<div class="col wtitle">${fn:substring(member.mem_birth,0,10)}</div>
					</div>

					<div class="form-group row">
						<label class="col-3 title qtitle">연락처</label>
						<div class="col wtitle">${member.mem_phone}</div>
					</div>
					<div class="form-group row">
						<label class="col-3 title qtitle">이메일</label>
						<div class="col wtitle">${member.mem_email}</div>
					</div>
					<div class="form-group row">
						<label class="col-3 title qtitle">주소</label>
						<div class="col wtitle">${member.mem_address}</div>
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
				<form id="frm" name="frm" method="post" enctype="multipart/form-data" onsubmit="return false;">
        <input type="hidden" id="pro_last_save_step" name="pro_last_save_step" value="step3">
        <input type="hidden" id="mem_idx" name="mem_idx" value="74402">
        <input type="hidden" id="adt_idx" name="adt_idx" value="1">
        <input type="hidden" id="pro_idx" name="pro_idx" value="77557">
        
        <div class="section join form">
        <div class="jumbotron">
            <h3 class="required hr">필수입력</h3>

            <div class="form-group row">
                <label class="col-3 title">지원분야</label>
                <div class="col">

                    <select id="adf_idx" name="adf_idx">
                        <option value="">지원분야 선택 (1지망)</option>
                                                        <option value="1">보컬</option>
                                                        <option value="2">랩</option>
                                                        <option value="3">댄스</option>
                                                    </select>
                </div>
                <div class="col">
                    <select id="adf_idx_2nd" name="adf_idx_2nd">
                        <option value="">지원분야 선택 (2지망)</option>
                                                        <option value="1">보컬</option>
                                                        <option value="2">랩</option>
                                                        <option value="3">댄스</option>
                                                    </select>
                </div>
            </div>
			
            <div class="form-group row">
                <label class="col-3 title">신장(cm) / 체중(kg)</label>
                <div class="col">
                    <input type="text" id="pro_tall" name="pro_tall" placeholder="신장 cm 단위. 숫자만 입력" maxlength="5" onkeydown="javascript:return only_num(event);" onkeyup="javascript:remove_char(event);" oninput="javascript:chk_num_len(this); return false;" value="">
                </div>
                <div class="col">
                    <input type="text" id="pro_weight" name="pro_weight" placeholder="체중 kg 단위. 숫자만 입력" maxlength="5" onkeydown="javascript:return only_num(event);" onkeyup="javascript:remove_char(event);" oninput="javascript:chk_num_len(this); return false;" value="">
                </div>
            </div>

            <div class="row">
                <label class="col-3 title">주소</label>
                <div class="col">
                    <div class="form-group row">
                        <div class="col">
                            <input type="text" id="pro_postcode" name="pro_postcode" placeholder="우편번호" value="">
                            <input type="hidden" id="pro_addr_ext" name="pro_addr_ext" value="">
                        </div>
                        <div class="col">
                            <button class="button btn-block yg-black" id="btn_search_postcode">우편번호찾기 (대한민국 한정)</button>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <input type="text" id="pro_addr1" name="pro_addr1" placeholder="기본주소" value="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col">
                            <input type="text" id="pro_addr2" name="pro_addr2" placeholder="상세주소" value="">
                        </div>
                    </div>
                </div>
            </div>

        </div><!-- //section -->
</div>
        <input type="hidden" id="pro_terms_privacy_select_yn" name="pro_terms_privacy_select_yn" value="Y">
                        <div class="section join form">
           <div class="jumbotron">
            <h3 class="hr">선택입력</h3>
            
            <div class="form-group row">
                <label class="col-3 title">직업</label>
                <div class="col">
                    <input type="text" id="pro_job" name="pro_job" placeholder="학생인 경우, 학교명/학년 기재" value="">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-3 title">혈액형</label>
                <div class="col select-box">
                    <select id="pro_blood_type" name="pro_blood_type">
                        <option value="">혈액형을 선택하세요.</option>
                                                        <option value="1">A형</option>
                                                        <option value="2">B형</option>
                                                        <option value="3">O형</option>
                                                        <option value="4">AB형</option>
                                                    </select>
                </div>
            </div>

        <div class="form-group row">
            <label class="col-3 title">취미/특기</label>
            <div class="col">
                <textarea id="pro_hobby" name="pro_hobby" aria-label="With textarea" placeholder="예시. 피아노,현대무용,미디,작곡 등"></textarea>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-3 title">경력사항</label>
            <div class="col">
                <textarea id="pro_career" name="pro_career" aria-label="With textarea" placeholder="지원 분야 관련 대회 수상 경력, 방송 출연 경험, 연습생 경력 등 기재"></textarea>
            </div>
        </div>
        	
</div><!-- //section -->
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

</form>
			</div>
			<!-- 탭 메뉴 내용 끝 -->
		</div>
		</div>
	</section>
</body>
</html>