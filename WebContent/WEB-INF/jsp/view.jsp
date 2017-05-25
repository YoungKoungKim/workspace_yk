<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.pageBtn {
	font-weight: bold;
	border-radius : 3px;
	background-color: #D8BFD8;
	padding: 4px 10px;
	text-align: center;
	color: #FFF;
}

#deleteMsg {
	margin: 20px;
	font-size: 20px;
}

#replyTr:hover {
	background-color: #F4DFF4;
}

</style>

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<script type="text/javascript">

var nowClickReply;

function fn_replyReply(re_num) {
	nowClickReply = re_num;
}

	$(document).ready(function() {
		$('#btn_delete').click(function() {
			location.href="deleteBoard.do?board_num=" + ${board.board_num};
		});
		
		$('#btn_reReplyWrite').click(function() {
			location.href="writeReReply.do?reparent=" + nowClickReply
				+ "&id_index=" + ${id_index}
				+ "&board_num=" + ${board.board_num}
				+ "&recontent=" + $('#edt_reReply').val();
		});
		
	});
</script>

</head>
<body>
	<center>
		<table border="1">
			<tr style="color: white;" bgcolor="#D8BFD8">
				<th align="center" class="thead" width="50px">No.</th>
				<th align="center" class="thead" width="600px">Title</th>
				<th align="center" class="thead" width="150px">Date</th>
				<th align="center" class="thead" width="100px">ReadCnt</th>
				<th align="center" class="thead" width="150px">Writer</th>
				<th align="center" class="thead" width="150px">File</th>
			</tr>
			<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td>${board.board_num }</td>
				<td>${board.title }</td>
				<td><fmt:formatDate value="${board.writedate }" pattern="yyyy-MM-dd" /></td>
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
				<td colspan="6" align="center" style="padding: 10px; width: 100%; height: 300px">
				${board.content }
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center"><input style="margin:10px;" class="btn" type="button" value="목록"
					onclick="location.href='list.do'"> <c:if
						test="${isMyBoard==true}">
						<button
							class="btn" onclick="location.href='updateBoardForm.do?board_num=${board.board_num}'">수정</button>
						<button class="btn" id="deleteBoardBtn" data-target='#deleteModal'
							data-toggle='modal'>삭제</button>
					</c:if></td>
			</tr>
			
			<c:if test="${id_index != null }">
				<tr>
				<td colspan="6" align="center" style="padding:10px;">
					<form action="writeReply.do">
						<input type="hidden" name="board_num" value="${board.board_num}">
						<input type="hidden" name="id_index" value="${id_index}">
						<input style="width:800px; height:50px" type="text" name="recontent" id="recontent">
						<input class="pageBtn btn" type="submit" value="댓글 작성">
					</form>
				</td>
			</tr>
			</c:if>
			
			<c:forEach var="replylist" items="${replylist }" varStatus="status">
				<tr id="replyTr">
					<td colspan="4" style="padding-left: 10px">
					<c:choose>
						<c:when test="${replylist.redepth > 0 }">
							<c:forEach begin="1" end="${replylist.redepth - 1}">
								&nbsp;
							</c:forEach>
							ㄴ
						</c:when>
						<c:otherwise>*</c:otherwise>
					</c:choose>
					
					<c:out value="${replylist.rewriter} : " />
					<c:out value="${replylist.recontent}" />
					</td>
					<td align="center">
					<fmt:formatDate value="${replylist.redate }" pattern="yyyy-MM-dd" />
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${id_index != null}">
							<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.re_num}"/>')">삭제</a>
							<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.re_num}"/>')">수정</a>
							<a href="#" onclick="fn_replyReply('<c:out value="${replylist.re_num}"/>')" 
										data-target='#reReplyModal'
										data-toggle='modal' >댓글</a>
							</c:when>
							<c:otherwise>
								<a href="main.do">댓글 작성은 로그인 후 가능합니다.</a>
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
			</c:forEach>
		</table>

		<div class="modal fade" id="deleteModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="borderLine">
						<!-- body -->
						<div class="modal-body" id="deleteMsg">삭제하시겠습니까?</div>

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
		
		<div class="modal fade" id="reReplyModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="borderLine">
						<div class="modal-header"><h1>Write re:Reply</h1></div>
						<!-- body -->
						<div class="modal-body">
							<input type="text" style="width:500px; height: 50px;" id="edt_reReply">
						</div>

						<!-- Footer -->
						<div class="modal-footer">
							<button class="modal_btn btn" id="btn_reReplyWrite">작성</button>
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