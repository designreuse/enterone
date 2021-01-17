<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resourcesSns/css/sns.css">
<!-- 	슬라이드쇼 스타일 시트 -->
<script
	src="${pageContext.request.contextPath}/resourcesSns/js/jssor.slider-28.0.0.min.js"
	type="text/javascript"></script>

<style>
#textarea_modaldetail{
min-height: 100px;
width: 100%;
border: none;
resize: none;


}
.dropdown-toggle {
	
}

.div-mylist:hover {
	color: blue;
}

#profileimg {
	height: 228px;
	background: white !important;
	width: 150px;
}

.profile {
	width: 80%;
	margin: 10%;
}
/* 멤버별 개인 게시물 리스트 사진 */
#img-mypost {
	margin: 10px;
	max-width: 30px;
	max-height: 30px;
	overflow: hidden;
}

#label-postid {
	width: 30%;
}

#label-posttitle {
	width: 45%;
}

.row {
	margin-left: 0px;
}

#replyListView {
	overflow: auto;
	max-height: 600px;
	overflow-x: hidden
}

::-webkit-scrollbar {
	/* 스크롤바 전체 영역 */
	width: 10px;
}

::-webkit-scrollbar-track {
	/* 스크롤이 움직이는 영역  */
	background-color: #A4B7D4;
}

::-webkit-scrollbar-thumb {
	/*  스크롤  */
	background-color: black;
	border-radius: 30px;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	/*  스크롤의 화살표가 포함된 영역   */
	display: block;
	height: 8px;
	background-color: #000;
}

::-webkit-scrollbar-corner {
	/*  상하+좌우 스크롤이 만나는 공간   */
	background-color: red;
}
/* SNS 상세보기 수정 삭제버튼 */
.div-snsbtndeleteupdate {
	padding-bottom: 14px;
}

.btn-snsbtndelete {
	float: right;
}

.btn-snsbtnupdate {
	float: right;
}

