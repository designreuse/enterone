<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>

</style>

<script>

$(document).ready(function() {
	

	$("#check").on('click', function() {

		var statement = $("#textTest").val();
		
		var list = ${filList};
		for(var i=0; i<list.length; i++) {
			
			var keyword = list[i].fil_prohibited;
			
			if (statement.indexOf(keyword) != -1) {
				var re = new RegExp(keyword, "g");
			    statement = statement.replace(re, list[i].fil_alternative);
			    console.log(statement);
			    $("#textTest").val(statement);
			}
		}
		
	});

	

});


</script>



<section class="content">

	<div align="center">
		<textarea rows="10" cols="50" id="textTest"></textarea>
		<button id="check">등록</button>
	</div>


</section>























