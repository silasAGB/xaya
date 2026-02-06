package com.ifri.XAYA.config;

import com.ifri.XAYA.models.Role;
import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.repositories.UtilisateurRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner initAdmins(
            UtilisateurRepository repo,
            PasswordEncoder encoder
    ) {
        return args -> {
            if (repo.countByRole(Role.ADMIN) < 3) {

                creerAdmin(repo, encoder,
                        "Admin 1", "admin1@xaya.com", "admin123");

                creerAdmin(repo, encoder,
                        "Admin 2", "admin2@xaya.com", "admin123");

                creerAdmin(repo, encoder,
                        "Admin 3", "admin3@xaya.com", "admin123");
            }
        };
    }

    private void creerAdmin(UtilisateurRepository repo,
                            PasswordEncoder encoder,
                            String nom,
                            String email,
                            String motDepasse) {

        if (!repo.existsByEmail(email)) {
            Utilisateur admin = new Utilisateur();
            admin.setNom(nom);
            admin.setEmail(email);
            admin.setMotDePasse(encoder.encode(motDepasse));
            admin.setRole(Role.ADMIN);

            repo.save(admin);
        }
    }
}

