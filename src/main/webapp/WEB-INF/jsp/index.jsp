<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XAYA - Réservation de Salles de Fête</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }
        
        .navbar {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
            margin-bottom: 50px;
        }
        
        .card-salle {
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }
        
        .card-salle:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .card-salle img {
            height: 250px;
            object-fit: cover;
        }
        
        .badge-capacity {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
        }
        
        .price-tag {
            font-size: 24px;
            font-weight: bold;
            color: #667eea;
        }
        
        .features-section {
            background-color: #f8f9fa;
            padding: 60px 0;
        }
        
        .feature-icon {
            font-size: 48px;
            color: #667eea;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
<%@ include file="fragments/navbar.jsp" %>
    
    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-3 fw-bold mb-4">Trouvez la salle parfaite pour votre événement</h1>
            <p class="lead mb-5">Des espaces élégants pour vos moments inoubliables</p>
            <a href="/" class="btn btn-light btn-lg px-5">
                <i class="fas fa-search me-2"></i>
                Découvrir nos salles
            </a>
        </div>
    </section>
    
    <!-- Features Section -->
    <section class="features-section">
        <div class="container">
            <div class="row text-center g-4">
                <div class="col-md-4">
                    <i class="fas fa-calendar-check feature-icon"></i>
                    <h4>Réservation facile</h4>
                    <p class="text-muted">Réservez en quelques clics votre salle idéale</p>
                </div>
                <div class="col-md-4">
                    <i class="fas fa-shield-alt feature-icon"></i>
                    <h4>Paiement sécurisé</h4>
                    <p class="text-muted">Transactions 100% sécurisées et fiables</p>
                </div>
                <div class="col-md-4">
                    <i class="fas fa-headset feature-icon"></i>
                    <h4>Support 24/7</h4>
                    <p class="text-muted">Notre équipe à votre écoute à tout moment</p>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Salles Section -->
	<section id="salles" class="py-5">
	        <div class="container">
	            <div class="text-center mb-5">
	                <h2 class="fw-bold">Nos Salles de Fête</h2>
	                <p class="text-muted">Découvrez notre sélection de salles pour tous vos événements</p>
	            </div>
	            
	            <sec:authorize access="hasRole('ADMIN')">
	                <div class="text-end mb-4">
	                    <a href="${pageContext.request.contextPath}/salles/nouveau" class="btn btn-primary btn-lg shadow-sm" style="border-radius: 50px;">
	                        <i class="fas fa-plus-circle me-2"></i>Ajouter une nouvelle salle
	                    </a>
	                </div>
	            </sec:authorize>

	            <div class="row g-4">
	                <c:forEach items="${salles}" var="salle">
	                    <div class="col-md-4">
	                        <div class="card h-100 shadow-sm border-0 card-salle">
	                            <div class="position-relative">	                                
									<c:choose>
									   <c:when test="${not empty salle.imageUrl}">
									     <img src="${pageContext.request.contextPath}${salle.imageUrl}" class="card-img-top" alt="${salle.nom}" 
									       onerror="this.src=''">
									         </c:when>
									          <c:otherwise>
									           <img src="${pageContext.request.contextPath}/uploads/salles/default.jpg" 
									         class="card-img-top" alt="Image par défaut">
									     </c:otherwise>
									  </c:choose>
	                                <span class="badge m-3 ${salle.disponible ? 'bg-success' : 'bg-danger'}">
	                                    ${salle.disponible ? 'Disponible' : 'Indisponible'}
	                                </span>
	                                
	                                <span class="badge-capacity">
	                                    <i class="fas fa-users me-1"></i> ${salle.capacite} pers.
	                                </span>
	                            </div>
	                            
	                            <div class="card-body d-flex flex-column">
	                                <h5 class="card-title fw-bold text-uppercase">${salle.nom}</h5>
	                                <p class="card-text text-muted mb-2">
	                                    <i class="fas fa-map-marker-alt me-2 text-primary"></i>${salle.localisation}
	                                </p>
	                                
	                                <div class="mt-auto">
	                                    <sec:authorize access="hasRole('ADMIN')">
	                                        <div class="d-flex gap-2">
	                                            <a href="${pageContext.request.contextPath}/salles/edit/${salle.id}" class="btn btn-outline-primary flex-grow-1 fw-bold">
	                                                <i class="fas fa-edit"></i>
	                                            </a>
	                                            <a href="${pageContext.request.contextPath}/salles/delete/${salle.id}" 
	                                               class="btn btn-outline-danger flex-grow-1 fw-bold" 
	                                               onclick="return confirm('Supprimer cette salle ?')">
	                                                <i class="fas fa-trash"></i>
	                                            </a>
	                                        </div>
	                                    </sec:authorize>

	                                    <sec:authorize access="!hasRole('ADMIN')">
	                                        <c:choose>
	                                            <c:when test="${salle.disponible}">
	                                                <a href="${pageContext.request.contextPath}/reservations/nouveau?salleId=${salle.id}&nomSalle=${salle.nom}" class="btn btn-primary w-100 py-2 fw-bold">
	                                                    <i class="fas fa-calendar-check me-2"></i>RÉSERVER
	                                                </a>
	                                            </c:when>
	                                            <c:otherwise>
	                                                <button class="btn btn-secondary w-100 py-2 disabled" disabled>NON DISPONIBLE</button>
	                                            </c:otherwise>
	                                        </c:choose>
	                                    </sec:authorize>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </c:forEach>

	                <c:if test="${empty salles}">
	                    <div class="col-12 text-center">
	                        <p class="alert alert-info">Aucune salle n'est enregistrée dans la base de données.</p>
	                    </div>
	                </c:if>
	            </div>
	        </div>
	    </section>
    
    <!-- Footer -->
<%@ include file="fragments/footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
