package com.ifri.XAYA.models;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.Entity;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "salles")
public class Salle {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 150)
    private String nom;
    
    @Column(nullable = false)
    private Integer capacite;
    
    @Column(nullable = false, length = 150)
    private String localisation;
    
    @Column(nullable = false)
    private boolean disponible = true;
    

    @Column(length = 500)
    private String imageUrl;
    
    @OneToMany(mappedBy = "salle", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Reservation> reservations = new ArrayList<>();
    
    // Constructeurs
    public Salle() {}
    
    public Salle(String nom, Integer capacite, String localisation, boolean disponible) {
        this.nom = nom;
        this.capacite = capacite;
        this.localisation = localisation;
        this.disponible = disponible;
    }
    
    // Constructeur avec image
    public Salle(String nom, Integer capacite, String localisation, boolean disponible, String imageUrl) {
        this.nom = nom;
        this.capacite = capacite;
        this.localisation = localisation;
        this.disponible = disponible;
        this.imageUrl = imageUrl;
    }
    
    // Getters et Setters 
    public Long getId() { 
        return id; 
    }
    
    public void setId(Long id) { 
        this.id = id; 
    }
    
    public String getNom() { 
        return nom; 
    }
    
    public void setNom(String nom) { 
        this.nom = nom; 
    }
    
    public Integer getCapacite() { 
        return capacite; 
    }
    
    public void setCapacite(Integer capacite) { 
        this.capacite = capacite; 
    }
    
    public String getLocalisation() { 
        return localisation; 
    }
    
    public void setLocalisation(String localisation) { 
        this.localisation = localisation; 
    }
    
    public boolean isDisponible() { 
        return disponible; 
    }
    
    public void setDisponible(boolean disponible) { 
        this.disponible = disponible; 
    }
    

    public String getImageUrl() {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    public List<Reservation> getReservations() { 
        return reservations; 
    }
    
    public void setReservations(List<Reservation> reservations) { 
        this.reservations = reservations; 
    }
}