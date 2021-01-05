<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#rgoods").click(function() {
			$(".rgoods").toggle(1000);
		});
	});

	$(document).ready(function() {
		$("#rticket").click(function() {
			$(".rticket").toggle(1000);
		});
	});

	$(document).ready(function() {
		$("#goods").click(function() {
			$(".goods").toggle(1000);
		});
	});

	$(document).ready(function() {
		$("#ticket").click(function() {
			$(".ticket").toggle(1000);
		});
	});
</script>
<style type="text/css">
.sidebutton {
	width: 90%;
	margin: 1%;
}
</style>
</head>
<body>
	<section class="single">

		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="line">
						<div>
							<a id="rgoods">최근 굿즈 구매 내역</a>
						</div>
					</div>
					<div class="row rgoods">
						<div>
							<table style="width: 100%" border="1">
								<tr>
									<td colspan="2" width="70%">배송완료/배송중/배송준비중</td>
									<td width="30%" rowspan="2"><input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="배송조회"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="교환 신청"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="반품 신청"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="구매후기 쓰기"><br>
									</td>
								</tr>
								<tr>
									<td><img alt="상품이미지"
										src="https://thumbnail10.coupangcdn.com/thumbnails/remote/96x96ex/image/retail/images/2020/05/07/17/3/9d59a462-8680-4bc2-8ae4-f6177cd7193e.jpg">
									</td>
									<td align="right">
										<h5 style="margin-right: 5%">던킨 딸기 듬뿍 미니도넛 (냉동)</h5> <a
										style="margin-right: 20px">6,770원 · 1개</a> <input
										class="sidebutton btn-primary" style="margin-right: 5%;"
										type="button" onclick="location.href='#'" value="장바구니에 담기">
									</td>
								</tr>

							</table>




							s
						</div>
					</div>
					<div class="line">
						<div>
							<a id=goods>굿즈 구매 내역</a>
						</div>
					</div>
					<div class="row goods">
						<div>
							<table style="width: 100%" border="1">
								<tr>
									<td colspan="2" width="70%">배송완료/배송중/배송준비중</td>
									<td width="30%" rowspan="2"><input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="배송조회"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="교환 신청"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="반품 신청"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="구매후기 쓰기"><br>
									</td>
								</tr>
								<tr>
									<td><img alt="상품이미지"
										src="https://thumbnail10.coupangcdn.com/thumbnails/remote/96x96ex/image/retail/images/2020/05/07/17/3/9d59a462-8680-4bc2-8ae4-f6177cd7193e.jpg">
									</td>
									<td align="right">
										<h5 style="margin-right: 5%">던킨 딸기 듬뿍 미니도넛 (냉동)</h5> <a
										style="margin-right: 20px">6,770원 · 1개</a> <input
										style="margin-right: 5%" width="10%" type="button"
										onclick="location.href='#'" value="장바구니에 담기">
									</td>
								</tr>

							</table>
						</div>
					</div>


					<div class="line">
						<div>
							<a id="rticket">최근 예매 내역</a>
						</div>
					</div>
					<div class="row rticket">
						<div>
							<table style="width: 100%" border="1">
								<tr>
									<td colspan="2" width="70%">배송완료/배송중/배송준비중</td>
									<td width="30%" rowspan="2"><input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="배송조회"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="교환 신청"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="반품 신청"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="구매후기 쓰기"><br>
									</td>
								</tr>
								<tr>
									<td><img alt="상품이미지"
										src="https://thumbnail10.coupangcdn.com/thumbnails/remote/96x96ex/image/retail/images/2020/05/07/17/3/9d59a462-8680-4bc2-8ae4-f6177cd7193e.jpg">
									</td>
									<td align="right">
										<h5 style="margin-right: 5%">던킨 딸기 듬뿍 미니도넛 (냉동)</h5> <a
										style="margin-right: 20px">6,770원 · 1개</a> <input
										style="margin-right: 5%" width="10%" type="button"
										onclick="location.href='#'" value="장바구니에 담기">
									</td>
								</tr>

							</table>
						</div>
					</div>
					<div class="line">
						<div>
							<a id="ticket">예매 내역</a>
						</div>
					</div>
					<div class="row ticket">
						<div>
							<table style="width: 100%" border="1">
								<tr>
									<td colspan="2" width="70%">배송완료/배송중/배송준비중</td>
									<td width="30%" rowspan="2"><input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="배송조회"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="교환 신청"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="반품 신청"><br> <input
										class="sidebutton btn-primary" type="button"
										onclick="location.href='#'" value="구매후기 쓰기"><br>
									</td>
								</tr>
								<tr>
									<td><img alt="상품이미지"
										src="https://thumbnail10.coupangcdn.com/thumbnails/remote/96x96ex/image/retail/images/2020/05/07/17/3/9d59a462-8680-4bc2-8ae4-f6177cd7193e.jpg">
									</td>
									<td align="right">
										<h5 style="margin-right: 5%">던킨 딸기 듬뿍 미니도넛 (냉동)</h5> <a
										style="margin-right: 20px">6,770원 · 1개</a> <input
										style="margin-right: 5%" width="10%" type="button"
										onclick="location.href='#'" value="장바구니에 담기">
									</td>
								</tr>

							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
</body>
</html>
