package com.skilldistiller.familytreejpa.entities;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String gender;
	
	@Column(name="birth_date")
	private String birthDate;
	
	@Column(name="death_date")
	private String deathDate;
	
	private boolean married;
	
	private boolean alive;
	
	@Column(name="mother_id")
	private Integer motherId;
	@Column(name="father_id")
	
	private Integer fatherId;
	
	@Column(name="spouse_id")
	private Integer spouseId;
	
	@Column(name="image_path")
	private String imagePath;
	
	public Member() {}

	

	@Override
	public String toString() {
		return firstName + " " + lastName ;
	}

	// ******************************* Custom Setters **********************
	public void setMotherId(String motherId) {
		this.motherId = Integer.valueOf(motherId);
	}
	public void setFatherId(String fatherId) {
		this.fatherId = Integer.valueOf(fatherId);
	}
	
	
	public void setSpouseId(String spouseId) {
		this.spouseId = Integer.valueOf(spouseId);
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	
	public void setDeathDate(String deathDate) {
		if(deathDate.length() == 0) {
			deathDate = null;
		}
		this.deathDate = deathDate;
	}
	// ***********************************************************************



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getBirthDate() {
		return birthDate;
	}



//	public void setBirthDate(String birthDate) {
//		this.birthDate = birthDate;
//	}



	public String getDeathDate() {
		return deathDate;
	}



//	public void setDeathDate(String deathDate) {
//		this.deathDate = deathDate;
//	}



	public boolean isMarried() {
		return married;
	}



	public void setMarried(boolean married) {
		this.married = married;
	}



	public boolean isAlive() {
		return alive;
	}



	public void setAlive(boolean alive) {
		this.alive = alive;
	}



	public Integer getMotherId() {
		return motherId;
	}



	public void setMotherId(Integer motherId) {
		this.motherId = motherId;
	}



	public Integer getFatherId() {
		return fatherId;
	}



	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}



	public Integer getSpouseId() {
		return spouseId;
	}



	public void setSpouseId(Integer spouseId) {
		this.spouseId = spouseId;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	
	
}
