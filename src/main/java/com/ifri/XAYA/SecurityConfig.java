package com.ifri.XAYA;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
            	    // Ajoute "/error" ici absolument
            	    .requestMatchers("/connexion", "/login", "/error", "/inscription", "/css/**", "/js/**", "/images/**").permitAll()
            	    .requestMatchers("/admin/**").hasRole("ADMIN")
            	    .anyRequest().authenticated()
            	)
            .formLogin(form -> form
            		 .loginPage("/connexion")  // 👈 Page JSP à afficher
                     .loginProcessingUrl("/login")  // 👈 URL où le formulaire POST ses données (DIFFÉRENT!)
                .usernameParameter("username") // 👈 AJOUTÉ: accepte "username" du formulaire
                .defaultSuccessUrl("/utilisateurs", true) // 👈 AJOUTÉ: redirection après login
                .failureUrl("/connexion?error=true") // 👈 AJOUTÉ: redirection si erreur
                .permitAll()
            )
            .logout(logout -> logout
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/connexion?logout=true")
                    .permitAll()
                );
        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(
            AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}