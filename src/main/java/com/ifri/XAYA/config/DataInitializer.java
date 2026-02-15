package com.ifri.XAYA.config;

import com.ifri.XAYA.models.Role;
import com.ifri.XAYA.models.Salle;
import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.repositories.SalleRepository;
import com.ifri.XAYA.repositories.UtilisateurRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner initData(
            UtilisateurRepository userRepo,
            SalleRepository salleRepo,
            PasswordEncoder encoder
    ) {
        return args -> {

            // =========================
            // 🔹 ADMIN
            // =========================
            if (userRepo.countByRole(Role.ADMIN) < 3) {
                creerUtilisateur(userRepo, encoder,
                        "Admin 1", "admin1@xaya.com",
                        "admin123", Role.ADMIN);

                creerUtilisateur(userRepo, encoder,
                        "Admin 2", "admin2@xaya.com",
                        "admin123", Role.ADMIN);

                creerUtilisateur(userRepo, encoder,
                        "Admin 3", "admin3@xaya.com",
                        "admin123", Role.ADMIN);
            }

            // =========================
            // 🔹 CLIENT
            // =========================
            if (userRepo.countByRole(Role.CLIENT) < 3) {

                creerUtilisateur(userRepo, encoder,
                        "Client 1",
                        "client1@xaya.com",
                        "client123",
                        Role.CLIENT);

                creerUtilisateur(userRepo, encoder,
                        "Client 2",
                        "client2@xaya.com",
                        "client123",
                        Role.CLIENT);

                creerUtilisateur(userRepo, encoder,
                        "Client 3",
                        "client3@xaya.com",
                        "client123",
                        Role.CLIENT);
            }

            // =========================
            // 🔹 SALLES
            // =========================
            if (salleRepo.count() == 0) {

                Salle s1 = new Salle();
                s1.setNom("Salle Informatique");
                s1.setCapacite(40);
                s1.setDisponible(true);
                s1.setLocalisation("Bloc A");
                s1.setImageUrl("/uploads/salles/salle1.jpg");

                Salle s2 = new Salle();
                s2.setNom("Salle Réunion");
                s2.setCapacite(20);
                s2.setDisponible(true);
                s2.setLocalisation("Bloc B");
                s2.setImageUrl("/uploads/salles/salle2.jpg");

                Salle s3 = new Salle();
                s3.setNom("Salle Conférence");
                s3.setCapacite(15);
                s3.setDisponible(true);
                s3.setLocalisation("Grand Hall");
                s3.setImageUrl("/uploads/salles/salle3.jpg");

                salleRepo.save(s1);
                salleRepo.save(s2);
                salleRepo.save(s3);
            }
        };
    }

    private void creerUtilisateur(UtilisateurRepository repo,
                                   PasswordEncoder encoder,
                                   String nom,
                                   String email,
                                   String motDepasse,
                                   Role role) {

        if (!repo.existsByEmail(email)) {
            Utilisateur user = new Utilisateur();
            user.setNom(nom);
            user.setEmail(email);
            user.setMotDePasse(encoder.encode(motDepasse));
            user.setRole(role);
            user.setEnabled(true);
            repo.save(user);
        }
    }
}