/* #A4B7D4 */
</style>
<script>
	window.jssor_1_slider_init = function() {

		var jssor_1_SlideshowTransitions = [ {
			$Duration : 1200,
			$Zoom : 1,
			$Easing : {
				$Zoom : $Jease$.$InCubic,
				$Opacity : $Jease$.$OutQuad
			},
			$Opacity : 2
		}, {
			$Duration : 1000,
			$Zoom : 11,
			$SlideOut : true,
			$Easing : {
				$Zoom : $Jease$.$InExpo,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			$Zoom : 1,
			$Rotate : 1,
			$During : {
				$Zoom : [ 0.2, 0.8 ],
				$Rotate : [ 0.2, 0.8 ]
			},
			$Easing : {
				$Zoom : $Jease$.$Swing,
				$Opacity : $Jease$.$Linear,
				$Rotate : $Jease$.$Swing
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.5
			}
		}, {
			$Duration : 1000,
			$Zoom : 11,
			$Rotate : 1,
			$SlideOut : true,
			$Easing : {
				$Zoom : $Jease$.$InQuint,
				$Opacity : $Jease$.$Linear,
				$Rotate : $Jease$.$InQuint
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.8
			}
		}, {
			$Duration : 1200,
			x : 0.5,
			$Cols : 2,
			$Zoom : 1,
			$Assembly : 2049,
			$ChessMode : {
				$Column : 15
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Zoom : $Jease$.$InCubic,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 4,
			$Cols : 2,
			$Zoom : 11,
			$SlideOut : true,
			$Assembly : 2049,
			$ChessMode : {
				$Column : 15
			},
			$Easing : {
				$Left : $Jease$.$InExpo,
				$Zoom : $Jease$.$InExpo,
				$Opacity : $Jease$.$Linear
			},
			$Opacity : 2
		}, {
			$Duration : 1200,
			x : 0.6,
			$Zoom : 1,
			$Rotate : 1,
			$During : {
				$Left : [ 0.2, 0.8 ],
				$Zoom : [ 0.2, 0.8 ],
				$Rotate : [ 0.2, 0.8 ]
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.5
			}
		}, {
			$Duration : 1000,
			x : -4,
			$Zoom : 11,
			$Rotate : 1,
			$SlideOut : true,
			$Easing : {
				$Left : $Jease$.$InQuint,
				$Zoom : $Jease$.$InQuart,
				$Opacity : $Jease$.$Linear,
				$Rotate : $Jease$.$InQuint
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.8
			}
		}, {
			$Duration : 1200,
			x : -0.6,
			$Zoom : 1,
			$Rotate : 1,
			$During : {
				$Left : [ 0.2, 0.8 ],
				$Zoom : [ 0.2, 0.8 ],
				$Rotate : [ 0.2, 0.8 ]
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.5
			}
		}, {
			$Duration : 1000,
			x : 4,
			$Zoom : 11,
			$Rotate : 1,
			$SlideOut : true,
			$Easing : {
				$Left : $Jease$.$InQuint,
				$Zoom : $Jease$.$InQuart,
				$Opacity : $Jease$.$Linear,
				$Rotate : $Jease$.$InQuint
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.8
			}
		}, {
			$Duration : 1200,
			x : 0.5,
			y : 0.3,
			$Cols : 2,
			$Zoom : 1,
			$Rotate : 1,
			$Assembly : 2049,
			$ChessMode : {
				$Column : 15
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Top : $Jease$.$InCubic,
				$Zoom : $Jease$.$InCubic,
				$Opacity : $Jease$.$OutQuad,
				$Rotate : $Jease$.$InCubic
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.7
			}
		}, {
			$Duration : 1000,
			x : 0.5,
			y : 0.3,
			$Cols : 2,
			$Zoom : 1,
			$Rotate : 1,
			$SlideOut : true,
			$Assembly : 2049,
			$ChessMode : {
				$Column : 15
			},
			$Easing : {
				$Left : $Jease$.$InExpo,
				$Top : $Jease$.$InExpo,
				$Zoom : $Jease$.$InExpo,
				$Opacity : $Jease$.$Linear,
				$Rotate : $Jease$.$InExpo
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.7
			}
		}, {
			$Duration : 1200,
			x : -4,
			y : 2,
			$Rows : 2,
			$Zoom : 11,
			$Rotate : 1,
			$Assembly : 2049,
			$ChessMode : {
				$Row : 28
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Top : $Jease$.$InCubic,
				$Zoom : $Jease$.$InCubic,
				$Opacity : $Jease$.$OutQuad,
				$Rotate : $Jease$.$InCubic
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.7
			}
		}, {
			$Duration : 1200,
			x : 1,
			y : 2,
			$Cols : 2,
			$Zoom : 11,
			$Rotate : 1,
			$Assembly : 2049,
			$ChessMode : {
				$Column : 19
			},
			$Easing : {
				$Left : $Jease$.$InCubic,
				$Top : $Jease$.$InCubic,
				$Zoom : $Jease$.$InCubic,
				$Opacity : $Jease$.$OutQuad,
				$Rotate : $Jease$.$InCubic
			},
			$Opacity : 2,
			$Round : {
				$Rotate : 0.8
			}
		} ];

		var jssor_1_options = {
			$AutoPlay : 1,
			$SlideshowOptions : {
				$Class : $JssorSlideshowRunner$,
				$Transitions : jssor_1_SlideshowTransitions,
				$TransitionsOrder : 1
			},
			$ArrowNavigatorOptions : {
				$Class : $JssorArrowNavigator$
			},
			$ThumbnailNavigatorOptions : {
				$Class : $JssorThumbnailNavigator$,
				$Rows : 2,
				$SpacingX : 14,
				$SpacingY : 12,
				$Orientation : 2,
				$Align : 156
			}
		};

		var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

		/*#region responsive code begin*/

		var MAX_WIDTH = 960;

		function ScaleSlider() {
			var containerElement = jssor_1_slider.$Elmt.parentNode;
			var containerWidth = containerElement.clientWidth;

			if (containerWidth) {

				var expectedWidth = Math.min(MAX_WIDTH || containerWidth,
						containerWidth);

				jssor_1_slider.$ScaleWidth(expectedWidth);
			} else {
				window.setTimeout(ScaleSlider, 30);
			}
		}

		ScaleSlider();

		$Jssor$.$AddEvent(window, "load", ScaleSlider);
		$Jssor$.$AddEvent(window, "resize", ScaleSlider);
		$Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
		/*#endregion responsive code end*/
	};

	$(function() {
		var uploadFiles = [];
		var $drop = $("#drop");
		$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
			$(this).addClass('drag-over');
		}).on("dragleave", function(e) { //드래그 요소가 나갔을때
			$(this).removeClass('drag-over');
		}).on("dragover", function(e) {
			e.stopPropagation();
			e.preventDefault();
		}).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
			e.preventDefault();
			$(this).removeClass('drag-over');
			var files = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var size = uploadFiles.push(file); //업로드 목록에 추가
				preview(file, size - 1); //미리보기 만들기
			}
		});

		function preview(file, idx) {
			var reader = new FileReader();
			reader.onload = (function(f, idx) {
				return function(e) {
					var div = '<div class="thumb"> \
<div class="close" data-idx="' + idx + '">X</div> \
<img src="'
							+ e.target.result
							+ '" title="'
							+ escape(f.name)
							+ '"/></div>';
					$("#thumbnails").append(div);
				};
			})(file, idx);
			reader.readAsDataURL(file);
		}
		$("#btnSubmit").on("click", function() {
			var formData = new FormData(document.getElementById('uploadForm'));
			$.each(uploadFiles, function(i, file) {
				if (file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
					formData.append('upload-file', file, file.name);
			});
			$.ajax({
				url : 'sns/snsInsert',
				data : formData,
				type : 'post',
				contentType : false,
				processData : false,
				success : function(ret) {
					alert("완료");
				}
			});
		});
		$("#thumbnails").on("click", ".close", function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			uploadFiles[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
			$target.parent().remove(); //프리뷰 삭제
		});
		$('a[href="#ex7"]').click(function(event) {
			event.preventDefault();

			$("#fade").modal({
				fadeDuration : 250
			});
		});
		$("nexttext").click(function() {
			$(ex2).css(display, none)
		});

		// sns등록 모달창 띄우기

		$('.clicktextfil').on('click', function(event) {
			var modal = $('#exampleModal5')
			modal.modal('show');
		})
		// SNS상세정보 사진O 모달창 띄우기
		$('.outputdiv')
				.on(
						'click',
						function(event) {
							var modal = $('#exampleModal9')
							var no = $(this).data("no");
							replyListView(no);
							$
									.ajax({
										url : '${pageContext.request.contextPath}/onesnsselect?sns_no='
												+ no, //파라미터 넘기는 법
										dataType : 'json',
										success : function(result) {
											$('#modalimage').html(
													$('#imgtemmm').html());//
											var imgname = result.sns_pic;//
											var imgcut = imgname.split(',');//
											modal.find('#reply_sns_no').val(
													result.sns_no)//
											modal.find('#reply_mem_id').val(
													result.mem_id)//
											modal.find('.snstitledetail').text(
													result.sns_title)//
											modal.find('.content').text(
													result.sns_content)//
											modal.find('.btn-snsbtndelete')
													.val(result.sns_no)//
											modal.find('.btn-snsbtndelete')
													.attr('data-id',
															result.mem_id)//

											modal.find('.appendimmm').empty() //지우는 함수
											for (var i = 0; i < imgcut.length - 1; i++) {
												var img = '<div><img class="appendiiimmm" data-u="image" src="${pageContext.request.contextPath}/images/snsimage/'+imgcut[i]+'" /><img class="thumthum" data-u="thumb" src="${pageContext.request.contextPath}/images/snsimage/'+imgcut[i]+'" /></div>';
												modal.find('.appendimmm')
														.append(img)
											}
											jssor_1_slider_init();
											modal.modal('show');
										}

									});
						})
		// SNS상세정보 사진X
		$('.outputdiv2')
				.on(
						'click',
						function(event) {//
							var modal = $('#exampleModal9');//
							var no = $(this).data("no");//
							replyListView(no);
							$
									.ajax({//
										url : '${pageContext.request.contextPath}/onesnsselect?sns_no='
												+ no, //파라미터 넘기는 법
										dataType : 'json',//
										success : function(result) {//
											modal.find('#modalimage').empty()//
											modal.find('.snstitledetail').text(
													result.sns_title)//
											modal.find('.content').text(
													result.sns_content)//
											modal.find('#reply_sns_no').val(
													result.sns_no)//
											modal.find('#reply_mem_id').val(
													result.mem_id)//
											modal.find('.btn-snsbtndelete')
													.val(result.sns_no)//
											modal.find('.btn-snsbtndelete')
													.attr('data-id',
															result.mem_id)//
											modal.modal('show');//
										}
									});
						});
		//프로필 보기
		$('.showprofilebtn')
				.on(
						'click',
						function(event) {//
							var modal = $('#showprofile');//
							var id = $(this).data("id");//
							$
									.ajax({//
										url : '${pageContext.request.contextPath}/profileselect?mem_id='
												+ id,
										dataType : 'json',//
										success : function(result) {//

											if (result.mem_pic != null
													&& result.mem_type == 0) {
												modal.find('.modalprofileimg')
														.attr('src',
																result.mem_pic)// 멤버사진
											}
											if (result.mem_pic == null) {
												modal
														.find(
																'.modalprofileimg')
														.attr('src',
																"${pageContext.request.contextPath}/images/member_pic/no-profile.jpg")// 멤버사진
											}
											if (result.mem_pic != null
													&& result.mem_type == 1) {
												modal
														.find(
																'.modalprofileimg')
														.attr(
																'src',
																'${pageContext.request.contextPath}/images/member_pic/'
																		+ result.mem_pic)// 멤버사진
											}
											modal.find('#modalprofileid').text(
													result.mem_id) //멤버 아이디
											modal.find('#modalprofilepost')
													.text(result.sns_no) //멤버 포스트
											modal.find('#modalprofilelike')
													.text(result.sns_likes) //좋아요 갯수
											modal.find('#modalprofiledate')
													.text(result.mem_time) //가입일
											modal.modal('show');//
										}
									})
						});

		$('.div-mylist')
				.on(
						'click',
						function(event) {
							var modal = $('#exampleModal9')
							var no = $(this).data("no");
							replyListView(no);
							$
									.ajax({
										url : '${pageContext.request.contextPath}/onesnsselect?sns_no='
												+ no, //파라미터 넘기는 법
										dataType : 'json',
										success : function(result) {
											$('#modalimage').html(
													$('#imgtemmm').html());//
											var imgname = result.sns_pic;//
											var imgcut = imgname.split(',');//
											modal.find('.snstitledetail').text(
													result.sns_title)//
											modal.find('.content').text(
													result.sns_content)//
											modal.find('.appendimmm').empty() //지우는 함수
											for (var i = 0; i < imgcut.length - 1; i++) {
												var img = '<div><img class="appendiiimmm" data-u="image" src="${pageContext.request.contextPath}/images/snsimage/'+imgcut[i]+'" /><img class="thumthum" data-u="thumb" src="${pageContext.request.contextPath}/images/snsimage/'+imgcut[i]+'" /></div>';
												modal.find('.appendimmm')
														.append(img)
											}
											jssor_1_slider_init();
											modal.modal('show');
										}

									});
						})

		// 	쪽지 보내기
		$('.btnLetter').on('click', function(event) {//
			var modal = $('#modal-letter');//
			var id = $(this).data("id");//
			var sid = $(this).data("sid")//
			var snssns = $(this).data("snssns")//
			modal.find('#recipient-mname').val(id)
			modal.find('#mamber-name').val(sid)
			modal.find('#snsns').val(snssns)
			modal.modal('show');
		});
		// MyPost 목록 보기, YourPost 목록 보기
		$('.btn-myPost')
				.on(
						'click',
						function(event) {//
							var modal = $('#modal-myPost');//
							var id = $(this).data("id");//
							$
									.ajax({//
										url : '${pageContext.request.contextPath}/mysnslist?mem_id='
												+ id,
										dataType : 'json',//
										success : function(result) {//

											if (result.snslist[0].mem_pic != null
													&& result.snslist[0].mem_type == 0) {
												modal
														.find('#img-mypost')
														.attr(
																'src',
																result.snslist[0].mem_pic)// 멤버사진
											}
											if (result.snslist[0].mem_pic == null) {
												modal
														.find('#img-mypost')
														.attr('src',
																"${pageContext.request.contextPath}/images/member_pic/no-profile.jpg")// 멤버사진
											}
											if (result.snslist[0].mem_pic != null
													&& result.snslist[0].mem_type == 1) {
												modal
														.find('#img-mypost')
														.attr(
																'src',
																'${pageContext.request.contextPath}/images/member_pic/'
																		+ result.snslist[0].mem_pic)// 멤버사진
											}
											modal.find('#label-myid').text(
													result.snslist[0].mem_id)

											modal.find('#mypostbox').empty()//
											for (var i = 0; i < result.snslist.length; i++) {
												var mylist = '<div class="col-xs div-mylist" data-no="'+result.snslist[i].sns_no+'" style="height: 45px;"></label><label id="label-posttitle" style="margin: 16px;">'
														+ result.snslist[i].sns_title
														+ '</label><label>'
														+ (result.snslist[i].sns_pic == ""
																|| result.snslist[i].sns_pic == null ? '사진없음'
																: '사진있음')
														+ '</label><a href="#" class="love"><i class="ion-android-favorite-outline"></i><div>'
														+ result.snslist[i].sns_likes
														+ '</div></a></div>'
												modal.find('#mypostbox')
														.append(mylist)
											}
											modal.modal('show');
										}
									})
						})

		//댓글 등록 요청
		$(".btnFboardReplyInsert").on("click", function() {
			checkUnload = false;//경고창 중복 제거
			if (replyFormCheck() == true) { //유효성검사
				replyInsert();//댓글 등록 요청 보내기
			}
		});
		//삭제 버튼을 누르면 뜨는거
		$("#detail-btn-delete").click(
				function() {
					var btn_no = $(this).attr('value') //sns번호 가져옴
					var btn_id = $(this).attr('data-id')
					var session_id = '${sessionScope.member.mem_id }';
					console.log(btn_id, session_id)
					if (session_id == btn_id) {
						if (confirm('삭제하시겠습니까?')) {
							$(location).attr(
									'href',
									'${pageContext.request.contextPath}/deleteSns?sns_no='
											+ btn_no);
						} else {
							// no click
						}
					} else {
						alert("글 작성자가 아니거나 로그인하지 않았습니다")
					}
				});
	}); //end fucn
	//댓글 등록 요청
	function replyInsert() {
		var fbo_no = $("input:text[id='reply_sns_no']").val();

		$.ajax({
			url : "${pageContext.request.contextPath}/snsreplyinsert",
			type : 'POST',
			data : $("#snsreplyinsert").serialize(),
			success : function(response) {
				if (response == true) {
					replyListView(fbo_no);
					// 					                fboardView(fbo_no);//게시물 재 출력
				}
			},
			error : function(xhr, status, message) {
				/* alert(" status: "+status+" er:"+message); */
				alert("로그인 후 이용해주세요.");
			}
		});
	}
	//댓글 유효성 체크
	function replyFormCheck() {
		if ($("textarea[name='sre_content']").val() == null
				|| $("textarea[name='sre_content']").val() == '') {
			alert("내용을 입력하세요.")
			$("textarea[name='sre_content']").focus();
			event.preventDefault();
		} else {
			return true;
		}
	}

	//댓글 목록 요청
	function replyListView(no) {
		$.ajax({
			url : '${pageContext.request.contextPath}/replylist',
			type : 'GET',
			data : {
				sns_no : no
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : replyListViewResult
		});
	}

	//댓글 목록 응답
	function replyListViewResult(data) {
		$("#replyListView").empty();
		var id = "${member.mem_id}"//session아이디 값
		$
				.each(
						data,
						function(idx, re) {
							console.log(re);
							if (id == re.mem_id) {//로그인 아이디와 작성자 비교 후 수정,삭제 창 보여주기
								var userid = re.mem_id
							}
							var uls = "<ul class = 'replyUl'>";// 작성된 댓글 아래 달아주는 버튼들

							if (id != null) {
								var li1 = "";
								var li2 = "";
							} else {
								var li1 = "<li class='btnUpdateReply'>수정</li><span>&nbsp;</span>";
								var li2 = "<li class='btnDeleteReply'>삭제</li><span>&nbsp;</span>";
							}

							if (id != re.mem_id) {//자기 글은 신고버튼 못하게 막음
								var li3 = "<li class='btnNotifyReply'>신고</li><span>&nbsp;</span>";
							} else {
								var li3 = "";
							}
							var ule = "</ul>";

							var ul = uls + li1 + li2 + li3 + ule;

							$(
									"<div class = 'replyInfo' data-no="+re.sre_no+"><hr>")
									.append(
											$('<div class = \'row\'>')
													.html(
															name + '&nbsp;'
																	+ re.mem_id))
									.append(
											$('<div class = \'row\'>').html(
													name + '&nbsp;'
															+ re.sre_time))
									.append(
											$('<div class = \'row replyText\'>')
													.html(re.sre_content))
									.append(
											$(
													'<div class = \'row flex-row-reverse\'>')
													.append(ul)).appendTo(
											'#replyListView');
						});//each

	}
	$(function() {
		$('.love').click(function() {
			var thisclass = $(this).attr('class');
			var no = $(this).attr('data-no')
			if (thisclass == 'love') {
				alert("좋아요 취소")
				$.ajax({
					url : '${pageContext.request.contextPath}/deleteLike',
					type : 'GET',
					data : {
						sns_ac_no : no
					},
					success : function(response) {
						if (response == true) {
							// 					                fboardView(fbo_no);//게시물 재 출력
						}
					},
					error : function(xhr, status, message) {
						/* alert(" status: "+status+" er:"+message); */
						alert("로그인 후 이용해주세요.");
					}
				});
			} else { //좋아요 누르면
				alert("좋아요")
				$.ajax({
					url : '${pageContext.request.contextPath}/insertLike',
					type : 'GET',
					data : {
						sns_ac_no : no
					},
					success : function(response) {
						if (response == true) {
							// 					                fboardView(fbo_no);//게시물 재 출력
						}
					},
					error : function(xhr, status, message) {
						/* alert(" status: "+status+" er:"+message); */
						alert("로그인 후 이용해주세요.");
					}
				});
			}
		});
	});
</script>














</head>

<section class="home">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="headline">
					<img alt="" src="">
					<div class="nav" id="headline-nav">
						<a class="left carousel-control" role="button" data-slide="prev">
							<span class="ion-ios-arrow-left" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" role="button" data-slide="next">
							<span class="ion-ios-arrow-right" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
					<!-- 헤더 밑 슬라이드 info -->
					<div class="owl-carousel owl-theme" style="margin-top: -20px;"
						id="headline">
						<c:if test="${member.mem_id eq null}">
							<div class="item">
								<a href="#"><div class="badge">Tip!</div>글을 올리시려면 개인 회원으로
									로그인을 해주세요</a>
							</div>
						</c:if>

						<div class="item">
							<a href="#"><div class="badge">Tip!</div>해쉬태그 이용방법</a>
						</div>
						<div class="item">
							<a href="#"><div class="badge">prom</div>고운말을 사용하여 소통합시다!</a>
						</div>
					</div>
				</div>
				<c:if test="${member.mem_id ne null or company.com_id ne null }">
					<div class="inputdiv">
					
					
						<span> <c:if
								test="${sessionScope.member.mem_pic ne null and sessionScope.member.mem_type eq 0 }">
								<img class="inputimg" src="${sessionScope.member.mem_pic}"
									alt="member_profile">
							</c:if> <c:if
								test="${sessionScope.member.mem_pic eq null and sessionScope.company.com_pic eq null }">
								<img class="inputimg"
									src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
									alt="no-profile">
							</c:if> <c:if
								test="${sessionScope.member.mem_pic ne null and sessionScope.company.com_pic eq null and sessionScope.member.mem_type eq 1}">
								<img class="inputimg"
									src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.member.mem_pic}"
									alt="member_profile">
							</c:if> <c:if
								test="${sessionScope.company.com_pic ne null and sessionScope.member.mem_pic eq null }">
								<img class="inputimg"
									src="${pageContext.request.contextPath}/images/member_pic/${sessionScope.company.com_pic}"
									alt="company_profile">
							</c:if> <input class="clicktextfil" value="오늘은 어떤 글을 올려볼까요?"
							readonly="readonly">
						</span>
					</div>
				</c:if>


				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<!-- SNS상세정보 모달창 inputdiv눌렀을때 -->
				<div class="modal" id="exampleModal9" style="z-index: 1200;">
					<div class="modal-dialog">
						<div class="modal-content" style="margin-bottom: 0px;">
							<div class="modal-header">
								<h3 class="modal-title snstitledetail" id="exampleModalLabel"></h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div id="ex7">
								<div class="mtmtitle">
									<div id="ex2" style="height: 62%"></div>
									<div id="modalimage"></div>
									
									<textarea class="content" id="textarea_modaldetail" readonly="readonly"></textarea>
								</div>
								<div class="col-md-12 div-snsbtndeleteupdate">
									<button type="button" id="detail-btn-delete" data-id=""
										class="btn-snsbtndelete btn btn-primary">삭제하기</button>
								</div>


								<div class="col-md-12">
									<div class="">
										<div id="replyListView">
											<!-- 댓글 출력 장소 -->
										</div>
										<hr>
										<form id="snsreplyinsert">
											<div class="row">
												<input style="display: none;" name="sns_no"
													id="reply_sns_no" /> <input style="display: none;"
													name="mem_id" id="reply_mem_id" />
												<textarea class="col-xl-11 col-md-10 col-12 fboardReply"
													name="sre_content" rows=3 placeholder="댓글"></textarea>

												<div class="col-xl-1 col-md-2 col-12 btnFboardReply">
													<button type="button"
														class="btnFboardReplyInsert btn btn-primary py-2 px-4">작성</button>
												</div>
											</div>
										</form>
										<br>
									</div>
								</div>

							</div>
							<div class="comentdiv"></div>
							<div class="modal-footer">
								
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- SNS 프로필 보기 모달창 -->
				<div class="modal" id="showprofile" style="z-index: 1200;">
					<div class="modal-dialog">
						<div class="modal-content" style="margin-bottom: 0px;">
							<div class="modal-header">
								<h3 class="modal-title" id="exampleModalLabel">프로필 상세보기</h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<table id="profile" class="profile">
								<tr>
									<td id="profileimg" rowspan="4" colspan="2"
										style="background: black"><img class="modalprofileimg"
										style="max-width: 80%; max-height: 80%" alt=""></td>
									<th>아이디</th>
									<td id="modalprofileid"></td>
								<tr>
									<th>포스트</th>
									<td id="modalprofilepost"></td>
								</tr>
								<tr>
									<th>좋아요</th>
									<td id="modalprofilelike"></td>
								</tr>
								<tr>
									<th>가입일</th>
									<td id="modalprofiledate"></td>
							</table>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>


				<!-- SNS등록 모달창 -->
				<div class="modal" id="exampleModal5" style="z-index: 1200;">
					<div class="modal-dialog">
						<div class="modal-content" style="margin-bottom: 0px;">
							<div class="modal-header">
								<h3 class="modal-title" id="exampleModalLabel">SNS 등록</h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form name="uploadForm" id="uploadForm"
								enctype="multipart/form-data" method="post">
								<div id="ex7">
									<div class="mtmtitle">
										<div id="ex2" style="height: 62%"></div>
										<table class="inserttable" border="1">
											<tr style="height: 20%">
												<td><input class="snstitle" type="text" id="sns_title"
													name="sns_title" placeholder="제목"> <input
													style="display: none;" type="text" id="mem_id"
													name="mem_id" placeholder="" value="${member.mem_id }"></td>
											<tr style="height: 30%">
												<td>
													<div class="pickupld" id="drop">
														사진을 올려주세요
														<div id="thumbnails"
															style="overflow: auto; max-height: 233px; height: 88%;"></div>
														<a href="#ex7" rel="modal:open"> </a>
													</div>
												</td>
											<tr style="height: 30%">
												<td>

													<div class="form-group">
														<textarea class="form-control"
															id="exampleFormControlTextarea1" name="sns_content"
															rows="3" placeholder="내용을 적어주세요" style="border: 0"></textarea>
													</div>
												</td>
											<tr>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="btnSubmit">Post</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 사진과 글이 올라가는곳 -->
				<div class="line top">
					<div>Fan SnS Community</div>
				</div>
				<div class="row" style="padding-bottom: 300px;">
					<article class="col-md-12 article-list">
						<c:forEach items="${snslist}" var="sns">
							<span>
								<div class="dropdown" style="width: 100%;">
									<button class="dropbtn" type="button" id="dropdownMenu2"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<c:if test="${sns.mem_pic ne null and sns.mem_type eq 0 }">
											<img class="outputimg" src="${sns.mem_pic}"
												alt="member_profile">
										</c:if>
										<c:if test="${sns.mem_pic eq null}">
											<img class="outputimg"
												src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
												alt="no-profile">
										</c:if>
										<c:if test="${sns.mem_pic ne null and sns.mem_type eq 1}">
											<img class="outputimg"
												src="${pageContext.request.contextPath}/images/member_pic/${sns.mem_pic}"
												alt="member_profile">
										</c:if>
										
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
										<button class="dropdown-item showprofilebtn" type="button"
											id="showprofilebtn" data-id="${sns.mem_id}">프로필 보기</button>
										<br>
										<button class="dropdown-item btnLetter" type="button"
											id="btnLetter12" data-id="${sns.mem_id}"
											data-sid="${sessionScope.member.mem_id }" data-snssns="1">쪽지
											보내기</button>
										<br>
										<button class="dropdown-item btn-myPost" type="button"
											data-id="${sns.mem_id}">게시글 보기</button>
									</div>
									<input class="clickcontentdetail" value="${sns.sns_title}"
										readonly="readonly">
								</div>

							</span>
							<c:if test="${not empty sns.sns_pic}">

								<div class="outputdiv" data-no="${sns.sns_no}">

									<div class="inner cinner">
										<figure>
											<div class="w3-content w3-section" style="max-width: 500px">
												<c:forTokens var="cutimg" items="${sns.sns_pic}" delims=",">
													<a href="single.html"> <img class="mySlides"
														src="${pageContext.request.contextPath}/images/snsimage/${cutimg}"
														alt="사진이 출력되는 곳" style="width: 100%; display: none;">
													</a>
												</c:forTokens>
											</div>
										</figure>

										<div class="details" id="clickdiv">
											<div class="detail">
												<div class="category">
													<a href="#">Post Date</a>
												</div>
												<div class="time">${sns.sns_time}</div>
											</div>
											<p style="height: 130px; overflow: hidden">${sns.sns_content}</p>
											<footer>
												<!-- 좋아요 -->
												<!-- 좋아요 -->
												<!-- 좋아요 -->
												<!-- 좋아요 -->
												<!-- 좋아요 -->
												
												<c:forEach items="${selectSnsLike}" var="snslike" varStatus="status">
													<c:choose>
														<c:when test="${snslike.mem_id eq sessionScope.member.mem_id and snslike.sns_ac_no eq sns.sns_no }">
															<a href="#" class="love active" data-no="${sns.sns_no}">
																<i class="ion-android-favorite"></i>
																<div>${sns.sns_likes}</div>
															</a>
														</c:when>
													</c:choose>
												</c:forEach>
												
												
												
											</footer>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${empty sns.sns_pic}">
								<div class="outputdiv2" data-no="${sns.sns_no}">

									<div class="inner">
										<div class="inner" style="padding-bottom: 40px;">
											<div class="details" style="padding: 9px; margin: 0px;">
												<div class="detail">
													<div class="category">
														<a href="#">Post Date</a>
													</div>
													<div class="time">${sns.sns_time}</div>
												</div>
												<p>${sns.sns_content}</p>
												<footer>
												<c:forEach items="${selectSnsLike}" var="snslike">
													<c:choose>
														<c:when test="${snslike.mem_id eq sessionScope.member.mem_id and snslike.sns_ac_no eq sns.sns_no }">
															<a href="#" class="love active" data-no="${sns.sns_no}">
																<i class="ion-android-favorite"></i>
																<div>${sns.sns_likes}</div>
															</a>
														</c:when>
													</c:choose>
												</c:forEach>
												
												
												</footer>
											</div>
										</div>
									</div>
								</div>
							</c:if>


						</c:forEach>
						<script type="text/javascript">
							var slideIndex = [];
							var c = document.getElementsByClassName("cinner");
							for (y = 0; y < c.length; y++) {
								slideIndex[y] = 1;
							}
							carousel()
							function carousel() {
								var c = document
										.getElementsByClassName("cinner");
								var i;

								for (y = 0; y < c.length; y++) {
									var x = c[y]
											.getElementsByClassName("mySlides");
									for (i = 0; i < x.length; i++) {
										x[i].style.display = "none";
									}
									x[slideIndex[y] - 1].style.display = "block";
									slideIndex[y]++;
									if (slideIndex[y] > x.length) {
										slideIndex[y] = 1
									}
								}

								setTimeout(carousel, 2000); // Change image every 2 seconds
							}
						</script>
					</article>

				</div>
			</div>

			<!-- <!-- ㅇㄴㄹ ㅁㅇㄹ.ㅏㅜㄴㅁㄹ어ㅜㅠㅁ어나ㅠㅁㄹㅇ나ㅠㅗㄹㄴㅁ아ㅓㅗㅇㄴ머ㅜㅗㄴ아ㅓㅗㅇ누ㄹㄴㅁㄹ.ㅏㅓㄴㅁ우춘마ㅓㅠㅜ차ㅓㄴ뮤와뉴마ㅣㅓㅗㄴㅁ아ㅓㅣ롸ㅓㄴㅇㅁ롸ㅓㄴㅁㅇㄴ룀논말어ㅓㅗㄹ무ㅠㅇ니ㅏㅍㄴ머ㅠ오미나ㅣㄴㅁ아ㅗ룸ㄴㅊㅎ춞ㄷ슐챠ㅛㅂㅅㄱ츄ㅛㅑㅐㅈㅂㅅ갸슈마ㅣㅗㄴㅇㅁ라ㅓㅘㅓㅇㄴ뫈ㅇ몰ㅇ나미ㅗ라ㅓㄴ모알ㅇㄴ뫄ㅓㅇㄴ몸러 -->

			<!-- 사이드바 구역 -->
			<!-- 로그인 됨 -->
			<c:if test="${member.mem_id ne null or company.com_id ne null}">

				<div class="col-xs-6 col-md-4 sidebar" id="sidebar">
					<div class="sidebar-title for-tablet">Sidebar</div>
					<aside>
						<div class="aside-body">
							<div class="featured-author">
								<div class="featured-a;;/uthor-inner">
									<div class="featured-author-cover"
										style=" background-color: dimgrey; border-radius: 20px;">
										<div class="featured-author-center">
											<figure class="featured-author-picture">
												<p>


													<c:if
														test="${member.mem_pic ne null and member.mem_type eq 0 }">
														<!--  -->
														<img class="" src="${member.mem_pic}" alt="member_profile">
													</c:if>
													<c:if
														test="${member.mem_pic ne null and member.mem_type eq 1}">
														<img class=""
															src="${pageContext.request.contextPath}/images/member_pic/${member.mem_pic}"
															alt="member_profile">
													</c:if>
													<c:if test="${member.mem_pic eq null}">
														<img class=""
															src="${pageContext.request.contextPath}/images/member_pic/no-profile.jpg"
															alt="no-profile">
													</c:if>


												</p>
											</figure>
											<div class="featured-author-info">
												<h2 class="name">${member.mem_id}</h2>
												<div class="desc">${member.mem_email}</div>
											</div>
										</div>
									</div>
									<div class="featured-author-body">
										<div class="featured-author-count">
											<div class="item btn-myPost" data-id="${member.mem_id}">
												<a href="#">
													<div class="name">Posts</div>
													<div class="value">${countmysns}</div>
												</a>
											</div>
											<div class="item">
												<a href="#">
													<div class="name">Likes</div>
													<div class="value">${countSnsLike}</div>
												</a>
											</div>
											<div class="item letterdiv">
												<a href="${pageContext.request.contextPath}/mymail">
													<div class="letter">쪽지</div>
													<div class="value">${countmyletter}</div>
												</a>
											</div>
										</div>
										<div class="block">
											<h2 class="block-title">My Photos</h2>
											<div class="block-body">
												<ul class="item-list-round" data-magnific="gallery">
													<c:forEach items="${mysnslist}" var="mySns">
														<c:forTokens var="cutimg" items="${mySns.sns_pic}"
															delims=",">
															<li><a
																href="${pageContext.request.contextPath}/images/snsimage/${cutimg}"
																style="background-image: url('${pageContext.request.contextPath}/images/snsimage/${cutimg}');"></a></li>
														</c:forTokens>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="featured-author-footer">
											<a href="#">See All Authors</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</aside>
					<aside>
						<h1 class="aside-title">
							Popular <a href="#" class="all">See All <i
								class="ion-ios-arrow-right"></i></a>
						</h1>
						<div class="aside-body">
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img src="images/news/img07.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">좋아요 많이 받은 내글 </a>
										</h1>
									</div>
								</div>
							</article>
						</div>
					</aside>
					<aside>
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<li class="active"><a href="#recomended"
								aria-controls="recomended" role="tab" data-toggle="tab"> <i
									class="ion-android-star-outline"></i> Random Post
							</a></li>
							<li><a href="#comments" aria-controls="comments" role="tab"
								data-toggle="tab"> <i class="ion-ios-chatboxes-outline"></i>
									Comments
							</a></li>
						</ul>

						<!-- Random Post --------------------------------------------------------------------------------- -->
						<div class="tab-content">
							<div class="tab-pane active" id="recomended">
								<article class="article-fw">
									<div class="inner">
										<figure>
											<a href="single.html"> <img src="images/news/img16.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="details">
											<div class="detail">
												<div class="time">December 31, 2016</div>
												<div class="category">
													<a href="category.html">Sport</a>
												</div>
											</div>
											<h1>
												<a href="single.html">큰 랜덤 포스트</a>
											</h1>
											<p>랜덤 포스트 글</p>
										</div>
									</div>
								</article>
								<div class="line"></div>
								<article class="article-mini">
									<div class="inner">
										<figure>
											<a href="single.html"> <img src="images/news/img10.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<h1>
												<a href="single.html">램덤 글 출력됨
													<div class="detail">
														<div class="category">
															<a href="category.html">PostDate</a>
														</div>
														<div class="time">December 20, 2016</div>
													</div>
										</div>
									</div>
								</article>
							</div>

							<!-- 댓글 확인------------------------------------------------------------------------------------------------- -->
							<div class="tab-pane comments" id="comments">
								<div class="comment-list sm">
									<div class="item">
										<div class="user">
											<figure>
												<img src="${member.mem_pic }" alt="User Picture">
											</figure>
											<div class="details">
												<h5 class="name">${member.mem_id }</h5>
												<div class="description">${member.mem_email }</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</aside>
				</div>
			</c:if>
			<!-- 로그인 안됨 -->


			<c:if test="${member.mem_id eq null}">

				<div class="col-xs-6 col-md-4 sidebar" id="sidebar">
					<div class="sidebar-title for-tablet">Sidebar</div>
					<aside>
						<div class="aside-body">
							<div class="featured-author">
								<div class="featured-a;;/uthor-inner">
									<div class="featured-author-cover"
										style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlxjchU3nSVmv0TUW_Df4YzVhWyWtk3nHy3g&usqp=CAU');">
										<div class="badges">
											<div class="badge-item">
												<i class="ion-star"></i> Featured
											</div>
										</div>
										<div class="featured-author-center">
											<figure class="featured-author-picture">
												<p>
													<img src="${member.mem_pic}" alt="Sample Article">
												</p>
											</figure>
											<div class="featured-author-info">
												<h2 class="name">${member.mem_id}</h2>
												<div class="desc">${member.mem_email}</div>
											</div>
										</div>
									</div>
									<div class="featured-author-body">
										<div class="featured-author-count">
											<div class="item">
												<a href="#">
													<div class="name">Posts</div>
													<div class="value">${countmysns}</div>
												</a>
											</div>
											<div class="item">
												<a href="#">
													<div class="name">Likes</div>
													<div class="value">좋아요 받은 개수</div>
												</a>
											</div>
											letter
											<div class="letter">
												<a href="#">
													<div class="name">쪽지</div>
													<div class="value">좋아요 받은 개수</div>
												</a>
											</div>
										</div>
										<div class="featured-author-quote">"Eur costrict mobsa
											undivani krusvuw blos andugus pu aklosah"</div>
										<div class="block">
											<h2 class="block-title">Photos</h2>
											<div class="block-body">
												<ul class="item-list-round" data-magnific="gallery">
													<c:forEach items="${mysnslist }" var="mySns">

														<li><a href="${mySns.sns_pic}"
															style="background-image: url('/images/snsimage/${mySns.sns_pic}');"></a></li>


													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="featured-author-footer">
											<a href="#">See All Authors</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</aside>
					<aside>
						<h1 class="aside-title">
							Popular <a href="#" class="all">See All <i
								class="ion-ios-arrow-right"></i></a>
						</h1>
						<div class="aside-body">
							<article class="article-mini">
								<div class="inner">
									<figure>
										<a href="single.html"> <img src="images/news/img07.jpg"
											alt="Sample Article">
										</a>
									</figure>
									<div class="padding">
										<h1>
											<a href="single.html">좋아요 많이 받은 내글 </a>
										</h1>
									</div>
								</div>
							</article>
						</div>
					</aside>
					<aside>
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<li class="active"><a href="#recomended"
								aria-controls="recomended" role="tab" data-toggle="tab"> <i
									class="ion-android-star-outline"></i> Random Post
							</a></li>
							<li><a href="#comments" aria-controls="comments" role="tab"
								data-toggle="tab"> <i class="ion-ios-chatboxes-outline"></i>
									Comments
							</a></li>
						</ul>

						<!-- Random Post --------------------------------------------------------------------------------- -->
						<div class="tab-content">
							<div class="tab-pane active" id="recomended">
								<article class="article-fw">
									<div class="inner">
										<figure>
											<a href="single.html"> <img src="images/news/img16.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="details">
											<div class="detail">
												<div class="time">December 31, 2016</div>
												<div class="category">
													<a href="category.html">Sport</a>
												</div>
											</div>
											<h1>
												<a href="single.html">큰 랜덤 포스트</a>
											</h1>
											<p>랜덤 포스트 글</p>
										</div>
									</div>
								</article>
								<div class="line"></div>
								<article class="article-mini">
									<div class="inner">
										<figure>
											<a href="single.html"> <img src="images/news/img10.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<h1>
												<a href="single.html">램덤 글 출력됨
													<div class="detail">
														<div class="category">
															<a href="category.html">PostDate</a>
														</div>
														<div class="time">December 20, 2016</div>
													</div>
										</div>
									</div>
								</article>
							</div>

							<!-- 댓글 확인------------------------------------------------------------------------------------------------- -->
							<div class="tab-pane comments" id="comments">
								<div class="comment-list sm">
									<div class="item">
										<div class="user">
											<figure>
												<img src="${member.mem_pic }" alt="User Picture">
											</figure>
											<div class="details">
												<h5 class="name">${member.mem_id }</h5>
												<div class="description">${member.mem_email }</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</aside>
				</div>
			</c:if>
		</div>
	</div>
