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
		<label for="firstName">First Name: </label><input type="text" name="firstName"/><br> 
		<label for="lastName">Last Name: </label><input type="text" name="firstName"/> <br>
		<label for="birthDate">Birth Date: </label><input type="text" name="birthDate" value="yyyy-mm-dd"/>
		<label for="deathDate">Death Date: </label><input type="text" name="deathDate" value="yyyy-mm-dd"/>
		<h5>Status:</h5> <br>
		<label for="alive">Living</label><input type="radio" name="alive" value="true"/> <br>
		<label for="dead">Dead</label><input type="radio" name="alive" value="false"/> <br>
		<h5>Gender:</h5> <br>
		<label for="male">Male</label><input type="radio" name="gender" value="male"/> <br>
		<label for="female">Female</label><input type="radio" name="gender" value="female"/> <br>
		<label for="other/unknown">Other/Unknown</label><input type="radio" name="gender" value="other/unknown"/> <br>
		<h3>Spouse:</h3>
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
		<label for="single">Single</label><input type="radio" name="isMarried" value="false"/> <br>
		<h5>Parents: (Parents must be added to table to be available) </h5>
		<label for="mother">Mother:</label>
		<select name="motherId" value="null" id="mother">unknown or not listed</select>
		<c:forEach var="woman" items="${women}">
		<select name="motherId" value="${woman.id }">${woman }</select>
		</c:forEach>		
		<label for="father">Father:</label>
		<select name="fatherId" value="null" id="mother">unknown or not listed</select>
		<c:forEach var="man" items="${men}">
		<select name="fatherId" value="${man.id }">${man }</select>
		</c:forEach>		
		<h3>Image upload option</h3>
		<input type="file" name="memberPhoto" accept="image/*"/>
		<button type="submit">Submit</button>
		</form>

	</div>

	<%@ include file="bootstrapFooter.jsp"%>
</body>
</html>