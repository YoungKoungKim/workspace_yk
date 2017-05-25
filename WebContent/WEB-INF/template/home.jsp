<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Board Test</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/bootstrap.css">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
   crossorigin="anonymous"></script>
   
<script type="text/javascript">
	$(document).ready(function() {
		$('#content').css('min-height', $(window).height()-200);
	});
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Barrio|Khula|Kumar+One|Pacifico');
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@font-face {
	font-family: 'Barrio', cursive;
	font-family: 'Kumar One', cursive;
	font-family: 'Pacifico', cursive;
	font-family: 'Khula', sans-serif;
	font-family: 'Nanum Gothic Coding', serif;
}

h1 {
	font-family: 'Kumar One', cursive;
	color: #4B0082;
}

#h1 {
	font-family: 'Kumar One', cursive;
	color: #4B0082;
}

:leng(en) {
	font-family: 'Khula', sans-serif;
}

html, body {
	height: auto;
}
#header {
	height: 100px;
}
#container {
	background-color: white;
	font-family: 'Nanum Gothic Coding', serif;
}
#container #content {
	height: auto;
	font-family: 'Nanum Gothic Coding', serif;
	padding-top: 50px;
}
#footer {
	font-family: 'Khula', sans-serif;
	background-color: #D8BFD8;
	padding-top : 25px;
	margin-top : 30px;
	width : 100%;
	min-height: 70px;
    height : auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>
	
	<div id=container>
		<div id="content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>
</html>