</section>

<!-- =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+쪽지보내기+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=쪽지보내기=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+ -->
<div class="modal" id="modal-letter" style="z-index: 1200;">
	<div class="modal-dialog">
		<div class="modal-content" style="margin-bottom: 0px;">
			<form action="sendmail" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">쪽지 보내기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input class="snsns" name="snsns" id="snsns" style="display: none;">
					<input class="lett_nono" name="lett_no" style="display: none;">
					<input type="text" class="form-control mem_id" id="mamber-name"
						name="mem_id" style="display: none">
					<!-- 받은회원, 내 아이디 -->
					<div class="form-group">
						<label for="recipient-name" class="col-form-label ">받는회원
							ID: </label> <input type="text" class="form-control lett_sid"
							id="recipient-mname" name="lett_sid">
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label ">쪽지 제목:
						</label> <input type="text" class="form-control title"
							id="recipient-title" name="lett_title">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label ">내용:</label>
						<textarea class="form-control content" id="message-text"
							name="lett_content"
							style="margin: 0px -1px 0px 0px; width: 100%; height: 250px; resize: none;"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="sendmail">보내기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+My SNS 게시글 목록=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+My SNS 게시글 목록=+=+=+=+=+=+=+=+=+=+=+ -->
<div class="modal" id="modal-myPost" style="z-index: 1200;">
	<div class="modal-dialog">
		<div class="modal-content" style="margin-bottom: 0px;">
			<form action="sendmail" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">게시글 목록 보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-myPostList">
					<img id="img-mypost" alt="프로필" src=""><label id="label-myid">
					</label>

					<div class="mypostbox" id="mypostbox"
						style="width: 100%; height: 100%"></div>
					<div align="center">
						<script>
							function goPage(p) {
								var mem_id = $("#label-myid").text()
								location.href = "${pageContext.request.contextPath}/mysnslist/"
										+ "?p=" + p + "&mem_id=" + mem_id
							}
						</script>

						<my:paging paging="${paging}" jsfunc="goPage" />
					</div>





				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>



