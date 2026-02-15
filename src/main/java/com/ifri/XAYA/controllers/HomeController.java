package com.ifri.XAYA.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

import com.ifri.XAYA.services.SalleService;

@Controller  
public class HomeController {
	

    @Autowired
    private SalleService salleService;
    
    @GetMapping("/") 
    public String afficherAccueil(Model model) {

        model.addAttribute("salles", salleService.getAllSalles());
        return "index";
    }
}