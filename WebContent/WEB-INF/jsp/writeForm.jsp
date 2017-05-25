<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
   crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#date').html(new Date());
	});

</script>
<style>
.thead {
	font-size: 16px;
}

.btn {
	font-weight: bold;
	border-radius : 10px;
	background-color: #D8BFD8;
	padding: 10px 35px;
	text-align: center;
	color: white;
}

.btn:hover {
	background-color: grey;
	color: #fff;
	text-decoration: none;
}
td {
	padding : 5px;
}

</style>
</head>
<body>
	<center>
	<h1>Write Board</h1>
	
		<form method="post" action="write.do" enctype="multipart/form-data">
			<input type="hidden" name="id_index" value="${id_index }">
			<input type="hidden" name="writer" value="${member.nick }">
		<table border="1" style="padding: 50px;">
				<tr style="color: white;" bgcolor="#D8BFD8">
					<th align="center" class="thead" width="550px">Title</th>
					<th align="center" class="thead" width="200px">Date</th>
					<th align="center" class="thead" width="150px">Writer</th>
					<th align="center" class="thead" width="50px">File</th>
				</tr>
				
				<tr align="center" style="font-family: 'monaco';" bgcolor="white">
					<td><input style="width:550px;" type="text" name="title"></td>
					<td id="date"></td>
					<td>${member.nick }</td>
					<td align="center"><input type="file" name="ufile"></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="text" style="padding: 10px; width: 100%; height: 300px" name="content"></td>
				</tr>
				
				<tr>
					<td colspan="4" align="center" style="margin: 10px; padding: 10px;">
						<input class="btn" type="submit" value ="등록">
						<input class="btn" type="reset" value ="다시 작성" >
						<input class="btn" type="button" value ="목록"  onclick="location.href='list.do'">
					</td>
				</tr>
			</table>
		</form>
	
	</center>
</body>
</html>