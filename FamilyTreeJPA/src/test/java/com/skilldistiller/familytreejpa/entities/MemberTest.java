package com.skilldistiller.familytreejpa.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class MemberTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Member member;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	emf = Persistence.createEntityManagerFactory("FamilyTreeJPA");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
	em = emf.createEntityManager();
	member = em.find(Member.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
	em.close();
	member = null;
	}

	@Test
	@DisplayName("Member fields test")
	void test1() {
		assertNotNull(member);
		assertEquals("Melinda", member.getFirstName());
	}

}
