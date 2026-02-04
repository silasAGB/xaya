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
    
    @GetMapping
    public String listReservations(Model model) {
        model.addAttribute("reservations", reservationService.getAllReservations());
        return "reservation/list";
    }
    
    @GetMapping("/nouveau")
    public String showCreateForm(Model model) {
        model.addAttribute("reservation", new Reservation());
        model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
        model.addAttribute("salles", salleService.getAllSalles());
        return "reservation/form";
    }
    
    @PostMapping("/save")
    public String saveReservation(@ModelAttribute("reservation") Reservation reservation,
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
