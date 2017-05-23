<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id ="wrap" align="center">
<h1> 게시글 등록</h1>
<form method="post" action="write.do" enctype="multipart/form-data">
	<input type="hidden" value="${id_index }" name="id_index">
	<table>
	<tr>
		<th>작성자</th>
		<td><input type = "text" name="writer" readonly="readonly" value="${member.nick }"></td>
	</tr>

	<tr>
		<th>제목</th>
		<td><input type = "text" size = "70" name="title"> * 필수 </td>
	</tr>		
	
	<tr>
		<th>내용</th>
		<td><textarea cols="70" rows="15" name="content"></textarea> </td>
	</tr>
	
	<tr> <th>파일첨부</th>
		 <td><input type="file" name="ufile"> </td>
	</tr>
	</table>
	<br><br>
	<input type="submit" value ="등록">
	<input type="reset" value ="다시 작성" >
	<input type="button" value ="목록"  onclick="location.href='list.do'">
</form>
</div>
</body>
</html>