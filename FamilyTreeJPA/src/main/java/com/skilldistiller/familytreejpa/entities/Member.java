package com.skilldistiller.familytreejpa.entities;

import java.time.LocalDate;

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
	private LocalDate birthDate;
	
	@Column(name="death_date")
	private LocalDate deathDate;
	
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

	public Member(int id, String firstName, String lastName, String gender, LocalDate birthDate, LocalDate deathDate,
			boolean married, boolean alive, Integer motherId, Integer fatherId, Integer spouseId, String imagePath) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.birthDate = birthDate;
		this.deathDate = deathDate;
		this.married = married;
		this.alive = alive;
		this.motherId = motherId;
		this.fatherId = fatherId;
		this.spouseId = spouseId;
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return firstName + " " + lastName ;
	}

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

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public LocalDate getDeathDate() {
		return deathDate;
	}

	public void setDeathDate(LocalDate deathDate) {
		this.deathDate = deathDate;
	}

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
