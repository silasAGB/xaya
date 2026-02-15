package com.ifri.XAYA.controllers;

import com.ifri.XAYA.models.Salle;
import com.ifri.XAYA.services.SalleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Controller
@RequestMapping("/salles")
public class SalleController {
    
    @Autowired
    private SalleService salleService;
    
    @Value("${upload.path:uploads/salles}")
    private String uploadPath;
    
    
    @GetMapping
    public String listSalles() {
        return "redirect:/"; 
    }
    
    @GetMapping("/nouveau")
    public String showCreateForm(Model model) {
        model.addAttribute("salle", new Salle());
        return "salles/form";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new org.springframework.beans.propertyeditors.StringTrimmerEditor(true));
    }
    
    @PostMapping("/save")
    public String saveSalle(
            @ModelAttribute("salle") Salle salle,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) {
        
        try {
           
            if (imageFile != null && !imageFile.isEmpty()) {
                String imageUrl = saveImage(imageFile);
                salle.setImageUrl(imageUrl);
            } else if (salle.getId() != null) {
                
                Salle existingSalle = salleService.getSalleById(salle.getId()).orElse(null);
                if (existingSalle != null && existingSalle.getImageUrl() != null) {
                    salle.setImageUrl(existingSalle.getImageUrl());
                }
            }
            
            salleService.saveSalle(salle);
            return "redirect:/";
            
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/salles/nouveau?error=upload";
        }
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
        
        Salle salle = salleService.getSalleById(id).orElse(null);
        if (salle != null && salle.getImageUrl() != null) {
            deleteImage(salle.getImageUrl());
        }
        
        salleService.deleteSalle(id);
        return "redirect:/";
    }
    
   
    private String saveImage(MultipartFile file) throws IOException {
        
        Path uploadDir = Paths.get(uploadPath);
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }
        
        // Générer un nom unique pour l'image
        String originalFilename = file.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String uniqueFilename = UUID.randomUUID().toString() + extension;
        
        
        Path filePath = uploadDir.resolve(uniqueFilename);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        
        
        return "/uploads/salles/" + uniqueFilename;
    }
    
 
    private void deleteImage(String imageUrl) {
        try {
            if (imageUrl != null && imageUrl.startsWith("/uploads/")) {
                String relativePath = imageUrl.replace("/uploads/", "");
                Path imagePath = Paths.get("uploads").resolve(relativePath);
                Files.deleteIfExists(imagePath);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}