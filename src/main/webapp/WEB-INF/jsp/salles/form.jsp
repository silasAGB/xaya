<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${salle.id == null ? 'Nouvelle Salle' : 'Modifier la Salle'} - XAYA</title>
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
        
        .form-card {
            max-width: 600px;
            width: 100%;
        }
        
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 30px 30px;
            border: none;
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

        .btn-success {
            background: linear-gradient(135deg, #28a745 0%, #1e7e34 100%);
            border: none;
            padding: 12px;
            font-weight: 600;
            transition: transform 0.2s;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
        }

        .form-check-input:checked {
            background-color: #667eea;
            border-color: #667eea;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="form-card mx-auto">
        <div class="card shadow">
            <div class="card-header text-center">
                <div class="logo-circle">
                    <i class="fas fa-door-open"></i>
                </div>
                <h2 class="mb-1">${salle.id == null ? 'Nouvelle Salle' : 'Modification'}</h2>
                <p class="mb-0 opacity-75">Gestion du catalogue XAYA</p>
            </div>

            <div class="card-body p-4 p-md-5 bg-white">
                <form:form action="${pageContext.request.contextPath}/salles/save" 
                           method="post" modelAttribute="salle">
                    
                    <form:hidden path="id" />

                    <div class="mb-4">
                        <label for="nom" class="form-label fw-bold">Nom de la salle</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-tag"></i></span>
                            <form:input path="nom" class="form-control" placeholder="Ex: Grand Palace" required="true" />
                        </div>
                        <form:errors path="nom" class="text-danger small" />
                    </div>

                    <div class="mb-4">
                        <label for="localisation" class="form-label fw-bold">Localisation</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                            <form:input path="localisation" class="form-control" placeholder="Ex: Quartier Latin, Rue 12" required="true" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <label for="capacite" class="form-label fw-bold">Capacité</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-users"></i></span>
                                <form:input type="number" path="capacite" class="form-control" placeholder="Nombre de pers." required="true" min="1" />
                            </div>
                        </div>

                        <div class="col-md-6 mb-4">
                            <label class="form-label fw-bold">Disponibilité</label>
                            <div class="form-check form-switch pt-2">
                                <form:checkbox path="disponible" class="form-check-input" id="disponibleCheck" />
                                <label class="form-check-label" for="disponibleCheck">Active</label>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4 opacity-25">

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-success shadow-sm">
                            <i class="fas fa-save me-2"></i> Enregistrer les modifications
                        </button>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-link text-muted text-decoration-none text-center">
                            <i class="fas fa-times me-1"></i> Annuler et retourner
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