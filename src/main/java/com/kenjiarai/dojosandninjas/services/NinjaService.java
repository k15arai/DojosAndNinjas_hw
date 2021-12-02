package com.kenjiarai.dojosandninjas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kenjiarai.dojosandninjas.models.Ninja;
import com.kenjiarai.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {
	
	@Autowired
	private NinjaRepository ninjaRepository;
	
	//Create
	public Ninja create(Ninja item) {
		return this.ninjaRepository.save(item);
	}
	
	// Read All
	public List<Ninja> all() {
		return this.ninjaRepository.findAll();
	}
	
	// Read One
	public Ninja retrieve(Long id) {
		return this.ninjaRepository.findById(id).get();
	}
	
	// Update
	public Ninja update(Ninja item) {
		return this.ninjaRepository.save(item);
	}
	
	// Delete
	public void delete(Long id) {
		this.ninjaRepository.deleteById(id);
	}

}
