package com.ifri.XAYA.services;

import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.repositories.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

/**
 * Service personnalisé pour charger les utilisateurs depuis la base de données
 * Utilisé par Spring Security pour l'authentification
 */
@Service
public class CustomUserDetailsService implements UserDetailsService {
    
    @Autowired
    private UtilisateurRepository utilisateurRepository;
    
    /**
     * Charge un utilisateur par son email pour l'authentification
     * 
     * @param email L'adresse email de l'utilisateur
     * @return UserDetails contenant les informations de l'utilisateur
     * @throws UsernameNotFoundException si l'utilisateur n'existe pas
     */
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        

        Utilisateur utilisateur = utilisateurRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException(
                        "Utilisateur introuvable avec l'email : " + email));
        
        // Construit l'objet UserDetails pour Spring Security
        return User.builder()
                .username(utilisateur.getEmail())
                .password(utilisateur.getMotDePasse())
                .roles(utilisateur.getRole().name()) 
                .disabled(!utilisateur.isEnabled())  
                .build();
    }
}