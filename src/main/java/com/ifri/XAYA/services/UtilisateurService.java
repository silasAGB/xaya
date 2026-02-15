package com.ifri.XAYA.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.crypto.password.PasswordEncoder;
import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.repositories.UtilisateurRepository;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UtilisateurService {
    
    @Autowired
    private UtilisateurRepository utilisateurRepo;
    
    @Autowired
    private PasswordEncoder passwordEncoder; 
    
    public List<Utilisateur> getAllUtilisateurs() {
        return utilisateurRepo.findAll();
    }
    
    public Optional<Utilisateur> getUtilisateurById(Long id) {
        return utilisateurRepo.findById(id);
    }
    
    /**
     * Vérifie si un email existe déjà dans la base de données
     */
    public boolean emailExists(String email) {
        return utilisateurRepo.existsByEmail(email);
    }
    

    public Utilisateur saveUtilisateur(Utilisateur utilisateur) {
        

        if (utilisateur.getId() == null) {
            utilisateur.setMotDePasse(
                passwordEncoder.encode(utilisateur.getMotDePasse())
            );
        }
        // Modification d'un utilisateur existant
        else {
            Utilisateur existingUser = utilisateurRepo
                .findById(utilisateur.getId())
                .orElseThrow();
            
          
            if (utilisateur.getMotDePasse() != null &&
                !utilisateur.getMotDePasse().isBlank()) {
                utilisateur.setMotDePasse(
                    passwordEncoder.encode(utilisateur.getMotDePasse())
                );
            }
            // Sinon on garde l'ancien
            else {
                utilisateur.setMotDePasse(existingUser.getMotDePasse());
            }
        }
        
        return utilisateurRepo.save(utilisateur);
    }
    
    public void deleteUtilisateur(Long id) {
        utilisateurRepo.deleteById(id);
    }
    
    public Optional<Utilisateur> findByEmail(String email) {
        return utilisateurRepo.findByEmail(email);
    }
}