<div style="display: none" id="imgtemmm">

	<div id="jssor_1"
		style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 960px; height: 480px; overflow: hidden; visibility: hidden; background-color: #24262e;">
		<!-- Loading Screen -->
		<div data-u="loading" class="jssorl-009-spin"
			style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; text-align: center; background-color: rgba(0, 0, 0, 0.7);">
			<img
				style="margin-top: -19px; position: relative; top: 50%; width: 38px; height: 38px;"
				src="${pageContext.request.contextPath}/resourcesSns/css/spin.svg" />
		</div>
		<div class="appendimmm" data-u="slides"
			style="cursor: default; position: relative; top: 0px; left: 240px; width: 720px; height: 480px; overflow: hidden;">


		</div>
		<a data-scale="0" href="https://www.jssor.com"
			style="display: none; position: absolute;">web animation composer</a>
		<!-- Thumbnail Navigator -->
		<div data-u="thumbnavigator" class="jssort101"
			style="position: absolute; left: 0px; top: 0px; width: 240px; height: 480px; background-color: #000;"
			data-autocenter="2" data-scale-left="0.75">
			<div data-u="slides">
				<div data-u="prototype" class="p" style="width: 99px; height: 66px;">
					<div data-u="thumbnailtemplate" class="t"></div>
					<svg viewbox="0 0 16000 16000" class="cv">
                        <circle class="a" cx="8000" cy="8000" r="3238.1"></circle>
                        <line class="a" x1="6190.5" y1="8000"
							x2="9809.5" y2="8000"></line>
                        <line class="a" x1="8000" y1="9809.5" x2="8000"
							y2="6190.5"></line>
                    </svg>
				</div>
			</div>
		</div>
		<!-- Arrow Navigator -->
		<div data-u="arrowleft" class="jssora093"
			style="width: 50px; height: 50px; top: 0px; left: 270px;"
			data-autocenter="2">
			<svg viewbox="0 0 16000 16000"
				style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <circle class="c" cx="8000" cy="8000" r="5920"></circle>
                <polyline class="a"
					points="7777.8,6080 5857.8,8000 7777.8,9920 "></polyline>
                <line class="a" x1="10142.2" y1="8000" x2="5857.8"
					y2="8000"></line>
            </svg>
		</div>
		<div data-u="arrowright" class="jssora093"
			style="width: 50px; height: 50px; top: 0px; right: 30px;"
			data-autocenter="2">
			<svg viewbox="0 0 16000 16000"
				style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                <circle class="c" cx="8000" cy="8000" r="5920"></circle>
                <polyline class="a"
					points="8222.2,6080 10142.2,8000 8222.2,9920 "></polyline>
                <line class="a" x1="5857.8" y1="8000" x2="10142.2"
					y2="8000"></line>
            </svg>
		</div>
	</div>
<hr>

</div>
</body>
</html>