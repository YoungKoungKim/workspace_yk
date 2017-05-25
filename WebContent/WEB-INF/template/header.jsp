<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
   
</script>

<style type="text/css">
@CHARSET "UTF-8";
@import url('https://fonts.googleapis.com/css?family=Barrio|Kumar+One|Pacifico');

@font-face {
	font-family: 'Barrio', cursive;
	font-family: 'Kumar One', cursive;
	font-family: 'Pacifico', cursive;
}

#header {
	font-family: 'Pacifico', cursive;
	background-color: #D8BFD8;
	color: #fff;
	padding-top: 15px;
	padding-bottom: 10px;
}

#header a {
	font-size : 2em;
	color: #FFFFFF;
}


</style>
</head>
<body>
   <c:choose>
      <c:when test="${id_index == null}">
         <div id="header">
            <div class="container">
               <div class="row">
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 logo-wrapper">
                     <a href="main.do">BoardTest</a>
                  </div>
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right">
                     <div class="menu-links scroll-me">
                        <!-- 공유게시판 -->
                        <a href="list.do" title="공유게시판">BulletinBoard</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <!-- 로그인 -->
                        <a href="main.do" title="로그인">Login</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </c:when>
      <c:otherwise>
         <div id="header">
            <div class="container">
               <div class="row">
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 logo-wrapper">
                     <a href="main.do">BoardTest</a>
                  </div>
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right">
                     <div class="menu-links scroll-me">
                        <!-- 공유게시판 -->
                        <a href="list.do" title="공유게시판">BulletinBoard</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <!-- 정보-->
                        <a href="logout.do" title="로그아웃" id="header_Logout">Logout</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </c:otherwise>
   </c:choose>
</body>
</html>