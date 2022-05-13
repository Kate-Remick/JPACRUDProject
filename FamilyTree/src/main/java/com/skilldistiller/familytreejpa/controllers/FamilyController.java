package com.skilldistiller.familytreejpa.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistiller.familytreejpa.data.FamilyDAO;

@Controller
public class FamilyController {
	@Autowired
	private FamilyDAO dao;
	
	@RequestMapping(path = {",", "index.do"}, method = RequestMethod.GET )
	public String index() {
		return "index";
	}
	
	@RequestMapping(path = "getMember.do", params = "id", method= RequestMethod.GET)
	public ModelAndView findById(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", dao.findById(id));
		mv.setViewName("memberView");
		return mv;
	}
}
