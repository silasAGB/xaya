package com.ifri.XAYA.services;

import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.repositories.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Override
    public UserDetails loadUserByUsername(String email)
            throws UsernameNotFoundException {

        Utilisateur u = utilisateurRepository.findByEmail(email)
                .orElseThrow(() ->
                        new UsernameNotFoundException("Utilisateur introuvable"));

        return User.builder()
                .username(u.getEmail())
                .password(u.getMotDePasse())
                .roles(u.getRole().name()) // ADMIN ou CLIENT
                .disabled(!u.isEnabled())
                .build();
    }
}
