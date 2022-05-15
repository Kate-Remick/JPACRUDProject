package com.skilldistiller.familytreejpa.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistiller.familytreejpa.data.FamilyDAO;
import com.skilldistiller.familytreejpa.entities.Member;

@Controller
public class FamilyController {
	@Autowired
	private FamilyDAO dao;
	
	@RequestMapping(path = {"/", "index.do"}, method = RequestMethod.GET )
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("allMembers", dao.getAllFamily());
		
		return mv;
	}
	
	@RequestMapping(path = "getMember.do", params = "id", method= RequestMethod.GET)
	public ModelAndView findById(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Member member = dao.findById(id);
		mv.addObject("member", member);
		System.out.println("accessing direct family");
		if(member.getMotherId() != null) {
			mv.addObject("mother", dao.getParent(member.getMotherId()));
		}
		if(member.getFatherId() != null) {
			mv.addObject("father", dao.getParent(member.getFatherId()));
		}
			mv.addObject("siblings", dao.getSiblings(id));
		if(member.isMarried()) {
			if(member.getSpouseId() != null) {
				mv.addObject("spouse", dao.getSpouse(id));
			}
		}
		mv.setViewName("memberView");
		return mv;
	}
	@RequestMapping(path = "getMember.do", params = {"fistName", "lastName"}, method= RequestMethod.GET)
	public ModelAndView findByName(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("members", dao.findByName(firstName, lastName));
		mv.addObject("searchingMember", true);
		mv.setViewName("listMembers");
		return mv;
	}
	
	@RequestMapping(path="getMember.do", method = RequestMethod.GET)
	public ModelAndView viewAll() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("members", dao.getAllFamily());
		mv.setViewName("listMembers");
		return mv;
		
	}
	@RequestMapping(path="addMember.do", method=RequestMethod.GET)
	public ModelAndView addMember() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addMember");
		mv.addObject("allMembers", dao.getAllFamily());
		mv.addObject("women", dao.allGender("female"));
		mv.addObject("men", dao.allGender("men"));
		
		return mv;
	}
	@RequestMapping(path="addMember.do", method=RequestMethod.POST)
	public ModelAndView addingMember(Member memberToAdd, RedirectAttributes redir ) {
		ModelAndView mv = new ModelAndView();
		boolean success = dao.addMember(memberToAdd);
		redir.addFlashAttribute("addSuccessful", success);
		redir.addFlashAttribute("member", memberToAdd);
		mv.setViewName("redir:memberAdded.do");
		if(success = false) {
			mv.setViewName("redir:memberNotAdded");
		}
		return mv;
	}
	@RequestMapping(path="memberAdded.do")
	public ModelAndView addedMember() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("addedMember", true);
		mv.setViewName("memberView");
		return mv;
	}
	@RequestMapping(path="memberNotAdded.do")
	public ModelAndView addedMemberFailed() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("addedMember", true);
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(path="editMember.do", method=RequestMethod.GET)
	public ModelAndView editMemberView(@RequestParam("memberToEdit") Member member) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("memberview");
		mv.addObject("editing", true);
		mv.addObject("memberToEdit", member);
		mv.addObject("member", member);
		return mv;
	}
	@RequestMapping(path="editMember.do", params="member", method=RequestMethod.GET)
	public ModelAndView editMember(@RequestParam("member") Member member, @RequestParam("editingDetails") boolean d ,@RequestParam("editingRelationships") boolean r,@RequestParam("editingPhoto") boolean p) {
		ModelAndView mv = new ModelAndView();
		if(d) {
			mv.addObject("editingDetails", d);
		}if(r) {
			mv.addObject("editingRelationships", r);
			mv.addObject("men", dao.allGender("male"));
			mv.addObject("women", dao.allGender("female"));
			mv.addObject("allMembers", dao.getAllFamily());
		}if(p) {
			mv.addObject("editingPhoto", p);
		}
		mv.setViewName("editMember");
		mv.addObject("editing", true);
		mv.addObject("member", member);
		return mv;
	}
	@RequestMapping(path="editMember.do", method=RequestMethod.POST)
	public ModelAndView editingMember(Member memberEdits, @RequestParam("member") Member memberToEdit, RedirectAttributes redir ) {
		ModelAndView mv = new ModelAndView();
		memberToEdit = dao.editMember(memberToEdit, memberEdits);
		redir.addFlashAttribute("memberToEdit", memberToEdit);
		mv.setViewName("redir:memberEdited.do");
		return mv;
	}
	@RequestMapping(path="memberEdited.do")
	public ModelAndView editedMember() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("editedMember", true);
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(path="delete.do", method = RequestMethod.GET)
	public String removeMember() {
		return "removeMember";
	}
	@RequestMapping(path="delete.do", method=RequestMethod.POST)
	public ModelAndView removedMember(@RequestParam("deleteId") int deleteId) {
		boolean deletionSuccess = dao.removeMember(deleteId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("deletionSuccess", deletionSuccess);
		mv.addObject("deleting", true);
		mv.setViewName("index");
		return mv;
	}
}
