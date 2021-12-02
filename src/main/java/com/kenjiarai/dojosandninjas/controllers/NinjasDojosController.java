package com.kenjiarai.dojosandninjas.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kenjiarai.dojosandninjas.models.Dojo;
import com.kenjiarai.dojosandninjas.models.Ninja;
import com.kenjiarai.dojosandninjas.services.DojoService;
import com.kenjiarai.dojosandninjas.services.NinjaService;

@Controller
public class NinjasDojosController {

	@Autowired
	private DojoService dojoService;
	
	@Autowired
	private NinjaService ninjaService;
	
	// Create
	@PostMapping("/dojos/new")
	public String addDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if (result.hasErrors()) return "/dojos/dojos_form.jsp";
		
		this.dojoService.create(dojo);
		return "redirect:/dojos/new";
	}
	
	@PostMapping("ninjas/new")
	public String addNinja(@Valid @ModelAttribute("ninja") Ninja ninja, 
			BindingResult result,
			@RequestParam(value="dojo") Long id,
			RedirectAttributes redirectAttributes
			) {
		
		if (result.hasErrors()) return "/ninjas/ninjas_form.jsp";
		
		Dojo dojo1 = dojoService.retrieve(id);
		dojo1.addNinjaToDojo(ninja);
		this.ninjaService.create(ninja);

		
//		Dojo enrollingDojo = this.dojoService.retrieve(id);
//		this.dojoService.create(new Dojo(ninja, enrollingDojo.getLocation()));
		
		return "redirect:/dojos/new";
	}
	
	// Read ALL for Dojo
	@GetMapping("/dojos/{id}")
	public String readAllNinjasForDojo(@PathVariable Long id, Model model) {
		model.addAttribute("ninjas", this.dojoService.retrieve(id).getNinjas());
		return "/dojos/dojos_results.jsp";
	}
	
	// Read One
	
	// Update 
	
	// Delete
	@GetMapping("/ninja/{id}")
	public String deleteNinja(
			@PathVariable Long id,
			RedirectAttributes redirectAttributes
			) {
		this.ninjaService.delete(id);
		
		redirectAttributes.addFlashAttribute("message", "Your Ninja has been deleted");
		
		return "redirect:/ninjas/new";
	}
	
	// Delete
	@GetMapping("/dojo/{id}")
	public String deleteDojo(
			@PathVariable Long id,
			RedirectAttributes redirectAttributes
			) {
		this.dojoService.delete(id);
		
		redirectAttributes.addFlashAttribute("message", "Your Ninja has been deleted");
		
		return "redirect:/dojos/new";
	}
	
	// Dojos Home
	@GetMapping("/dojos/new")
	public String dojosHome(@ModelAttribute("dojo") Dojo dojo, Model model) {
		model.addAttribute("dojos", this.dojoService.all());
		return "/dojos/dojos_form.jsp";
	}
	
	// Ninjas Home
	@GetMapping("/ninjas/new")
	public String ninjasHome(@ModelAttribute("ninja") Ninja ninja, Model model) {
		model.addAttribute("dojos", this.dojoService.all());
		return "/ninjas/ninjas_form.jsp";
	}
	
}
