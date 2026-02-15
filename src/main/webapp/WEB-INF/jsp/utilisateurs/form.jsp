<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${utilisateur.id == null ? 'Nouvel Utilisateur' : 'Modifier Profil'} - XAYA</title>
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
            padding: 40px 0;
        }
        
        .form-card {
            max-width: 550px;
            width: 100%;
        }
        
        .card {
            border: none;
            border-radius: 25px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 30px 30px;
            border: none;
            text-align: center;
        }

        .logo-circle {
            width: 70px;
            height: 70px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
        }
        
        .logo-circle i {
            font-size: 30px;
        }
        
        .input-group-text {
            background-color: #f8f9fa;
            border-right: none;
            color: #764ba2;
        }
        
        .form-control, .form-select {
            border-left: none;
            padding: 12px;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: none;
        }
        
        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 14px;
            font-weight: 700;
            border-radius: 12px;
            transition: all 0.3s;
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
            color: white;
        }

        .form-label {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 8px;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<div class="container d-flex justify-content-center">
    <div class="form-card">
        <div class="card shadow">
            <div class="card-header">
                <div class="logo-circle">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h2 class="mb-1">${utilisateur.id == null ? 'Inscription' : 'Profil'}</h2>
                <p class="mb-0 opacity-75">Gestion des comptes XAYA</p>
            </div>

            <div class="card-body p-4 p-md-5 bg-white">
                <form:form action="${pageContext.request.contextPath}/utilisateurs/save" 
                           method="post" modelAttribute="utilisateur">
                    
                    <form:hidden path="id" />

                    <div class="mb-4">
                        <label class="form-label fw-bold">Nom complet</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                            <form:input path="nom" class="form-control" placeholder="Ex: Jean Dupont" required="true" />
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Adresse Email</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <form:input type="email" path="email" class="form-control" placeholder="email@exemple.com" required="true" />
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Mot de passe</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <form:password path="motDePasse" class="form-control" placeholder="••••••••" required="${utilisateur.id == null}" />
                        </div>
                        <c:if test="${utilisateur.id != null}">
                            <small class="text-muted mt-1 d-block"><i class="fas fa-info-circle me-1"></i>Laissez vide pour ne pas modifier.</small>
                        </c:if>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-bold">Rôle</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user-shield"></i></span>
                                <form:select path="role" class="form-select">
                                    <form:option value="CLIENT">Client</form:option>
                                    <form:option value="ADMIN">Admin</form:option>
                                </form:select>
                            </div>
                        </div>

                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-bold">Statut du compte</label>
                            <div class="form-check form-switch pt-2">
                                <form:checkbox path="enabled" class="form-check-input" id="enableSwitch" />
                                <label class="form-check-label ms-2" for="enableSwitch">Activé</label>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4 opacity-25">

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-submit text-white">
                            <i class="fas fa-save me-2"></i> Enregistrer
                        </button>
                        <a href="${pageContext.request.contextPath}/utilisateurs/list" class="btn btn-link text-muted text-decoration-none text-center">
                            <i class="fas fa-arrow-left me-1"></i> Retour à la liste
                        </a>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>