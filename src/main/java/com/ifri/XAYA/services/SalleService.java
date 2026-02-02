package com.ifri.XAYA.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ifri.XAYA.models.Salle;
import com.ifri.XAYA.repositories.SalleRepository;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class SalleService {
    
    @Autowired
    private SalleRepository salleRepository;
    
    public List<Salle> getAllSalles() {
        return salleRepository.findAll();
    }
    
    public Optional<Salle> getSalleById(Long id) {
        return salleRepository.findById(id);
    }
    
    public Salle saveSalle(Salle salle) {
        return salleRepository.save(salle);
    }
    
    public void deleteSalle(Long id) {
        salleRepository.deleteById(id);
    }

}