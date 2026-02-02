package com.ifri.XAYA.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(name = "reservations")
public class Reservation {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private LocalDate dateReservation;
    
    @Column(nullable = false)
    private LocalDate heureDebut;
    
    @Column(nullable = false)
    private LocalDate heureFin;
    
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "utilisateur_id", nullable = false)
    private Utilisateur utilisateur;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "salle_id", nullable = false)
    private Salle salle;
    
    // Constructeurs
    public Reservation() {}
    
    public Reservation(LocalDate dateReservation, LocalDate heureDebut, 
    		LocalDate heureFin, Utilisateur utilisateur, Salle salle) {
        this.dateReservation = dateReservation;
        this.heureDebut = heureDebut;
        this.heureFin = heureFin;
        this.utilisateur = utilisateur;
        this.salle = salle;
    }
    
    // Getters et Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public LocalDate getDateReservation() { return dateReservation; }
    public void setDateReservation(LocalDate dateReservation) { this.dateReservation = dateReservation; }
    
    public LocalDate getHeureDebut() { return heureDebut; }
    public void setHeureDebut(LocalDate heureDebut) { this.heureDebut = heureDebut; }
    
    public LocalDate getHeureFin() { return heureFin; }
    public void setHeureFin(LocalDate heureFin) { this.heureFin = heureFin; }
    
    public Utilisateur getUtilisateur() { return utilisateur; }
    public void setUtilisateur(Utilisateur utilisateur) { this.utilisateur = utilisateur; }
    
    public Salle getSalle() { return salle; }
    public void setSalle(Salle salle) { this.salle = salle; }
}
