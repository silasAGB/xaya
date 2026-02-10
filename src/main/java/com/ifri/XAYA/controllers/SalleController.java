package com.ifri.XAYA.controllers;

import com.ifri.XAYA.models.Salle;
import com.ifri.XAYA.services.SalleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/salles")
public class SalleController {
    
    @Autowired
    private SalleService salleService;
    
    @GetMapping
    public String listSalles() {
        return "redirect:/"; 
    }
    
    @GetMapping("/nouveau")
    public String showCreateForm(Model model) {
        model.addAttribute("salle", new Salle());
        return "salles/form"; // Vérifie que ton fichier est bien dans /WEB-INF/jsp/salles/form.jsp
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // Transforme les chaînes vides envoyées par le formulaire en NULL
        binder.registerCustomEditor(String.class, new org.springframework.beans.propertyeditors.StringTrimmerEditor(true));
    }
    
    @PostMapping("/save")
    public String saveSalle(@ModelAttribute("salle") Salle salle) {
        // Le 400 vient souvent d'ici : si un champ est nul ou mal formaté
        salleService.saveSalle(salle);
        // Redirection vers la page d'accueil (index)
        return "redirect:/"; 
    }
    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Salle salle = salleService.getSalleById(id)
            .orElseThrow(() -> new IllegalArgumentException("Salle invalide: " + id));
        model.addAttribute("salle", salle);
        return "salles/form";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteSalle(@PathVariable Long id) {
        salleService.deleteSalle(id);
        return "redirect:/salles";
    }
}