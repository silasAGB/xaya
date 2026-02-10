package com.ifri.XAYA.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

import com.ifri.XAYA.services.SalleService;

@Controller  // ← Annotation qui indique que c'est un contrôleur Spring MVC
public class HomeController {
	
	// AJOUTE CES DEUX LIGNES ICI (C'est l'injection)
    @Autowired
    private SalleService salleService;
    
    @GetMapping("/")  // ← Gère les requêtes GET vers la racine "/"
    public String afficherAccueil(Model model) {
        // On récupère les données via le service
        model.addAttribute("salles", salleService.getAllSalles());
        return "index"; // Renvoie vers src/main/webapp/WEB-INF/jsp/index.jsp
    }
}