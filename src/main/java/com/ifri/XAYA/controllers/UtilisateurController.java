package com.ifri.XAYA.controllers;

import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.services.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/utilisateurs")
public class UtilisateurController {
    
    @Autowired
    private UtilisateurService utilisateurService;
    
    @GetMapping("/list") // Ajoute explicitement /list ici
    public String listUtilisateurs(Model model) {
        model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
        return "utilisateurs/list"; 
    }
    
    @GetMapping("/nouveau")
    public String showCreateForm(Model model) {
        model.addAttribute("utilisateur", new Utilisateur());
        return "utilisateurs/form";
    }
    
    @PostMapping("/save")
    public String saveUtilisateur(@ModelAttribute("utilisateurs") Utilisateur utilisateur) {
        utilisateurService.saveUtilisateur(utilisateur);
        return "redirect:/utilisateurs/list";
    }
    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Utilisateur utilisateur = utilisateurService.getUtilisateurById(id)
            .orElseThrow(() -> new IllegalArgumentException("Utilisateur invalide: " + id));
        model.addAttribute("utilisateur", utilisateur);
        return "utilisateurs/form";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteUtilisateur(@PathVariable Long id) {
        utilisateurService.deleteUtilisateur(id);
        return "redirect:/utilisateurs";
    }
}