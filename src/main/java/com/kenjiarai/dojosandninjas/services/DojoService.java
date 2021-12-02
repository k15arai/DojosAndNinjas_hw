package com.kenjiarai.dojosandninjas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kenjiarai.dojosandninjas.models.Dojo;
import com.kenjiarai.dojosandninjas.repositories.DojoRepository;

@Service
public class DojoService {
	
	@Autowired
	private DojoRepository dojoRepository;
	
	// Create
	public Dojo create(Dojo item) {
		return this.dojoRepository.save(item);
	}
	
	// Read All
	public List<Dojo> all() {
		return this.dojoRepository.findAll();
	}
	
	// Read One
	public Dojo retrieve(Long id) {
		return this.dojoRepository.findById(id).get();
	}
	
	// Update
	public Dojo update(Dojo item) {
		return this.dojoRepository.save(item);
	}
	
	// Delete
	public void delete(Long id) {
		this.dojoRepository.deleteById(id);
	}
	
}
