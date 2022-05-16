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
	<h1>Welcome to the Family</h1>
	<p>
		This is a detailed family tree, showing the history of the Smith
		family. <br> You can add members, change member information or
		remove members from the family using the links provided on this page.
		<br> Otherwise, you can view the information of one or all family
		members using the form below!
	</p><br>
	<c:if test="${deleting == true }">
		<c:if test="${deletionSuccess == true }">
			<p>Deletion Successful. All Records Clean</p>
		</c:if>
		<c:if test="${deletionSuccess == false }">
			<p>Something went wrong. Deletion was not successful.</p>
		</c:if>
	</c:if>
	<c:if test="${editedMember == true }">
		<p>Family member edited: ${memberEdited}</p>
	</c:if>
	<c:if test="${memberAdded == true }">
		<p>Something went wrong. Your family member was not added.</p>
	</c:if>
	<div name="searchByName">
		<form action="getMember.do" method="get">
			<label for="firstName">First Name: </label><input type="text"
				name="firstName" /><br> <label for="lastName">Last
				Name: </label><input type="text" name="firstName" /> <br>
			<button type="submit">Submit</button>
		</form>
	</div>
	<div name="searchById">
		<form action="getMember.do" method="get">
			<label for="Id">Enter Id: </label><input type="text" name="id" /><br>
			<button type="submit">Submit</button>
		</form>
	</div>
	<a href="getMember.do" method="get">
		<button>View all family members</button>
	</a>
	<a href="addMember.do" method="get">
		<button>Add family member</button>
	</a>
	<form action="editMember.do" method="get">
		<label for="memberToEdit">Select Member:</label>
			<select id="memberToEdit" name="memberToEdit" >
			<c:forEach var="member" items="${allMembers}">
			<option value="${member.id}">${member }</option>
			</c:forEach>
			</select>
		<button type="submit">Change member details</button>

	</form>
	<a href="delete.do" method="get">
		<button>Remove Family Member</button>
	</a>
	<%@ include file="bootstrapFooter.jsp"%>
</body>

</html>