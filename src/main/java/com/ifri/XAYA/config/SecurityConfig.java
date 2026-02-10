package com.ifri.XAYA.config;

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
                    .requestMatchers(
                    		"/",
                        "/connexion",
                        "/login",
                        "/error",
                        "/inscription",
                        "/logout",
                        "/WEB-INF/**",
                        "/css/**",
                        "/js/**",
                        "/images/**"
                    ).permitAll()
                    .requestMatchers("/reservations/**").authenticated() // <--- Oblige la connexion
                    .requestMatchers("/utilisateurs/**").hasRole("ADMIN") // Seul l'admin peut gérer les users
                    .anyRequest().authenticated()
                )

                .formLogin(form -> form
                    .loginPage("/connexion")          // page JSP
                    .loginProcessingUrl("/login")     // POST du formulaire
                    .usernameParameter("username")
                    .passwordParameter("password")
                    .defaultSuccessUrl("/", true)
                    .failureUrl("/connexion?error=true")
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