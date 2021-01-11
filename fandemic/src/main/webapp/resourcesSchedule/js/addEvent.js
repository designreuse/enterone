var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');
var editStId = $("#sch_stId");

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () { //일정 입력하고 등록버튼 눌렀을시 이벤트정의

        var eventData = {
            _id: eventId,
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            username: '사나',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

       

		//var insertData = { //DB에 저장할값들
		//	st_id: editStId.val(),
        //    sch_title: editTitle.val(),          //제목
        //    sch_startTime: editStart.val(),      //시작일시간
        //    sch_endTime: editEnd.val(),          //종료일시간
        //    sch_content: editDesc.val(),         //내용
        //   sch_type: editType.val(),            //구분(행사,콘서트 등?)
        //    sch_bgColor: editColor.val(),    //달력에 표시될 백그라운드색
        //    sch_txtColor: '#ffffff',                //달력에 표시될 글자색
        //    sch_allDay: false                    //하루종일인지 아닌지
        //};
		//alert(editTitle.val());
        //새로운 일정 저장
        $.ajax({
            type: "post",
            url: "insertSchedule",
            data: { 
					st_id: editStId.val(),
		            sch_title: editTitle.val(),         
		            sch_startTime: editStart.val(),      
		            sch_endTime: editEnd.val(),          
		            sch_content: editDesc.val(),       
		            sch_type: editType.val(),            
		            sch_bgColor: editColor.val(),    
		            sch_txtColor: '#ffffff',                
		            sch_allDay: eventData.allDay                    
		       	 },
            success: function (response) {
            	if(response!=null){
	            	//alert("성공");
	            	 $("#calendar").fullCalendar('renderEvent', eventData, true); //화면에보일 렌더링
	        		//eventModal.find('input, textarea').val('');
	        		editAllDay.prop('checked', false);
	       		    eventModal.modal('hide');
	                //DB연동시 중복이벤트 방지를 위한
	                $('#calendar').fullCalendar('removeEvents');
	                $('#calendar').fullCalendar('refetchEvents');
       		    }
            },
            error:function(response){
            	alert("에러");
            }
        });
    }); //end 일정 저장 버튼
};