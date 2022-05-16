<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="bootstrapHeader.jsp"%>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<h1>Delete family member?</h1>
	<h3>Warning! This will affect all progeny records!</h3>
	<form action="delete.do" method="post">
		<label for="memberDeletion">Select member to delete</label> <select
			name="deleteId" id="memberDeletion">
			<c:forEach var="member" items="${allMembers }">
				<option value="${member.id }">${member }</option>
			</c:forEach>
		</select>
		<button type="submit">Delete member</button>
	</form>
	<%@ include file="bootstrapFooter.jsp"%>
</body>
</html>