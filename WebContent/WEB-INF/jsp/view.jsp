<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$('#btn_delete').click(function() {
			location.href="deleteBoard.do?board_num=" + ${board.board_num};
		});
		
	});
</script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
	<center>
		<table border="1">
			<tr style="color: white;" bgcolor="salmon">
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>파일</th>
			</tr>
			<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td>${board.board_num }</td>
				<td>${board.title }</td>
				<td>${board.writedate }</td>
				<td>${board.readcount }</td>
				<td>${board.writer }</td>
				<td><a href="download.do?id=${boardFile.id }">
				${boardFile.originFileName } </a> 
				(${boardFile.size })</td>
			</tr>
			<tr>
				<td style="color: white;" bgcolor="salmon" align="center"
					colspan="6"></td>
			</tr>
			<tr>
				<td colspan="6"><textarea cols="70" rows="15"
						readonly="readonly">${board.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="6" align="center"><input type="button" value="목록"
					onclick="location.href='list.do'"> <c:if
						test="${isMyBoard==true}">
						<button
							onclick="location.href='updateBoardForm.do?board_num=${board.board_num}'">수정</button>
						<button id="deleteBoardBtn" data-target='#deleteModal'
							data-toggle='modal'>삭제</button>
					</c:if></td>
			</tr>

			<tr>
				<td colspan="6" align="center">
					<form action="writeReply.do">
						<input type="hidden" name="board_num" value="${board.board_num}">
						<input type="hidden" name="id_index" value="${id_index}">
						<input type="text" name="recontent" id="recontent">
						<input type="submit" value="작성">
					</form>
				</td>
			</tr>
		</table>

		<c:forEach var="replylist" items="${replylist}" varStatus="status">
			<div
				style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;
          margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">
				<c:out value="${replylist.rewriter}" />
				<c:out value="${replylist.redate}" />
				<a href="#"
					onclick="fn_replyDelete('<c:out value="${replylist.re_num}"/>')">삭제</a>
				<a href="#"
					onclick="fn_replyUpdate('<c:out value="${replylist.re_num}"/>')">수정</a>
				<a href="#"
					onclick="fn_replyReply('<c:out value="${replylist.re_num}"/>')">댓글</a>
				<br />
				<div id="reply<c:out value="${replylist.re_num}"/>">
					<c:out value="${replylist.recontent}" />
				</div>
			</div>
			<br />
		</c:forEach>

		<div class="modal fade" id="deleteModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="borderLine">
						<!-- body -->
						<div class="modal-body">삭제하시겠습니까?</div>

						<!-- Footer -->
						<div class="modal-footer">
							<button class="modal_btn btn" id="btn_delete">삭제</button>
							<button class="modal_btn btn" id="btn_cancel"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</center>
</body>
</html>