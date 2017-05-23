<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		$('#updateBtn').click(function() {
			var title = $('#title').val();
			var content = $('#content').val();
			var writer = $('#writer').val();
			var fileuri = $('#ufile').val();
			
 			location.href="updateBoard.do?board_num=" + ${board.board_num} +
					"&id_index=" + ${id_index} +
					"&title=" + title +
					"&content=" + content +
					"&readcount=" + ${board.readcount} +
					"&ufile=" + fileuri +
					"&writer=" + writer;
		});
	});
</script>

</head>
<body>
	<div id="wrap" align="center">
		<h1>게시글 수정</h1>
			<input type="hidden" value="${id_index }" name="id_index">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" id="writer" readonly="readonly"
						value="${board.writer}"></td>
				</tr>

				<tr>
					<th>제목</th>
					<td><input type="text" size="70" id="title" value="${board.title }"> * 필수</td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea cols="70" rows="15" id="content">${board.content }</textarea></td>
				</tr>

				<tr>
					<th>파일첨부</th>
					<td><input type="file" id="ufile"> 선택하지 않으면 파일은 유지됩니다.</td>
				</tr>
			</table>
			<br>
			<br>
				<button id="updateBtn">수정</button>
				<button onclick="location.href='list.do'">목록</button>
	</div>
</body>
</html>