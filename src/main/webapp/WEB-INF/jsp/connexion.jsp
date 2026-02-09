<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - XAYA</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --gold-accent: #ffd700;
            --dark-purple: #2d1b4e;
            --light-purple: #8b7ab8;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            overflow-x: hidden;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #7e22ce 100%);
            position: relative;
        }
        
        /* Animated background particles */
        .background-decoration {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 0;
            overflow: hidden;
            pointer-events: none;
        }
        
        .particle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.15);
            animation: float 20s infinite ease-in-out;
        }
        
        .particle:nth-child(1) {
            width: 80px;
            height: 80px;
            left: 10%;
            top: 20%;
            animation-delay: 0s;
            background: rgba(255, 215, 0, 0.2);
        }
        
        .particle:nth-child(2) {
            width: 120px;
            height: 120px;
            right: 15%;
            top: 60%;
            animation-delay: 2s;
            background: rgba(138, 43, 226, 0.2);
        }
        
        .particle:nth-child(3) {
            width: 60px;
            height: 60px;
            left: 70%;
            top: 30%;
            animation-delay: 4s;
            background: rgba(255, 105, 180, 0.2);
        }
        
        .particle:nth-child(4) {
            width: 100px;
            height: 100px;
            left: 25%;
            bottom: 15%;
            animation-delay: 6s;
            background: rgba(64, 224, 208, 0.2);
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
                opacity: 0.3;
            }
            50% {
                transform: translateY(-50px) rotate(180deg);
                opacity: 0.8;
            }
        }
        
        /* Main container */
        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            z-index: 1;
        }
        
        .login-card {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(20px);
            border-radius: 30px;
            box-shadow: 0 30px 90px rgba(0, 0, 0, 0.3),
                        0 0 0 1px rgba(255, 255, 255, 0.2);
            overflow: hidden;
            width: 100%;
            max-width: 450px;
            animation: slideUp 0.8s ease-out;
            position: relative;
        }
        
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .login-header {
            background: var(--primary-gradient);
            padding: 50px 40px 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .login-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
            animation: pulse 15s infinite;
        }
        
        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
                opacity: 0.5;
            }
            50% {
                transform: scale(1.2);
                opacity: 0.8;
            }
        }
        
        .logo-icon {
            width: 80px;
            height: 80px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            border: 3px solid rgba(255, 255, 255, 0.5);
            animation: rotate3d 3s infinite ease-in-out;
            position: relative;
            z-index: 1;
        }
        
        @keyframes rotate3d {
            0%, 100% {
                transform: rotateY(0deg);
            }
            50% {
                transform: rotateY(180deg);
            }
        }
        
        .logo-icon i {
            font-size: 40px;
            color: white;
        }
        
        .login-title {
            font-family: 'Playfair Display', serif;
            font-size: 42px;
            font-weight: 900;
            color: white;
            margin: 0 0 10px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 1;
            letter-spacing: 1px;
        }
        
        .login-subtitle {
            color: rgba(255, 255, 255, 0.95);
            font-size: 16px;
            font-weight: 300;
            position: relative;
            z-index: 1;
        }
        
        .login-body {
            padding: 45px 40px;
        }
        
        .form-floating {
            margin-bottom: 25px;
            position: relative;
        }
        
        .form-floating input {
            border: 2px solid #e8e8f0;
            border-radius: 15px;
            padding: 25px 20px 10px 50px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8f9ff;
        }
        
        .form-floating input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            background: white;
        }
        
        .form-floating label {
            padding-left: 50px;
            color: #888;
            transition: all 0.3s ease;
        }
        
        .input-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #667eea;
            z-index: 10;
            transition: all 0.3s ease;
        }
        
        .form-floating input:focus ~ .input-icon {
            color: #764ba2;
            transform: translateY(-50%) scale(1.1);
        }
        
        .password-toggle {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #667eea;
            cursor: pointer;
            font-size: 18px;
            z-index: 10;
            transition: all 0.3s ease;
        }
        
        .password-toggle:hover {
            color: #764ba2;
            transform: translateY(-50%) scale(1.2);
        }
        
        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .form-check-label {
            color: #555;
            font-size: 14px;
        }
        
        .form-check-input:checked {
            background-color: #667eea;
            border-color: #667eea;
        }
        
        .forgot-link {
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .forgot-link:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .btn-login {
            width: 100%;
            padding: 18px;
            border: none;
            border-radius: 15px;
            background: var(--primary-gradient);
            color: white;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s;
        }
        
        .btn-login:hover::before {
            left: 100%;
        }
        
        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(102, 126, 234, 0.4);
        }
        
        .btn-login:active {
            transform: translateY(-1px);
        }
        
        .divider {
            text-align: center;
            margin: 30px 0;
            position: relative;
        }
        
        .divider::before,
        .divider::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 40%;
            height: 1px;
            background: linear-gradient(to right, transparent, #ddd, transparent);
        }
        
        .divider::before {
            left: 0;
        }
        
        .divider::after {
            right: 0;
        }
        
        .divider span {
            background: white;
            padding: 0 15px;
            color: #888;
            font-size: 14px;
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
            color: #555;
        }
        
        .register-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .register-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }
        
        .alert {
            border-radius: 15px;
            margin-bottom: 25px;
            border: none;
            animation: slideDown 0.5s ease;
        }
        
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsive */
        @media (max-width: 576px) {
            .login-card {
                border-radius: 20px;
            }
            
            .login-header {
                padding: 40px 30px 30px;
            }
            
            .login-title {
                font-size: 32px;
            }
            
            .login-body {
                padding: 35px 30px;
            }
            
            .logo-icon {
                width: 60px;
                height: 60px;
            }
            
            .logo-icon i {
                font-size: 30px;
            }
        }
        
        /* Loading state */
        .btn-login.loading {
            pointer-events: none;
            opacity: 0.7;
        }
        
        .btn-login.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            top: 50%;
            left: 50%;
            margin-left: -10px;
            margin-top: -10px;
            border: 3px solid rgba(255, 255, 255, 0.3);
            border-top-color: white;
            border-radius: 50%;
            animation: spin 0.8s linear infinite;
        }
        
        @keyframes spin {
            to {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <!-- Background decorations -->
    <div class="background-decoration">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <div class="login-container">
        <div class="login-card">
            <!-- Header -->
            <div class="login-header">
                <div class="logo-icon">
                    <i class="fas fa-champagne-glasses"></i>
                </div>
                <h1 class="login-title">XAYA</h1>
                <p class="login-subtitle">Réservation de salles de fête</p>
            </div>

            <!-- Body -->
            <div class="login-body">
                <!-- Message d'erreur (si existe) -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        ${error}
                    </div>
                </c:if>

                <!-- Message de succès (si existe) -->
                <c:if test="${not empty message}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i>
                        ${message}
                    </div>
                </c:if>

                <!-- Formulaire de connexion -->
                <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
                    <!-- Email -->
                    <div class="form-floating">
						<input type="email" 
						       id="username" 
						       name="username" 
						       placeholder="Email">
						<label for="username">Adresse email</label>
						<i class="fas fa-envelope input-icon"></i>
                    </div>

                    <!-- Mot de passe -->
                    <div class="form-floating">
                        <input type="password" 
                               class="form-control" 
                               id="password" 
                               name="password" 
                               placeholder="Mot de passe" 
                               required>
                        <label for="password">Mot de passe</label>
                        <i class="fas fa-lock input-icon"></i>
                        <button type="button" class="password-toggle" onclick="togglePassword()">
                            <i class="fas fa-eye" id="toggleIcon"></i>
                        </button>
                    </div>

                    <!-- Se souvenir / Mot de passe oublié -->
                    <div class="remember-forgot">
                        <div class="form-check">
                            <input class="form-check-input" 
                                   type="checkbox" 
                                   id="remember" 
                                   name="remember">
                            <label class="form-check-label" for="remember">
                                Se souvenir de moi
                            </label>
                        </div>
                        <a href="${pageContext.request.contextPath}/mot-de-passe-oublie" class="forgot-link">
                            Mot de passe oublié ?
                        </a>
                    </div>

                    <!-- Bouton de connexion -->
                    <button type="submit" class="btn btn-login" id="loginBtn">
                        <span id="btnText">Se connecter</span>
                    </button>
                </form>

                <!-- Divider -->
                <div class="divider">
                    <span>OU</span>
                </div>

                <!-- Lien d'inscription -->
                <div class="register-link">
                    Pas encore de compte ? 
                    <a href="${pageContext.request.contextPath}/inscription">Créer un compte</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Toggle password visibility
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.getElementById('toggleIcon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }

        // Form submission with loading state
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const btn = document.getElementById('loginBtn');
            const btnText = document.getElementById('btnText');
            
            btn.classList.add('loading');
            btnText.textContent = 'Connexion en cours...';
        });

        // Animation on input focus
        document.querySelectorAll('.form-floating input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                if (!this.value) {
                    this.parentElement.classList.remove('focused');
                }
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
