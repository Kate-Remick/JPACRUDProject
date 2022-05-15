<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="bootstrapHeader.jsp" %>
</head>
<body>
<%@ include file="nav.jsp" %>

<h1>The site is up!</h1>
<a href="getMember.do?id=2" method="get">Get the member</a>
<%@ include file="bootstrapFooter.jsp" %>
</body>
</html>