<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${editingRelationships == true }">
			<form action="editMember.do" method="post">
				<h3>Edit Father:</h3>
				<label for="father">Choose father:</label> <select name="father_id"
					value="null" id="mother">unknown/not in list
				</select>
				<c:forEach var="man" items="${men}">
					<select name="father_id" value="${man.id }">${man }</select>
				</c:forEach>
				<h3>Edit Mother:</h3>
				<label for="mother">Choose mother:</label> <select name="mother_id"
					value="null" id="mother">unknown/not in list
				</select>
				<c:forEach var="woman" items="${women}">
					<select name="mother_id" value="${woman.id }">${woman }</select>
				</c:forEach>
			</form>
			<h3>Edit Spouse:</h3>
			<select name="spouseId" value="null">Not married
				<input type="hidden" name="married" value="false" />
			</select>
			<select name="spouseId" value="null"> Spouse not listed
			</select>
			<c:forEach var="person" items="${allMembers}">
				<c:if
					test="${person.married == false || (person.married == true && person.spouseId == member.id) }">
					<select name="spouseId" value="${person.id }"> ${person}
						<input type="hidden" name="married" value="true" />
					</select>
				</c:if>
			</c:forEach>

			<input type="hidden" name="memberToEdit" value="${member }" />
			<input type="hidden" name="firstName" value="${member.firstName }" />
			<input type="hidden" name="lastName" value="${member.lastName }" />
			<input type="hidden" name="gender" value="${member.gender }" />
			<input type="hidden" name="birthDate" value="${member.birthDate }" />
			<input type="hidden" name="deathDate" value="${member.deathDate }" />
			<input type="hidden" name="alive" value="${member.alive }" />
			<input type="hidden" name="imagePath" value="${member.imagePath }" />

		</c:when>
		<c:when test="${editingDetails == true }">
			<form action="editMember.do" method="post">
				<label for="firstName">First Name: </label><input type="text"
					name="firstName" /><br> <label for="lastName">Last
					Name: </label><input type="text" name="firstName" /> <br>
				<c:if test="${empty member.birthDate }">
					<label for="birthDate">Birth Date: </label>
					<input type="text" name="birthDate" value="yyyy-mm-dd" />
				</c:if>
				<label for="lifeStatus">Death date (select living if true)</label> <select
					name="deathDate">
					<input type="text" value="yyyy-mm-dd" />
					<input type="hidden" name="alive" value="false" />
				</select> <select name="deathDate" value="null"> Still Living
					<input type="hidden" name="alive" value="true" />
				</select>
				<h5>Gender:</h5>
				<br> <label for="male">Male</label><input type="radio"
					name="gender" value="male" /> <br> <label for="female">Female</label><input
					type="radio" name="gender" value="female" /> <br> <label
					for="other/unknown">Other/Unknown</label><input type="radio"
					name="gender" value="other/unknown" /> <br> <input
					type="hidden" name="memberToEdit" value="${member }" /> <input
					type="hidden" name="imagePath" value="${member.imagePath }" /> <input
					type="hidden" name="married" value="${member.married }" /> <input
					type="hidden" name="motherId" value="${member.motherId }" /> <input
					type="hidden" name="fatherId" value="${member.fatherId }" /> <input
					type="hidden" name="spouseId" value="${member.spouseId }" /> <input
					type="hidden" name="married" value="${member.married }" />
			</form>
		</c:when>
		<c:when test="${editingPhoto == true }">
			<form action="editMember.do" method="post">


				<input type="hidden" name="memberToEdit" value="${member }" /> <input
					type="hidden" name="married" value="${member.married }" /> <input
					type="hidden" name="motherId" value="${member.motherId }" /> <input
					type="hidden" name="fatherId" value="${member.fatherId }" /> <input
					type="hidden" name="spouseId" value="${member.spouseId }" /> <input
					type="hidden" name="married" value="${member.married }" /> <input
					type="hidden" name="firstName" value="${member.firstName }" /> <input
					type="hidden" name="lastName" value="${member.lastName }" /> <input
					type="hidden" name="gender" value="${member.gender }" /> <input
					type="hidden" name="birthDate" value="${member.birthDate }" /> <input
					type="hidden" name="deathDate" value="${member.deathDate }" /> <input
					type="hidden" name="alive" value="${member.alive }" />
			</form>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>


</body>
</html>