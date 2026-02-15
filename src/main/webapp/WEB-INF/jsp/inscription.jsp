<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - XAYA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px 0;
        }
        
        .register-card {
            max-width: 500px;
            width: 100%;
        }
        
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }
        
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 20px 20px 0 0 !important;
            padding: 40px 30px 30px;
        }
        
        .logo-circle {
            width: 80px;
            height: 80px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
        }
        
        .logo-circle i {
            font-size: 40px;
        }
        
        .input-group-text {
            background-color: #f8f9fa;
            border-right: none;
        }
        
        .form-control {
            border-left: none;
            padding: 12px;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: none;
        }
        
        .input-group:focus-within .input-group-text {
            border-color: #667eea;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px;
            font-weight: 600;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }
        
        .password-strength {
            height: 5px;
            border-radius: 3px;
            margin-top: 5px;
            transition: all 0.3s;
        }
        
        .strength-weak { background-color: #dc3545; width: 33%; }
        .strength-medium { background-color: #ffc107; width: 66%; }
        .strength-strong { background-color: #28a745; width: 100%; }
    </style>
</head>
<body>
    <div class="container">
        <div class="register-card mx-auto">
            <div class="card shadow">
                <!-- Header -->
                <div class="card-header text-center">
                    <div class="logo-circle">
                        <i class="fas fa-champagne-glasses"></i>
                    </div>
                    <h2 class="mb-1">XAYA</h2>
                    <p class="mb-0 opacity-75">Créer votre compte</p>
                </div>
                
                <!-- Body -->
                <div class="card-body p-4">
                    <!-- Messages d'erreur/succès -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>
                            ${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty message}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="fas fa-check-circle me-2"></i>
                            ${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                    
                    <h4 class="mb-4">Inscription</h4>
                    
                    
                    <form action="${pageContext.request.contextPath}/inscription" method="post" id="registerForm">
                       
                        <div class="mb-3">
                            <label for="nom" class="form-label">Nom complet</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-user"></i>
                                </span>
                                <input type="text" 
                                       class="form-control" 
                                       id="nom" 
                                       name="nom" 
                                       placeholder="Jean Dupont" 
                                       required
                                       minlength="3">
                            </div>
                        </div>
                        
                        <!-- Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Adresse email</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-envelope"></i>
                                </span>
                                <input type="email" 
                                       class="form-control" 
                                       id="email" 
                                       name="email" 
                                       placeholder="votreemail@exemple.com" 
                                       required>
                            </div>
                        </div>
                        
                        
                        <div class="mb-3">
                            <label for="motDePasse" class="form-label">Mot de passe</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-lock"></i>
                                </span>
                                <input type="password" 
                                       class="form-control" 
                                       id="motDePasse" 
                                       name="motDePasse" 
                                       placeholder="••••••••" 
                                       required
                                       minlength="6">
                                <span class="input-group-text" onclick="togglePassword('motDePasse', this)" style="cursor: pointer;">
                                    <i class="fas fa-eye"></i>
                                </span>
                            </div>
                            <div id="passwordStrength" class="password-strength"></div>
                            <small class="text-muted">Minimum 6 caractères</small>
                        </div>
                        
                       
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirmer le mot de passe</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-lock"></i>
                                </span>
                                <input type="password" 
                                       class="form-control" 
                                       id="confirmPassword" 
                                       name="confirmPassword" 
                                       placeholder="••••••••" 
                                       required
                                       minlength="6">
                                <span class="input-group-text" onclick="togglePassword('confirmPassword', this)" style="cursor: pointer;">
                                    <i class="fas fa-eye"></i>
                                </span>
                            </div>
                            <small id="passwordMatch" class="text-danger" style="display: none;">
                                Les mots de passe ne correspondent pas
                            </small>
                        </div>
                        
                        
                        <div class="mb-4">
                            <div class="form-check">
                                <input class="form-check-input" 
                                       type="checkbox" 
                                       id="acceptTerms" 
                                       name="acceptTerms" 
                                       required>
                                <label class="form-check-label" for="acceptTerms">
                                    J'accepte les <a href="#" class="text-decoration-none">conditions d'utilisation</a>
                                </label>
                            </div>
                        </div>
                        
                        
                        <button type="submit" class="btn btn-primary w-100 mb-3">
                            <i class="fas fa-user-plus me-2"></i>
                            Créer mon compte
                        </button>
                    </form>
                    
                   
                    <div class="text-center my-3">
                        <span class="text-muted">ou</span>
                    </div>
                    
                   
                    <div class="text-center">
                        <p class="mb-0">Vous avez déjà un compte ? 
                            <a href="${pageContext.request.contextPath}/connexion" class="text-decoration-none fw-bold">
                                Se connecter
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
       
		
        function togglePassword(fieldId, icon) {
            const field = document.getElementById(fieldId);
            const iconElement = icon.querySelector('i');
            
            if (field.type === 'password') {
                field.type = 'text';
                iconElement.classList.remove('fa-eye');
                iconElement.classList.add('fa-eye-slash');
            } else {
                field.type = 'password';
                iconElement.classList.remove('fa-eye-slash');
                iconElement.classList.add('fa-eye');
            }
        }
        

        document.getElementById('motDePasse').addEventListener('input', function(e) {
            const password = e.target.value;
            const strengthBar = document.getElementById('passwordStrength');
            
            let strength = 0;
            if (password.length >= 6) strength++;
            if (password.length >= 10) strength++;
            if (/[A-Z]/.test(password) && /[a-z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^A-Za-z0-9]/.test(password)) strength++;
            
            strengthBar.className = 'password-strength';
            if (strength <= 2) {
                strengthBar.classList.add('strength-weak');
            } else if (strength <= 3) {
                strengthBar.classList.add('strength-medium');
            } else {
                strengthBar.classList.add('strength-strong');
            }
        });
        
        
        const form = document.getElementById('registerForm');
        const password = document.getElementById('motDePasse');
        const confirmPassword = document.getElementById('confirmPassword');
        const matchMessage = document.getElementById('passwordMatch');
        
        function checkPasswordMatch() {
            if (confirmPassword.value && password.value !== confirmPassword.value) {
                matchMessage.style.display = 'block';
                confirmPassword.setCustomValidity('Les mots de passe ne correspondent pas');
            } else {
                matchMessage.style.display = 'none';
                confirmPassword.setCustomValidity('');
            }
        }
        
        password.addEventListener('input', checkPasswordMatch);
        confirmPassword.addEventListener('input', checkPasswordMatch);
        
        form.addEventListener('submit', function(e) {
            if (password.value !== confirmPassword.value) {
                e.preventDefault();
                matchMessage.style.display = 'block';
            }
        });
    </script>
</body>
</html>
