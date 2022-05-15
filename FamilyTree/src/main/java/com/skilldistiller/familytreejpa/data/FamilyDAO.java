package com.skilldistiller.familytreejpa.data;

import java.util.List;
import java.util.Map;

import com.skilldistiller.familytreejpa.entities.Member;


public interface FamilyDAO {

public Member findById(int id);

public List<Member> findByName(String firstName, String lastName);

public List<Member> getAllFamily();

public List<Member> allGender(String gender); 


public boolean removeMember(int id);

public boolean addMember(Member member);

public Member editMember(Member member, Member updatedMember);

public List<Member> getSiblings(int id);

public Member getParent(int parentId);

public Member getSpouse(int id);

//public Map<String, List<Member>> getDirectFamily(int id);

}
