package com.ifri.XAYA.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ifri.XAYA.models.Reservation;
import com.ifri.XAYA.repositories.ReservationRepository;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ReservationService {
    
    @Autowired
    private ReservationRepository reservationRepo;
    
    public List<Reservation> getAllReservations() {
        return reservationRepo.findAll();
    }
    
    public Optional<Reservation> getReservationById(Long id) {
        return reservationRepo.findById(id);
    }
    
    public Reservation saveReservation(Reservation reservation) {
        return reservationRepo.save(reservation);
    }
    
    public void deleteReservation(Long id) {
    	reservationRepo.deleteById(id);
    }
    
    public List<Reservation> getReservationsByUtilisateur(Long utilisateurId) {
        return reservationRepo.findByUtilisateurId(utilisateurId);
    }
    
    public List<Reservation> getReservationsBySalle(Long salleId) {
        return reservationRepo.findBySalleId(salleId);
    }
}
