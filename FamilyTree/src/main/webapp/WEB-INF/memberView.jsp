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
	<h1>Information on ${member}</h1>
	<c:if test="${memberAdded == true }">
		<p>${memberToAdd }addedtothe family tree successfully!</p>
	</c:if>


	<div name="image">
		<h1>Include image here</h1>
		<c:if test="${editing == true }">
			<form action="editMember.do" method="post">
				<input type="hidden" name="member" value="${member }"> <input
					type="hidden" name="editingPhoto" value="${true}"> <input
					type="hidden" name="editingDetails" value="${false}"> <input
					type="hidden" name="editingRelationships" value="${false}">
				<button type="submit">
					Change Photo
					</buttion>
			</form>
		</c:if>
	</div>


	<div name="details">
		<ul>
			<li>Born on: ${member.birthDate }</li>
			<c:if test="${member.alive = false }">
				<li>Died on: $member.deathDate</li>
			</c:if>
			<c:if test="${editing == true }">
				<form action="editMember.do" method="post">
					<input type="hidden" name="member" value="${member }"> <input
						type="hidden" name="editingDetails" value="${true}"> <input
						type="hidden" name="editingPhoto" value="${false}"> <input
						type="hidden" name="editingRelationships" value="${false}">
					<button type="submit">
						Edit Details
						</buttion>
				</form>

			</c:if>
		</ul>

	</div>


	<div name="relationships">
		<ul>
			<c:if test="${member.married = true }">
				<c:choose>
					<c:when test="${! empty spouse }">
						<li>Married to: <a href="getMember.do?id=${spouse.id}">${spouse }</a></li>
					</c:when>
					<c:otherwise>
						<li>Spouse unknown</li>
					</c:otherwise>
				</c:choose>
			</c:if>
			<li><a href="getMember.do?id=${mother.id }">Mother: ${mother }</a>
			</li>
			<li><a href="getMember.do?id=${father.id }">Father: ${father }</a>
			</li>
			<li>Siblings
				<ul>
					<c:forEach var="sibling" items="${siblings }">
						<li><a href="getMember.do?id=${sibling.id }">${sibling }</a></li>
					</c:forEach>
				</ul>
			</li>
		</ul>
		<c:if test="${editing == true }">
			<form action="editMember.do" method="post">
				<input type="hidden" name="member" value="${member }"> <input
					type="hidden" name="editingDetails" value="${false}"> <input
					type="hidden" name="editingPhoto" value="${false}"> <input
					type="hidden" name="editingRelationships" value="${true}">
				<button type="submit">
					Edit Relationships
					</buttion>
			</form>

		</c:if>

	</div>

	<%@ include file="bootstrapFooter.jsp"%>
</body>
</html>