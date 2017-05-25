<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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

</style>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#updateCancelBtn').click(function() {
			location.href="view.do?board_num=" + ${board.board_num };
		});
	});
</script>

</head>
<body>
	<center>
	<form method="post" action="updateBoard.do" enctype="multipart/form-data">
		<input type="hidden" name="id_index" value="${id_index }">
		<input type="hidden" name="fileid" value="${board.fileid }">
		<input type="hidden" name="board_num" value="${board.board_num }">
		<input type="hidden" name="readcount" value="${board.readcount }">
		<input type="hidden" name="wrtier" value="${board.writer }">
		<table border="1">
			<tr style="color: white;" bgcolor="#D8BFD8">
				<th align="center" class="thead" width="50px">No.</th>
				<th align="center" class="thead" width="700px">Title</th>
				<th align="center" class="thead" width="200px">Date</th>
				<th align="center" class="thead" width="100px">ReadCnt</th>
				<th align="center" class="thead" width="150px">Writer</th>
				<th align="center" class="thead" width="50px">File</th>
			</tr>
			
			<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td>${board.board_num }</td>
				<td><input style="width:650px;" type="text" name="title" value="${board.title }"></td>
				<td><fmt:formatDate value="${board.writedate }" pattern="yyyy-MM-dd" /></td>
				<td>${board.readcount }</td>
				<td>${board.writer }</td>
				<td>현재 파일 ${boardFile.originFileName }(${boardFile.size })
					<input type="file" name="ufile"></td>
			</tr>
			<tr>
				<td style="color: white;" bgcolor="salmon" align="center"
					colspan="6"></td>
			</tr>
			<tr>
				<td colspan="6" align="center"><input type="text" style="padding: 10px; width: 100%; height: 300px" name="content" value="${board.content }"></td>
			</tr>
			
			<tr>
				<td colspan="6" align="center" style="margin: 10px; padding: 10px;">
					<input class="btn" type="submit" value="수정">
					<input class="btn" id="updateCancelBtn" type="button" value="취소">
				</td>
			</tr>
			</table>
		</form>
	</center>
</body>
</html>