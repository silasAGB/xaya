package com.ifri.XAYA.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ifri.XAYA.models.Role;
import com.ifri.XAYA.models.Utilisateur;

@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Long> {

	Utilisateur save(Utilisateur utilisateur);

	boolean existsByEmail(String email);

    long countByRole(Role role);
    
    Utilisateur findByEmail(String email);
}