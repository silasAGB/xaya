package com.ifri.XAYA.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ifri.XAYA.models.Reservation;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    List<Reservation> findByUtilisateurId(Long utilisateurId);
    List<Reservation> findBySalleId(Long salleId);
    List<ReservationRepository> findBySalleAndDateEvenement(SalleRepository salle, LocalDate dateEvenement);
	Reservation save(Reservation reservation);
}