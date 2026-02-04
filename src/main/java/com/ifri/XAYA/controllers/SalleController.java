package com.ifri.XAYA.controllers;

import com.ifri.XAYA.models.Salle;
import com.ifri.XAYA.services.SalleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/salles")
public class SalleController {
    
    @Autowired
    private SalleService salleService;
    
    @GetMapping
    public String listSalles(Model model) {
        model.addAttribute("salles", salleService.getAllSalles());
        return "salle/list";
    }
    
    @GetMapping("/nouveau")
    public String showCreateForm(Model model) {
        model.addAttribute("salle", new Salle());
        return "salle/form";
    }
    
    @PostMapping("/save")
    public String saveSalle(@ModelAttribute("salle") Salle salle) {
        salleService.saveSalle(salle);
        return "redirect:/salles";
    }
    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Salle salle = salleService.getSalleById(id)
            .orElseThrow(() -> new IllegalArgumentException("Salle invalide: " + id));
        model.addAttribute("salle", salle);
        return "salle/form";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteSalle(@PathVariable Long id) {
        salleService.deleteSalle(id);
        return "redirect:/salles";
    }
}