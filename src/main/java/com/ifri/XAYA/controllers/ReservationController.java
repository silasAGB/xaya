package com.ifri.XAYA.controllers;

import com.ifri.XAYA.models.Reservation;
import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.services.ReservationService;
import com.ifri.XAYA.services.UtilisateurService;
import com.ifri.XAYA.services.SalleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;

@Controller
@RequestMapping("/reservations")
public class ReservationController {
    
    @Autowired
    private ReservationService reservationService;
    
    @Autowired
    private UtilisateurService utilisateurService;
    
    @Autowired
    private SalleService salleService;
    
    // ==========================================
    // ROUTES POUR L'ADMIN
    // ==========================================
    
    /**
     * Liste de TOUTES les réservations (Admin uniquement)
     * URL: /reservations
     */
    @GetMapping("/list")
    public String listReservations(Model model) {
        model.addAttribute("reservations", reservationService.getAllReservations());
        return "reservations/list";  // ✅ CORRIGÉ: sans 's' à reservation
    }
    
    /**
     * Valider une réservation (Admin uniquement)
     * URL: POST /reservations/valider/{id}
     */
    @PostMapping("/valider/{id}")
    public String validerReservation(@PathVariable Long id) {
        reservationService.validerReservation(id);
        return "redirect:/reservations/list";
    }
    
    /**
     * Rejeter une réservation (Admin uniquement)
     * URL: POST /reservations/rejeter/{id}
     */
    @PostMapping("/rejeter/{id}")
    public String rejeterReservation(@PathVariable Long id) {
        reservationService.rejeterReservation(id);
        return "redirect:/reservations/list";
    }
    
    // ==========================================
    // ROUTES POUR LE CLIENT
    // ==========================================
    
    /**
     * Mes réservations (Client connecté)
     * URL: /reservations/mes-reservations
     */
    @GetMapping("/mesReservations")
    public String mesReservations(Model model) {
        // Récupérer l'utilisateur connecté
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String email = auth.getName();
        
        Utilisateur utilisateur = utilisateurService.findByEmail(email)
            .orElseThrow(() -> new IllegalArgumentException("Utilisateur non trouvé"));
        
        // Récupérer uniquement SES réservations
        model.addAttribute("reservations", 
            reservationService.getReservationsByUtilisateur(utilisateur.getId()));
        
        return "reservations/mesReservations";  // ✅ Page pour le client
    }
    
    /**
     * Formulaire de nouvelle réservation (Client)
     * URL: /reservations/nouveau?salleId=X
     */
    @GetMapping("/nouveau")
    public String showCreateForm(Model model, @RequestParam(required = false) Long salleId) {
        // Récupérer l'utilisateur connecté
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String email = auth.getName();
        
        Utilisateur utilisateurConnecte = utilisateurService.findByEmail(email)
            .orElseThrow(() -> new IllegalArgumentException("Utilisateur non trouvé"));
        
        // Passer l'utilisateur au formulaire
        model.addAttribute("utilisateurConnecte", utilisateurConnecte);
        model.addAttribute("reservation", new Reservation());
        model.addAttribute("salles", salleService.getAllSalles());
        
        if (salleId != null) {
            model.addAttribute("salleId", salleId);
        }
        
        return "reservations/form";
    }
    
    /**
     * Enregistrer une nouvelle réservation (Client)
     * URL: POST /reservations/save
     */
    @PostMapping("/save")
    public String saveReservation(
            @RequestParam Long utilisateurId,
            @RequestParam Long salleId,
            @RequestParam String dateReservation,
            @RequestParam String heureDebut,
            @RequestParam String heureFin) {
        
        Reservation reservation = new Reservation();
        
        // Associer l'utilisateur
        reservation.setUtilisateur(
            utilisateurService.getUtilisateurById(utilisateurId)
                .orElseThrow(() -> new IllegalArgumentException("Utilisateur invalide"))
        );
        
        // Associer la salle
        reservation.setSalle(
            salleService.getSalleById(salleId)
                .orElseThrow(() -> new IllegalArgumentException("Salle invalide"))
        );
        
        // Définir les dates et heures
        reservation.setDateReservation(LocalDate.parse(dateReservation));
        reservation.setHeureDebut(LocalTime.parse(heureDebut));
        reservation.setHeureFin(LocalTime.parse(heureFin));
        
        // Sauvegarder (statut = EN_ATTENTE par défaut)
        reservationService.saveReservation(reservation);
        
        // ✅ REDIRECTION : Le client revient sur SES réservations
        return "redirect:/reservations/mesReservations";
    }
    
    /**
     * Annuler une réservation (Client - seulement si EN_ATTENTE)
     * URL: GET /reservations/annuler/{id}
     */
    @GetMapping("/annuler/{id}")
    public String annulerReservation(@PathVariable Long id) {
        reservationService.deleteReservation(id);
        return "redirect:/reservations/mesReservations";
    }
}