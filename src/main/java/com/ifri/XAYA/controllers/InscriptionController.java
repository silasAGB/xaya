package com.ifri.XAYA.controllers;

import com.ifri.XAYA.models.Role;
import com.ifri.XAYA.models.Utilisateur;
import com.ifri.XAYA.services.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class InscriptionController {

    @Autowired
    private UtilisateurService utilisateurService;

    /**
     * Affiche la page d'inscription
     */
    @GetMapping("/inscription")
    public String showInscriptionForm(Model model) {
        return "inscription";
    }

    /**
     * Traite le formulaire d'inscription
     */
    @PostMapping("/inscription")
    public String processInscription(
            @RequestParam("nom") String nom,
            @RequestParam("email") String email,
            @RequestParam("motDePasse") String motDePasse,
            @RequestParam("confirmPassword") String confirmPassword,
            RedirectAttributes redirectAttributes,
            Model model) {

        // 1. Vérifier que les mots de passe correspondent
        if (!motDePasse.equals(confirmPassword)) {
            model.addAttribute("error", "Les mots de passe ne correspondent pas");
            return "inscription";
        }

        // 2. Vérifier que l'email n'existe pas déjà
        if (utilisateurService.emailExists(email)) {
            model.addAttribute("error", "Cette adresse email est déjà utilisée");
            return "inscription";
        }

        try {
            // 3. Créer le nouvel utilisateur
            Utilisateur nouveauUtilisateur = new Utilisateur();
            nouveauUtilisateur.setNom(nom);
            nouveauUtilisateur.setEmail(email);
            nouveauUtilisateur.setMotDePasse(motDePasse); // sera encodé dans le service
            nouveauUtilisateur.setRole(Role.CLIENT); // Tous les inscrits sont des clients
            nouveauUtilisateur.setEnabled(true); // Activation automatique pour le TP

            // 4. Sauvegarder l'utilisateur
            utilisateurService.saveUtilisateur(nouveauUtilisateur);

            // 5. Rediriger vers la page de connexion avec un message de succès
            redirectAttributes.addFlashAttribute("message", 
                "Inscription réussie ! Vous pouvez maintenant vous connecter.");
            return "redirect:/connexion";

        } catch (Exception e) {
            model.addAttribute("error", 
                "Une erreur s'est produite lors de l'inscription. Veuillez réessayer.");
            return "inscription";
        }
    }
}