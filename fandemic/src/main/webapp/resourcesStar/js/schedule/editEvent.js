var editStId = $("#sch_stId");

/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID ??뭔데이게 ㅋㅋㅋ

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.html(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.html(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정');
    editTitle.html(event.title);
    editStart.html(event.start.format('YYYY-MM-DD HH:mm'));
    editType.html(event.type);
    editDesc.html(event.description);
    editColor.html(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () { //등록된 일정 수정

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        

        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();
        
		//alert("id테스트")
		//console.log("-----------------")
		//console.log(event._id)
        //일정 업데이트
        /*$.ajax({
            type: "post",
            url: "updateSchedule",
            data: { 
            		sch_no: event._id,
					st_id: editStId.val(),
		            sch_title: event.title,         
		            sch_startTime: event.start,      
		            sch_endTime: event.end,          
		            sch_content: event.description,       
		            sch_type: event.type,            
		            sch_bgColor: event.backgroundColor,    
		            sch_allDay: event.allDay                    
		       	 },
            success: function (response) {
                alert('수정되었습니다.')
                $("#calendar").fullCalendar('updateEvent', event);
                eventModal.modal('hide');
            },
            error:function(response){
            	alert("업데이트 실패");
            }
        }); //end ajax*/

    });
};