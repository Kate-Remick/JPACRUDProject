package com.skilldistiller.familytreejpa.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.UnexpectedRollbackException;

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

	@Override
	public List<Member> getAllFamily() {
		String sql = "SELECT mem FROM Member mem";
		List<Member> members = em.createQuery(sql, Member.class).getResultList();
		return members;
	}

	@Override
	public List<Member> allGender(String gender) {
		String sql = "SELECT mem FROM Member mem WHERE mem.gender = :gender OR mem.gender = 'other/unknown'";
		List<Member> members = em.createQuery(sql, Member.class).setParameter("gender", gender).getResultList();
		return members;
	}

	public List<Member> getSiblings(int id) {
		String siblingSql1 = "SELECT mem FROM Member mem WHERE (mem.motherId=:motherId OR mem.fatherId=:fatherId) AND mem.id !=:id ";
		Member member = em.find(Member.class, id);
		List<Member> siblings = em.createQuery(siblingSql1, Member.class).setParameter("motherId", member.getMotherId())
				.setParameter("id", id).setParameter("fatherId", member.getFatherId()).getResultList();
		return siblings;
	}

	public Member getParent(int parentId) {
		Member parent = em.find(Member.class, parentId);
		return parent;
	}

	public Member getSpouse(int spouseId) {
		Member spouse = em.find(Member.class, spouseId);
		return spouse;
	}

	@Override
	public List<Member> findByName(String firstName, String lastName) {
		String sql = "SELECT mem FROM Member mem WHERE mem.firstName LIKE :firstName OR mem.lastName LIKE :lastName";
		List<Member> matchingMembers = em.createQuery(sql, Member.class)
				.setParameter("firstName", "%" + firstName + "%").setParameter("lastName", "%" + lastName + "%")
				.getResultList();
		return matchingMembers;
	}

	@Override
	public boolean removeMember(int id) {
		Member member = em.find(Member.class, id);
		Integer spouseId = member.getSpouseId();
		boolean success = false;
		if (member != null) {
			System.out.println("deleting member");
			em.remove(member);
		}
		System.out.println("checking member record");
		success = !em.contains(member);
		System.out.println(success);
//		clearChildRecords(id, spouseId);
		System.out.println("returning to controller");
		return success;
	}

	@Override
	public void clearChildRecords(int id, Integer spouseId) {
		try {
			String sql = "SELECT fam FROM Member fam WHERE fam.motherId = :mom OR fam.fatherId =:dad";
			System.out.println("cleaning child records");
			List<Member> children = em.createQuery(sql, Member.class).setParameter("dad", id).setParameter("mom", id)
					.getResultList();
			for (Member child : children) {
				if (child.getMotherId() == id) {
					child.setMotherId("");
				}
				if (child.getFatherId() == id) {
					child.setFatherId("");
				}
			}
		} catch (IllegalArgumentException e) {
		} 
		try {
			Member spouse = em.find(Member.class, spouseId);
			if (spouse != null) {
				spouse.setSpouseId("");
			}
		} catch (IllegalArgumentException e) {
		} 
		System.out.println("Child records clean");
		return;

	}

	@Override
	public boolean addMember(Member member) {
		boolean success = false;
		em.persist(member);
		success = em.contains(member);
		return success;
	}

	@Override
	public Member editMember(Member member, Member updatedMember) {
		member.setFirstName(updatedMember.getFirstName());
		member.setLastName(updatedMember.getLastName());
		member.setGender(updatedMember.getGender());
		if (updatedMember.getBirthDate() != null) {
			member.setBirthDate(updatedMember.getBirthDate());
		}
		if (!updatedMember.isAlive()) {
			member.setAlive(false);
			member.setDeathDate(updatedMember.getBirthDate());
		}
		member.setMarried(updatedMember.isMarried());
		if (member.isMarried()) {
			member.setSpouseId(updatedMember.getSpouseId());
		}
		member.setFatherId(updatedMember.getFatherId());
		member.setMotherId(updatedMember.getMotherId());
		member.setImagePath(updatedMember.getImagePath());
		return member;
	}

//	@Override
//	public Map<String, List<Member>> getDirectFamily(int id) {
//		String motherSql = "SELECT mother FROM Member mem JOIN Member mother WHERE mem.motherId = mother.id AND mem.id = :id";
//		String fatherSql = "SELECT father FROM Member AS mem JOIN Member AS father WHERE mem.fatherId = father.id AND mem.id = :id";
//		String spouseSql = "SELECT spouse FROM Member AS mem JOIN Member AS spouse WHERE mem.spouseId = spouse.id AND mem.id = :id";
//		String siblingSql = "SELECT sibling FROM Member AS mem JOIN Member AS sibling WHERE (mem.fatherId = sibling.fatherId OR mem.motherId =sibling.motherId) AND mem.id = :id";
//		Map<String, List<Member>> directFamily = new HashMap<>();
//		List<Member> mother = em.createQuery(motherSql, Member.class).setParameter("id", id).getResultList();
//		System.out.println("Query Works");
//		List<Member> father = em.createQuery(fatherSql, Member.class).setParameter("id", id).getResultList();
//		System.out.println("Query Works");
//		List<Member> sibling = em.createQuery(siblingSql, Member.class).setParameter("id", id).getResultList();
//		System.out.println("Query Works");
//		List<Member> spouse = em.createQuery(spouseSql, Member.class).setParameter("id", id).getResultList();
//		System.out.println("Query Works");
//		directFamily.put("mother", mother);
//		directFamily.put("father", father);
//		directFamily.put("sibling", sibling);
//		directFamily.put("spouse", spouse);
//		directFamily.put("father", em.createQuery(fatherSql, Member.class).setParameter("id", id).getResultList());
//		directFamily.put("mother", em.createQuery(motherSql, Member.class).setParameter("id", id).getResultList());
//		directFamily.put("siblings", em.createQuery(siblingSql, Member.class).setParameter("id", id).getResultList());
//		directFamily.put("spouse", em.createQuery(spouseSql, Member.class).setParameter("id", id).getResultList());
//		return directFamily;
//	}
}
