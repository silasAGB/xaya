package com.ifri.XAYA.controllers;

import com.ifri.XAYA.models.Reservation;
import com.ifri.XAYA.services.ReservationService;
import com.ifri.XAYA.services.UtilisateurService;
import com.ifri.XAYA.services.SalleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;


@Controller
@RequestMapping("/reservations")
public class ReservationController {
    
    @Autowired
    private ReservationService reservationService;
    
    @Autowired
    private UtilisateurService utilisateurService;
    
    @Autowired
    private SalleService salleService;
    
    @GetMapping("/list")
    public String listReservations(Model model) {
        model.addAttribute("reservations", reservationService.getAllReservations());
        return "reservations/list";
    }
    
 // NOUVELLE MÉTHODE : Validation par l'Admin
 
    
    @GetMapping("/nouveau") // L'URL est : localhost:8080/reservations/nouveau
    public String showCreateForm(Model model, @RequestParam(required = false) Long salleId) {
        Reservation res = new Reservation();
        model.addAttribute("reservation", res);
        
        // On récupère la liste pour le formulaire
        model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
        model.addAttribute("salles", salleService.getAllSalles());
        
        return "reservations/form"; // Vérifie bien le 's' à reservations
    }
    
    @PostMapping("/save")
    public String saveReservation(@ModelAttribute("reservations") Reservation reservation,
                                 @RequestParam Long utilisateurId,
                                 @RequestParam Long salleId) {
        reservation.setUtilisateur(utilisateurService.getUtilisateurById(utilisateurId)
            .orElseThrow(() -> new IllegalArgumentException("Utilisateur invalide")));
        reservation.setSalle(salleService.getSalleById(salleId)
            .orElseThrow(() -> new IllegalArgumentException("Salle invalide")));
        reservation.setDateReservation(LocalDate.now());
        
        reservationService.saveReservation(reservation);
        return "redirect:/reservations";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteReservation(@PathVariable Long id) {
        reservationService.deleteReservation(id);
        return "redirect:/reservations";
    }
}
