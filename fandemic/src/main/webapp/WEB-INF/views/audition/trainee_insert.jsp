<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.form-group {
margin-bottom :2rem;
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
<body>
	<section class="page">
		<div class="container">
			<!-- 탭 메뉴 상단 시작 -->
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">이용약관</li>
				<li class="tab-link" data-tab="tab-2">지원자 정보</li>
				<li class="tab-link" data-tab="tab-3">지원서 입력</li>
				<li class="tab-link" data-tab="tab-3">파일 업로드</li>
				<li class="tab-link" data-tab="tab-3">지원서 확인</li>
			</ul>
			<!-- 탭 메뉴 상단 끝 -->
			<!-- 탭 메뉴 내용 시작 -->
			<div id="tab-1" class="tab-content current">
			
<div class="section join">
                    <h3 class="required hr">이용약관</h3>

                    <div class="form-group">
                        <label class="title">개인정보 수집 및 이용 동의 (필수)</label>
                        <div class="agree box-agree">
                            
본인은 ㈜YG엔터테인먼트(이하 ‘회사’)가 본인이 오디션 지원을 통해 제공하는 개인정보를 아래와 같이 수집 및 이용함에 대하여 동의합니다.<br>
<br>
<table style="width: 100%; border: 1px solid #ddd;">
    <tbody><tr>
        <td style="border: 1px solid #ddd;">수집 및 이용목적</td>
        <td style="border: 1px solid #ddd;">▷ 오디션 지원자 식별 및 오디션 결과 통보</td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">수집 항목</td>
        <td style="border: 1px solid #ddd;">▷ (필수정보) 이름, 성별, 생년월일, 휴대폰 번호, E-MAIL, 국적, 주소, 신장, 체중, 지원자 사진, 지원자 영상</td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">보유 및 이용기간</td>
        <td style="border: 1px solid #ddd;">▷ 오디션 지원서 제출일부터 1년 동안<br>
        ▷ 오디션 지원자가 개인정보의 파기를 요청할 경우, 회사는 지체없이 해당 개인정보를 파기합니다. 단, 다른 법령에 따라 특정기간 동안 해당 개인정보를 보존해야 할 경우, 회사는 동 기간 동안 해당 개인정보를 안전하게 보유할 수 있습니다.
        </td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">동의를 거부할 권리 및 동의를 거부할 경우의 불이익</td>
        <td style="border: 1px solid #ddd;">▷ 오디션 지원자는 필수 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있는 권리가 있다. 단, 오디션 지원자가 이와 같이 동의를 거부할 경우 오디션 지원대상자에서 제외될 수 있습니다.</td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">개인정보 열람 및 수정할 권리</td>
        <td style="border: 1px solid #ddd;">▷ 오디션 지원자는 언제든지 개인정보에 대한 열람, 정정 또는 삭제를 요구 할 수 있으며, 회사는 해당 개인정보를 열람할 수 있도록 하거나 정정 또는 삭제를 위하여 필요한 조치를 하여야 합니다.<br>
        ▷ 오디션 지원자는 개인정보의 수집 및 이용 동의를 언제든 철회 할 수 있습니다.
        </td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">개인정보보호를 위한 회사의 노력</td>
        <td style="border: 1px solid #ddd;">▷ 회사는 모든 개인정보를 내부와 외부의 모든 위험으로부터 안전하게 보호해야 합니다.<br>
           ▷회사는 오디션 지원자의 동의 없이 수집된 개인정보를 제3자에게 제공하지 않습니다.<br>
        ▷회사는 개인정보 관련 문의사항을 위하여 개인정보보호책임자와 개인정보보호담당자를 지정하고 있습니다. 
        </td>
    </tr>
</tbody></table>                        </div>
                        <div class="form-group row">
                            <div class="col">
                                <div class="form-radio">
                                    <input type="radio" id="pro_terms_privacy_must_y" name="pro_terms_privacy_must_yn" value="Y" checked="checked">
                                    <label class="form-label" for="pro_terms_privacy_must_y">동의합니다.</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-radio">
                                    <input type="radio" id="pro_terms_privacy_must_n" name="pro_terms_privacy_must_yn" value="N">
                                    <label class="form-label" for="pro_terms_privacy_must_n">동의하지 않습니다.</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="title">개인정보 수집 및 이용 동의 (선택)</label>
                        <div class="agree box-agree">
                            
본인은 ㈜YG엔터테인먼트(이하 ‘회사’)가 본인이 오디션 지원을 통해 제공하는 개인정보를 아래와 같이 수집 및 이용함에 대하여 동의합니다.<br>
<br>
<table style="width: 100%; border: 1px solid #ddd;">
    <tbody><tr>
        <td style="border: 1px solid #ddd;">수집 및 이용목적</td>
        <td style="border: 1px solid #ddd;">▷ 오디션 지원자 식별 및 오디션 결과 통보</td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">수집 항목</td>
        <td style="border: 1px solid #ddd;">▷ (선택정보) 직업/소속, 어학능력, 취미/특기사항, 관련 활동 및 수상경력, 오디션 경험, 혈액형</td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">보유 및 이용기간</td>
        <td style="border: 1px solid #ddd;">▷ 오디션 지원서 제출일부터 1년 동안<br>
        ▷ 오디션 지원자가 개인정보의 파기를 요청할 경우, 회사는 지체없이 해당 개인정보를 파기합니다.  단, 다른 법령에 따라 특정기간 동안 해당 개인정보를 보존해야 할 경우, 회사는 동 기간 동안 해당 개인정보를 안전하게 보유할 수 있습니다.
        </td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">동의를 거부할 권리 및 동의를 거부할 경우의 불이익</td>
        <td style="border: 1px solid #ddd;">▷ 오디션 지원자는 선택 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있는 권리가 있다. 단, 오디션 지원자가 이와 같이 동의를 거부할 경우 해당 정보에 대한 가산점이 부가 되지 않을 수 있습니다.</td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">개인정보 열람 및 수정할 권리</td>
        <td style="border: 1px solid #ddd;">▷ 오디션 지원자는 언제든지 개인정보에 대한 열람, 정정 또는 삭제를 요구 할 수 있으며, 회사는 해당 개인정보를 열람할 수 있도록 하거나 정정 또는 삭제를 위하여 필요한 조치를 하여야 합니다.<br>
            ▷ 오디션 지원자는 개인정보의 수집 및 이용 동의를 언제든 철회 할 수 있습니다.
        </td>
    </tr>
    <tr>
        <td style="border: 1px solid #ddd;">개인정보보호를 위한 회사의 노력</td>
        <td style="border: 1px solid #ddd;">▷ 회사는 모든 개인정보를 내부와 외부의 모든 위험으로부터 안전하게 보호해야 합니다.<br>
            ▷회사는 오디션 지원자의 동의 없이 수집된 개인정보를 제3자에게 제공하지 않습니다.<br>
            ▷회사는 개인정보 관련 문의사항을 위하여 개인정보보호책임자와 개인정보보호담당자를 지정하고 있습니다. 
        </td>
    </tr>
</tbody></table>                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-radio">
                                    <input type="radio" id="pro_terms_privacy_select_y" name="pro_terms_privacy_select_yn" value="Y">
                                    <label class="form-label" for="pro_terms_privacy_select_y">동의합니다.</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-radio">
                                    <input type="radio" id="pro_terms_privacy_select_n" name="pro_terms_privacy_select_yn" value="N" checked="checked">
                                    <label class="form-label" for="pro_terms_privacy_select_n">동의하지 않습니다.</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


			</div>
			<div id="tab-2" class="tab-content">
				<h1>탭 메뉴 2 내용입니다.</h1>
				<p>근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다. 국가는 청원에 대하여
					심사할 의무를 진다. 이 헌법공포 당시의 국회의원의 임기는 제1항에 의한 국회의 최초의 집회일 전일까지로 한다. 모든
					국민은 직업선택의 자유를 가진다. 모든 국민은 언론·출판의 자유와 집회·결사의 자유를 가진다. 저작자·발명가·과학기술자와
					예술가의 권리는 법률로써 보호한다. 대통령은 법률안의 일부에 대하여 또는 법률안을 수정하여 재의를 요구할 수 없다.
					국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 이 헌법시행 당시의
					법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다.</p>

				<p>정기회의 회기는 100일을, 임시회의 회기는 30일을 초과할 수 없다. 훈장등의 영전은 이를 받은 자에게만
					효력이 있고, 어떠한 특권도 이에 따르지 아니한다. 모든 국민은 헌법과 법률이 정한 법관에 의하여 법률에 의한 재판을
					받을 권리를 가진다. 모든 국민은 양심의 자유를 가진다. 법관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는
					파면되지 아니하며, 징계처분에 의하지 아니하고는 정직·감봉 기타 불리한 처분을 받지 아니한다. 이 헌법시행 당시에 이
					헌법에 의하여 새로 설치될 기관의 권한에 속하는 직무를 행하고 있는 기관은 이 헌법에 의하여 새로운 기관이 설치될 때까지
					존속하며 그 직무를 행한다.</p>
			</div>
			<div id="tab-3" class="tab-content">
				<h1>탭 메뉴 3 내용입니다.</h1>
				<p>대한민국은 국제평화의 유지에 노력하고 침략적 전쟁을 부인한다. 국군의 조직과 편성은 법률로 정한다. 타인의
					범죄행위로 인하여 생명·신체에 대한 피해를 받은 국민은 법률이 정하는 바에 의하여 국가로부터 구조를 받을 수 있다. 모든
					국민은 법률이 정하는 바에 의하여 공무담임권을 가진다. 모든 국민은 소급입법에 의하여 참정권의 제한을 받거나 재산권을
					박탈당하지 아니한다.</p>
			</div>
			<!-- 탭 메뉴 내용 끝 -->
		</div>
	</section>
</body>
</html>