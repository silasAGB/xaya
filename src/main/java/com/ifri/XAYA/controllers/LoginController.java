package com.ifri.XAYA.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    

    @GetMapping("/connexion")
    public String afficherPageConnexion(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model) {
        
        // Message d'erreur si échec de connexion
        if (error != null) {
            model.addAttribute("error", "Email ou mot de passe incorrect");
        }
        
        // Message de confirmation après déconnexion
        if (logout != null) {
            model.addAttribute("message", "Vous avez été déconnecté avec succès");
        }
        
        return "connexion";
    }
}