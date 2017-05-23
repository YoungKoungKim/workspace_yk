<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var vaild_id = false;
		var vaild_pass = false;
		var vaild_nick = false;
		
		$('#joinId').keyup(function() {
			vaild_id = false;
			var id = $('#joinId').val();
			$.ajax({
				url : 'idCheck.do',
				data : 'id='+id,
				dataType : 'json',
				type: 'post',
				success : function(data){
					if (data.result) {
						vaild_id = true;
						$('#joinIdMsg').html('사용 가능한 아이디 입니다.');
					} else {
						vaild_id = false;
						$('#joinIdMsg').html('이미 사용중인 아이디입니다.');
					}
				},
				error : function(data) {
					alert('error1');
				}
			});
		});
		
		$('#joinNick').keyup(function() {
			vaild_nick = false;
			var id = $('#joinNick').val();
			$.ajax({
				url : 'nickCheck.do',
				data : "id="+id,
				dataType : 'json',
				type: 'post',
				success : function(data){
					if (data.result)
						vaild_nick = true;
					else
						vaild_nick = false;
				},
				error : function(data) {
					alert('error');
				}
			});
		});
		
		$('#joinPassChk').keyup(function() {
			vaild_pass = true;
		});
		
		$('#btn_join').click(function(){
			if (vaild_id && vaild_nick && vaild_pass) {
				$.ajax({
					url : 'join.do',
					data : "id="+$('#joinId').val()+
					"&nick="+$('#joinNick').val()+
					"&pass="+$('#joinPass').val(),
					dataType : 'json',
					type: 'post',
					success : function(data){
						alert(data.msg);
						location.reload();
					},
					error : function(data) {
						alert('에러');
						alert(data.msg);
					}
				}); 
			} else {
				alert('잘못된 입력이 있습니다.');
			}
			
		});
		
		$('#loginBtn').click(function() {
			$.ajax({
				url : 'login.do',
				data : "id="+$('#inputId').val()+
				"&pass="+$('#inputPass').val(),
				dataType : 'json',
				type: 'post',
				success : function(data){
					alert(data.msg);
					location.href=data.next;
				},
				error : function(data) {
					alert('에러');
					alert(data.msg);
				}
			}); 
		})
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
		<c:choose>
			<c:when test="${id_index == null}">
				<table>
					<tr><td>아이디</td><td><input type="text" id="inputId"></td></tr>
					<tr><td>비밀번호</td><td><input type="text" id="inputPass"></td></tr>
				</table>
				<button id="loginBtn">로그인</button>
				<button id="joinBtn" data-target='#joinModal' data-toggle='modal'>회원가입</button>
				<button id="useGuest" onclick="location.href='list.do'">가입하지 않고 이용</button>

			</c:when>
			<c:otherwise>
				<a href="list.do">리스트로 이동</a>
				<input type="button" value="로그아웃"
					onclick="location.href='logout.do'">
			</c:otherwise>
		</c:choose>
	</center>


	<div class="modal fade" id="joinModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="borderLine">
					<div class="modal-header">
						회원가입
					</div>
					<!-- body -->
					<div class="modal-body">
						<table>
							<tr>
								<td>아이디</td><td><input type="text" id="joinId"></td><td><span id="joinIdMsg"></span></td>
							</tr>
							<tr>
								<td>닉네임</td><td><input type="text" id="joinNick"></td><td><span id="joinNickMsg"></span></td>
							</tr>
							<tr>
								<td>비밀번호</td><td><input type ="text" id="joinPass"></td><td><span id="joinPassMsg"></span></td>
							</tr>
							<tr>
								<td>비밀번호 확인</td><td><input type="text" id="joinPassChk"></td><td><span id="joinPassChkMsg/g"></span></td>
							</tr>
						</table>
						
					</div>
						
					<!-- Footer -->
					<div class="modal-footer">
						<button name="join" class="modal_btn btn" id="btn_join">가입</button>
						<button name="cancel" class="modal_btn btn" id="btn_cancel"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>