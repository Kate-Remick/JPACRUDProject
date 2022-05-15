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

	<h1>Adding new family member:</h1>
	<div name="memberInformation">
		<form action="addMember.do" method="post">
			<div name="name">
				<label for="firstName">First Name: </label><input type="text"
					name="firstName" /><br> <label for="lastName">Last
					Name: </label><input type="text" name="lastName" /> <br>
			</div>
			<div name="dates">
				<labelfor="birthDate">Birth Date: </label>
				<input type="text" name="birthDate" value="" />
				<br>
				<p>(yyyy-mm-dd)</p>
				<label for="deathDate">Death Date: </label>
				<input type="text" name="deathDate" value="" />
				<br>
				<p>(yyyy-mm-dd)</p>
				<br>
			</div>
			<div name="gender">
				<h5>Gender:</h5>
				<label for="male">Male</label><input type="radio" name="gender"
					value="male" /> <label for="female">Female</label><input
					type="radio" name="gender" value="female" /><label
					for="other/unknown">Other/Unknown</label><input type="radio"
					name="gender" value="other/unknown" /> <br>
			</div>
			<div name="spouse">
			<label for="spouse">Spouse:</label> <select name="spouseId"
				id="spouse">
				<option value=>Not married</option>
				<option value=>Spouse not listed</option>
				<c:forEach var="person" items="${allMembers}">
					<c:if
						test="${person.married == false || (person.married == true && person.spouseId == member.id) }">
						<option value="${person.id}">${person}</option>
					</c:if>
				</c:forEach>
			</select>
			</div>
			<div name="parents">
			<h5>Parents: (Parents must be added to table to be available)</h5>
			<label for="mother">Mother:</label> <select name="motherId"
				id="mother">
				<option value=>unknown or not listed</option>
				<c:forEach var="woman" items="${women}">
					<option value="${woman.id }">${woman }</option>
				</c:forEach>
			</select> <label for="father">Father:</label> <select name="fatherId"
				id="father">
				<option value=>unknown or not listed</option>
				<c:forEach var="man" items="${men}">
					<option value="${man.id }">${man }</option>
				</c:forEach>
			</select>
			</div>


			<h3>Image upload option</h3>
			<input type="file" name="memberPhoto" accept="image/*" />
			<button type="submit">Submit</button>
		</form>

	</div>

	<%@ include file="bootstrapFooter.jsp"%>
</body>
</html>