package com.ifri.XAYA.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.repositories.UtilisateurRepository;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UtilisateurService {
    
    @Autowired
    private UtilisateurRepository utilisateurRepo;
    
    public List<Utilisateur> getAllUtilisateurs() {
        return utilisateurRepo.findAll();
    }
    
    public Optional<Utilisateur> getUtilisateurById(Long id) {
        return utilisateurRepo.findById(id);
    }
    
    
    public Utilisateur saveUtilisateur(Utilisateur utilisateur) {
        return utilisateurRepo.save(utilisateur);
    }
    
    public void deleteUtilisateur(Long id) {
    	utilisateurRepo.deleteById(id);
    }
}
