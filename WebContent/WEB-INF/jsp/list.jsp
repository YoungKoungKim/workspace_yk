<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

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
	background-color: #FFDAB9;
	padding: 4px 10px;
	text-align: center;
	color: #FFF;
}

.pageBtn:hover {
	background-color: #D8BFD8;
	color: #fff;
	text-decoration: none;
}

</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function locatePage(page) {
		location.href = 'list.do?page=' + page;
	}

	function nextPage(page) {
		page++;
		location.href = 'list.do?page=' + page;
	}

	function lastPage(page) {
		page--;
		location.href = 'list.do?page=' + page;
	}

</script>
</head>
<body>
	<center>
		<div>
			<h1>Board List</h1>
			<table border="1">
				<tr>
					<th align="center" class="thead" width="100px">No.</th>
					<th align="center" class="thead" width="700px">Title</th>
					<th align="center" class="thead" width="200px">Date</th>
					<th align="center" class="thead" width="100px">ReadCnt</th>
					<th align="center" class="thead" width="150px">Writer</th>
				</tr>
				<tr>
					<td colspan="5" bgcolor="PeachPuff" height="4"></td>
				</tr>
				<c:forEach var="board" items="${boardList}" varStatus="b">
					<tr height="25px">
						<td align="center">${board.board_num}</td>
						<td>&nbsp;&nbsp;<a href="view.do?board_num=${board.board_num}&writer=${board.writer}">${board.title}</a></td>
						<td align="center"><fmt:formatDate
								value="${board.writedate }" pattern="yyyy-MM-dd" /></td>
						<td align="center">${board.readcount }</td>
						<td align="center">${board.writer}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" bgcolor="PeachPuff" height="4"></td>
				</tr>
			</table>
		</div>
		<br>
		<div>
			<div>
				<c:if test="${start != 1}">
					<input class="pageBtn btn" type="button" value="처음"
						onclick="location.href='list.do?page=1'">
					<input class="pageBtn btn" type="button" value="이전페이지" onclick="lastPage(${start})">
				</c:if>
				<c:forEach begin="${start}" end="${end}" var="page">
					<c:choose>
						<c:when test="${page == current}">
					[${page}]
				</c:when>
						<c:otherwise>
							<a href="list.do?page=${page}">${page}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${end < last}">
					<input class="pageBtn btn" type="button" value="다음페이지" onclick="nextPage(${end})">
					<input class="pageBtn btn" type="button" value="끝"
						onclick="location.href='list.do?page=${last}'">
				</c:if>
			</div>

		</div>
		<br>
	<div>
		<c:if test="${id_index != null}">
			<input class="btn" type="button" value="글쓰기" onclick="location.href='writeForm.do'">
		</c:if>
		<input class="btn" type="button" value="메인으로" onclick="location.href='main.do'">
	</div>
	</center>
	
</body>
</html>