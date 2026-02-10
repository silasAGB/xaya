<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réserver une salle - XAYA</title>
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
        
        .reservation-card {
            max-width: 500px;
            width: 100%;
        }
        
        .card {
            border: none;
            border-radius: 25px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
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
        
        .form-control {
            border-left: none;
            padding: 12px;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: none;
        }
        
        .btn-confirm {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 14px;
            font-weight: 700;
            border-radius: 12px;
            color: white;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-confirm:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
            color: white;
        }

        .room-badge {
            background-color: #f0f2f5;
            color: #764ba2;
            padding: 8px 15px;
            border-radius: 50px;
            font-weight: 600;
            display: inline-block;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="reservation-card">
        <div class="card">
            <div class="card-header">
                <div class="logo-circle">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <h2 class="mb-1">Réservation</h2>
                <p class="mb-0 opacity-75">Préparez votre événement</p>
            </div>

            <div class="card-body p-4 p-md-5 bg-white">
                
                <form action="${pageContext.request.contextPath}/reservations/save" method="post">
                    <input type="hidden" name="salleId" value="${param.salleId}">

                    <div class="text-center mb-4">
                        <span class="room-badge">
                            <i class="fas fa-door-open me-2"></i>Salle ID : #${param.salleId}
                        </span>
                    </div>

                    <div class="mb-4">
                        <label for="date" class="form-label fw-bold">Date de l'événement</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-calendar-day"></i></span>
                            <input type="date" class="form-control" id="date" name="dateEvenement" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="nbPers" class="form-label fw-bold">Nombre d'invités</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-users"></i></span>
                            <input type="number" class="form-control" id="nbPers" name="nombrePersonnes" placeholder="Ex: 150" required min="1">
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="comm" class="form-label fw-bold">Besoins spécifiques</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-comment-dots"></i></span>
                            <textarea class="form-control" id="comm" name="commentaire" rows="3" placeholder="Traiteur, décoration, sono..."></textarea>
                        </div>
                    </div>

                    <hr class="my-4 opacity-25">

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-confirm">
                            Confirmer la réservation
                        </button>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-link text-muted text-decoration-none text-center">
                            <i class="fas fa-times me-1"></i> Annuler
                        </a>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<script>
    // Empêche la sélection de dates passées
    const dateInput = document.getElementById('date');
    const today = new Date().toISOString().split('T')[0];
    dateInput.setAttribute('min', today);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>