package com.ifri.XAYA.models;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "reservations")
public class Reservation {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private LocalDate dateReservation;
    
    @Column(nullable = false, columnDefinition = "TIME")
    private LocalTime heureDebut;
    
    @Column(nullable = false, columnDefinition = "TIME")
    private LocalTime heureFin;
    
   
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private StatutReservation statut = StatutReservation.EN_ATTENTE;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "utilisateur_id", nullable = false)
    private Utilisateur utilisateur;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "salle_id", nullable = false)
    private Salle salle;
    
    // Constructeurs
    public Reservation() {}
    
    public Reservation(LocalDate dateReservation, LocalTime heureDebut, 
                      LocalTime heureFin, Utilisateur utilisateur, Salle salle) {
        this.dateReservation = dateReservation;
        this.heureDebut = heureDebut;
        this.heureFin = heureFin;
        this.utilisateur = utilisateur;
        this.salle = salle;
        this.statut = StatutReservation.EN_ATTENTE;
    }
    
    // Getters et Setters
    public Long getId() { 
        return id; 
    }
    
    public void setId(Long id) { 
        this.id = id; 
    }
    
    public LocalDate getDateReservation() { 
        return dateReservation; 
    }
    
    public void setDateReservation(LocalDate dateReservation) { 
        this.dateReservation = dateReservation; 
    }
    
    public LocalTime getHeureDebut() { 
        return heureDebut; 
    }
    
    public void setHeureDebut(LocalTime heureDebut) { 
        this.heureDebut = heureDebut; 
    }
    
    public LocalTime getHeureFin() { 
        return heureFin; 
    }
    
    public void setHeureFin(LocalTime heureFin) { 
        this.heureFin = heureFin; 
    }
    

    public StatutReservation getStatut() { 
        return statut; 
    }
    
    public void setStatut(StatutReservation statut) { 
        this.statut = statut; 
    }
    
    public Utilisateur getUtilisateur() { 
        return utilisateur; 
    }
    
    public void setUtilisateur(Utilisateur utilisateur) { 
        this.utilisateur = utilisateur; 
    }
    
    public Salle getSalle() { 
        return salle; 
    }
    
    public void setSalle(Salle salle) { 
        this.salle = salle; 
    }
}