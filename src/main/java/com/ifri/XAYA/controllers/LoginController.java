package com.ifri.XAYA.controllers; // Vérifie ton package

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/connexion")
    public String afficherPageConnexion() {
        // Le nom retourné doit correspondre au nom du fichier JSP 
        // situé dans WEB-INF/jsp/ (sans le .jsp)
        return "connexion"; 
    }
}
