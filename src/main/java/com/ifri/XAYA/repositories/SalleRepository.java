package com.ifri.XAYA.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ifri.XAYA.models.Salle;

import java.util.List;

@Repository
public interface SalleRepository extends JpaRepository<Salle, Long> {
    List<SalleRepository> findByCapaciteGreaterThanEqual(Integer capacite);
}
