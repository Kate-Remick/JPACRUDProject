<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family Member Edit</title>
</head>
<body>
	<h3>Editing details for ${member}</h3>
	<c:choose>
		<c:when test="${editingRelationships == true }">
			<form action="editMember.do" method="post">
				<h3>Edit Father:</h3>
				<label for="father">Father:</label> <select name="fatherId"
					id="father">
					<option value=>unknown or not listed</option>
					<c:forEach var="man" items="${men}">
						<option value="${man.id }">${man }</option>
					</c:forEach>
				</select>
				<h3>Edit Mother:</h3>
				<label for="mother"> Mother:</label> <select name="motherId"
					id="mother">
					<option value=>unknown or not listed</option>
					<c:forEach var="woman" items="${women}">
						<option value="${woman.id }">${woman }</option>
					</c:forEach>
				</select>
				<h3>Edit Spouse:</h3>
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
				</select> <input type="hidden" name="memberToEditId" value="${member.id }" />
				<input type="hidden" name="firstName" value="${member.firstName }" />
				<input type="hidden" name="lastName" value="${member.lastName }" />
				<input type="hidden" name="gender" value="${member.gender }" /> <input
					type="hidden" name="birthDate" value="${member.birthDate }" /> <input
					type="hidden" name="deathDate" value="${member.deathDate }" /> <input
					type="hidden" name="alive" value="${member.alive }" /> <input
					type="hidden" name="imagePath" value="${member.imagePath }" />
				<button type="submit">Submit Changes</button>
			</form>
		</c:when>
		<c:when test="${editingDetails == true }">
			<form action="editMember.do" method="post">
				<label for="firstName">First Name: </label><input type="text"
					name="firstName" value="${member.firstName }" /><br> <label for="lastName">Last
					Name: </label><input type="text" name="lastName" value="${member.lastName }"/> <br>
				<labelfor="birthDate">Birth Date: </label> <input type="text"
					name="birthDate" value="${member.birthDate }" /> <br>
				<p>(yyyy-mm-dd)</p>
				<label for="deathDate">Death Date: </label> <input type="text"
					name="deathDate" value="${member.deathDate }" /> <br>
				<p>(yyyy-mm-dd)</p>
				<br>
				<h5>Gender:</h5>
				<label for="male">Male</label>
				<input type="radio" name="gender" value="male" /> <br>
				<label for="female">Female</label>
				<input type="radio" name="gender" value="female" /> <br>
				<label for="other/unknown">Other/Unknown</label>
				<input type="radio" name="gender" value="other/unknown" /> <br>
				<input type="hidden" name="memberToEditId" value="${member.id }" />
				<input type="hidden" name="imagePath" value="${member.imagePath }" />
				<input type="hidden" name="married" value="${member.married }" /> <input
					type="hidden" name="motherId" value="${member.motherId }" /> <input
					type="hidden" name="fatherId" value="${member.fatherId }" /> <input
					type="hidden" name="spouseId" value="${member.spouseId }" /> <input
					type="hidden" name="married" value="${member.married }" />
				<button type="submit">Submit Changes</button>
			</form>
		</c:when>
		
		<c:otherwise></c:otherwise>
	</c:choose>


</body>
</html>