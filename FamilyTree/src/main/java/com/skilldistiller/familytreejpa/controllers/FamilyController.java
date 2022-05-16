package com.skilldistiller.familytreejpa.controllers;

import java.io.IOException;

import org.apache.tomcat.jni.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistiller.familytreejpa.data.FamilyDAO;
import com.skilldistiller.familytreejpa.entities.Member;

@Controller
public class FamilyController {
	@Autowired
	private FamilyDAO dao;

	@RequestMapping(path = { "/", "index.do" }, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("allMembers", dao.getAllFamily());

		return mv;
	}

	@RequestMapping(path = "getMember.do", params = "id", method = RequestMethod.GET)
	public ModelAndView findById(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Member member = dao.findById(id);
		mv.addObject("member", member);
		System.out.println("accessing direct family");
		if (member.getMotherId() != null) {
			mv.addObject("mother", dao.getParent(member.getMotherId()));
		}
		if (member.getFatherId() != null) {
			mv.addObject("father", dao.getParent(member.getFatherId()));
		}
		mv.addObject("siblings", dao.getSiblings(id));
		if (member.isMarried()) {
			if (member.getSpouseId() != null) {
				mv.addObject("spouse", dao.getSpouse(member.getSpouseId()));
			}
		}
		mv.setViewName("memberView");
		return mv;
	}

	@RequestMapping(path = "getMember.do", params = { "fistName", "lastName" }, method = RequestMethod.GET)
	public ModelAndView findByName(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("members", dao.findByName(firstName, lastName));
		mv.addObject("searchingMember", true);
		mv.setViewName("listMembers");
		return mv;
	}

	@RequestMapping(path = "getMember.do", method = RequestMethod.GET)
	public ModelAndView viewAll() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("members", dao.getAllFamily());
		mv.setViewName("listMembers");
		return mv;

	}

	@RequestMapping(path = "addMember.do", method = RequestMethod.GET)
	public ModelAndView addMember() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("allMembers", dao.getAllFamily());
		mv.addObject("women", dao.allGender("female"));
		mv.addObject("men", dao.allGender("male"));

		mv.setViewName("addMember");
		return mv;
	}

	@RequestMapping(path = "addMember.do", method = RequestMethod.POST)
	public ModelAndView addingMember(Member memberToAdd,
			RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		System.out.println(memberToAdd);
		if (memberToAdd.getSpouseId() != null) {
			memberToAdd.setMarried(true);
		} else {
			memberToAdd.setMarried(false);
		}
		if (memberToAdd.getDeathDate() == null) {
			memberToAdd.setAlive(true);
		} else {
			memberToAdd.setAlive(false);
		}
		boolean success = dao.addMember(memberToAdd);
		redir.addFlashAttribute("addSuccessful", success);
		redir.addFlashAttribute("member", memberToAdd);
		
		if (memberToAdd.getMotherId() != null) {
			redir.addFlashAttribute("mother", dao.getParent(memberToAdd.getMotherId()));
		}
		if (memberToAdd.getFatherId() != null) {
			redir.addFlashAttribute("father", dao.getParent(memberToAdd.getFatherId()));
		}
		redir.addFlashAttribute("siblings", dao.getSiblings(memberToAdd.getId()));
		if (memberToAdd.isMarried()) {
			if (memberToAdd.getSpouseId() != null) {
				redir.addFlashAttribute("spouse", dao.getSpouse(memberToAdd.getSpouseId()));
			}
		}
		
		
		mv.setViewName("redirect:memberAdded.do");
		if (success = false) {
			mv.setViewName("redirect:memberNotAdded.do");
		}
		return mv;
	}

	@RequestMapping(path = "memberAdded.do")
	public ModelAndView addedMember() {
		ModelAndView mv = new ModelAndView();

		mv.addObject("addedMember", true);
		mv.setViewName("memberView");
		return mv;
	}

	@RequestMapping(path = "memberNotAdded.do")
	public ModelAndView addedMemberFailed() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("addedMember", true);
		mv.addObject("allMembers", dao.getAllFamily());
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "editMember.do", method = RequestMethod.GET)
	public ModelAndView editMemberView(@RequestParam("memberToEdit") int memberToEditId) {
		ModelAndView mv = new ModelAndView();
		Member member = dao.findById(memberToEditId);
		mv.setViewName("memberView");
		mv.addObject("editing", true);
		mv.addObject("memberToEdit", member);
		mv.addObject("member", member);
		return mv;
	}

	@RequestMapping(path = "editMember.do", params = "memberId", method = RequestMethod.GET)
	public ModelAndView editMember(@RequestParam("memberId") int memberId, @RequestParam("editingDetails") boolean d,
			@RequestParam("editingRelationships") boolean r ) {
		ModelAndView mv = new ModelAndView();
		Member member = dao.findById(memberId);
		if (d) {
			mv.addObject("editingDetails", d);
		}
		if (r) {
			mv.addObject("editingRelationships", r);
			mv.addObject("men", dao.allGender("male"));
			mv.addObject("women", dao.allGender("female"));
			mv.addObject("allMembers", dao.getAllFamily());
		}
//		if (p) {@RequestParam("editingPhoto") boolean p
//			mv.addObject("editingPhoto", p);
//		}
		mv.setViewName("editMember");
		mv.addObject("editing", true);
		mv.addObject("member", member);
		return mv;
	}

	@RequestMapping(path = "editMember.do", method = RequestMethod.POST)
	public ModelAndView editingMember(Member memberEdits,
			@RequestParam("memberToEditId") int memberToEditId, RedirectAttributes redir) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		Member memberToEdit = dao.findById(memberToEditId);
		memberToEdit = dao.editMember(memberToEdit, memberEdits);
		redir.addFlashAttribute("memberEdited", memberToEdit);
		mv.setViewName("redirect:memberEdited.do");
		return mv;
	}

	@RequestMapping(path = "memberEdited.do")
	public ModelAndView editedMember() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("allMembers", dao.getAllFamily());
		mv.addObject("editedMember", true);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "delete.do", method = RequestMethod.GET)
	public ModelAndView removeMember() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("allMembers", dao.getAllFamily());
		mv.setViewName("removeMember");
		return mv;
	}

	@RequestMapping(path = "delete.do", method = RequestMethod.POST)
	public ModelAndView removedMember(@RequestParam("deleteId") int deleteId) {
		Integer spouseId = dao.findById(deleteId).getSpouseId();
		boolean deletionSuccess = dao.removeMember(deleteId);
		try {
			dao.clearChildRecords(deleteId, spouseId);
		} catch (UnexpectedRollbackException e) {
			System.out.println("rollback while cleaning child records");
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("allMembers", dao.getAllFamily());
		mv.addObject("deletionSuccess", deletionSuccess);
		mv.addObject("deleting", true);
		mv.setViewName("index");
		return mv;
	}
}
