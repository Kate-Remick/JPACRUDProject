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
		<c:if test="${searchingMember == true }">
			<c:choose>
				<c:when test="${! empty members }">
				<c:forEach var="member" items="${members}">
					<li><a href="getMember.do?id=${member.id }" method="get">${member }</a>
					</li>
				</c:forEach>
				</c:when>
				<c:when test="${ empty members }">
					<h3>There is no family member matching your results</h3>
				</c:when>
			</c:choose>
		</c:if>
		<c:if test="${getAll == true }">
			<h2>All family members:</h2>
			<ul>
				<c:forEach var="member" items="${members}">
					<li><a href="getMember.do?id=${member.id }" method="get">${member }</a>
					</li>
				</c:forEach>
			</ul>
		</c:if>
	<%@ include file="bootstrapFooter.jsp"%>
</body>
</html>