<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>
<link href="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" />
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script>
$(function(){
	var com_id = "${company.com_id }";
	console.log(com_id);
	//방문자수조회
	/* $.ajax({
		url:"${pageContext.request.contextPath}/management/company/visitorCnt",
		dataType:"json",
		success:function(response){
			alert("방문자수조회성공")
		},
		error:function(response){
			alert("방문자수조회실패")
		}
	}) */   
	   
	//매출현황
	$.ajax({
		url:"${pageContext.request.contextPath}/management/company/DaySalesList",
		dataType:"json",
		data:{com_id:com_id},
		success:daySalesListResult
		,
		error:function(response){
			alert("매출현황에러지롱");
		}
	}) //end ajax
	
	// 차트
	var ctx = $('#myChart');
	var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ '${stCnt[0].ST_NAME}', '${stCnt[1].ST_NAME}', '${stCnt[2].ST_NAME}'],
				datasets : [ {
					label : '팬클럽',
					data : [ '${stCnt[0].CNT}', '${stCnt[1].CNT}', '${stCnt[2].CNT}'],
					backgroundColor: ["rgba(255, 0, 0, 0.5)", "rgba(100, 255, 0, 0.5)", "rgba(200, 50, 255, 0.5)" ]
					
				} ]
			},      
			options : {
				
				legend : {
					labels : {
						fontColor : 'rgba(83, 51, 237, 1)',
						fontSize : 15
					}
				},
				scales : {
					xAxes : [ {
						ticks : {
							fontColor : 'rgba(27, 163, 156, 1)',
							fontSize : '15'
						}
					} ],
					yAxes : [ {
						ticks : {
							beginAtZero : true,
							fontColor : 'rgba(246, 36, 89, 1)',
							fontSize : '15'
						}
					} ]
				}
			}
		});
}); //end ready function
   
function daySalesListResult(data){
	$("tbody").empty();
	$.each(data,function(idx,item){//idx=index, item=value
		$('<tr>').attr("class","cnoticeTr")
		.append($('<td>').html(item.gb_time))
		.append($('<td>').html(item.gb_payment))
		.appendTo('tbody');
		
	});//end each
	$('#dataTable').DataTable();
}
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart); //차트에 대한 정보를 뿌려줘라

function drawChart() {
	var arr = [['월','매출액']];
	var com_id = "${company.com_id }";
	$.ajax({
		url:"${pageContext.request.contextPath}/management/company/Chart",
		dataType:"json",
		data: {com_id:com_id},
		async : false,
		success:function(response){
			//alert("차트성공");
			console.log(response);
			  $.each(response, function(idx, val) {
				 console.log(idx+"+"+val.gb_time);
				 console.log(idx+"+"+val.gb_payment*1);
		            var a = [];
		            a.push(val.gb_time);
		            a.push(val.gb_payment*1);
		            arr.push(a);
		         }) 

		},
		error:function(response){
			alert("매출현황에러");
		}
	})
  var data = google.visualization.arrayToDataTable(arr);

	var options = {

			title: '스토어 매출현황',

			hAxis: {

			title: '',

			titleTextStyle: {

			color: 'red'

			}

			}

			};



  /* var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

  chart.draw(data, google.charts.Bar.convertOptions(options)); */
  var objDiv = document.getElementById('columnchart_material');
  var chart = new google.visualization.ColumnChart(objDiv);
  chart.draw(data, options);
  
}

</script>
<style>
	#myChart{
		width:740px !important;
		height:370px !important;
		align:center;
	}
</style>
	
    <!-- Main content -->
    <section class="content">
    <p><h2>소속사 팬 TOP3</h2></p>
    	<!-- 차트 -->
		<div>
			<div> 
				<div align="center" class="chart-container" style=" padding: 20px">
					<canvas id="myChart"></canvas>
				</div>
			</div>
		</div>
       <p><h2>스토어 매출현황</h2></p>	
    	<!-- 구글차트 -->
       <div id="columnchart_material" style="width: 100%; height: 300px;"></div>
       <!-- datatable -->
       <div class="card-body">
              
                <table id="dataTable" class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>년월일</th>
                      <th>일매출현황</th>
                      
                    </tr>
                  </thead>
                  <tbody>
                              <!-- body 들어간데 ~ -->   
                  </tbody>
                </table>
           
        </div>
    </section>
