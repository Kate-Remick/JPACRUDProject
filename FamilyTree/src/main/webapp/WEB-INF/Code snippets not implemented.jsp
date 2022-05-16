

*****From View Member
<!--<div name="image">
		<h1>Include image here</h1>
		<c:if test="${editing == true }">
			<form action="editMember.do" method="get">
				<input type="hidden" name="memberId" value="${member.id }">
				<input type="hidden" name="editingPhoto" value="${true}"> <input
					type="hidden" name="editingDetails" value="${false}"> <input
					type="hidden" name="editingRelationships" value="${false}">
				<button type="submit">
					Change Photo
					</buttion>
			</form>
		</c:if>
	</div>  -->
	
	
******* From Add Member

<!-- <div name="image">
			<h5>Select image to upload: </h5>
			<input type="file" name="memberPhoto" />
			</div> -->
********From Edit Member

<!--<c:when test="${editingPhoto == true }">
			<form action="editMember.do" method="post">
				<div name="image">
					<h5>Select image to upload:</h5>
					<input type="file" name="memberPhoto" accept="image/*" />
					<button type="submit">Submit</button>
				</div>

				<input type="hidden" name="memberToEditId" value="${member.id }" />
				<input type="hidden" name="married" value="${member.married }" /> <input
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
				<button type="submit">Submit Changes</button>
			</form>
		</c:when>-->