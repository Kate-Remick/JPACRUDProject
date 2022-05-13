package com.skilldistiller.familytreejpa.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistiller.familytreejpa.entities.Member;

@Service
@Transactional
public class FamilyDAOImpl implements FamilyDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Member findById(int id) {
		Member member = em.find(Member.class, id);
		
		return member;
	}

}
