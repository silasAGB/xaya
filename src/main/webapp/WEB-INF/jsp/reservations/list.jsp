<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Validation Réservations - XAYA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #f4f7f6; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .header-gradient {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white; padding: 60px 0; border-radius: 0;
        }
        .status-pill { padding: 5px 15px; border-radius: 50px; font-weight: 600; font-size: 0.8rem; }
        .pending { background: #fff3cd; color: #856404; }
        .confirmed { background: #d4edda; color: #155724; }
        .card-table { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); margin-top: 30px; }
    </style>
</head>
<body>
	<%@ include file="../fragments/navbar.jsp" %>
<div class="header-gradient text-center shadow">
    <div class="container">
        <h2 class="fw-bold"><i class="fas fa-tasks me-2"></i>Gestion des Réservations</h2>
        <p class="opacity-75">Validez les demandes des clients en un clic</p>
    </div>
	
	<div class="container">
	    <div class="card card-table">
	        <div class="card-body p-0">
	            <table class="table table-hover align-middle mb-0">
	                <thead class="table-light">
	                    <tr>
	                        <th class="ps-4">Client</th>
	                        <th>Salle</th>
	                        <th>Date Événement</th>
	                        <th>Statut</th>
	                        <th class="text-center">Action Admin</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach items="${reservations}" var="res">
	                        <tr>
	                            <td class="ps-4">
	                                <div class="fw-bold">${res.utilisateur.nom}</div>
	                                <div class="small text-muted">${res.utilisateur.email}</div>
	                            </td>
	                            <td><span class="badge bg-light text-primary border">${res.salle.nom}</span></td>
	                            <td><i class="far fa-calendar-alt me-2 text-muted"></i>${res.dateEvenement}</td>
	                            <td>
	                                <c:choose>
	                                    <c:when test="${res.valide}">
	                                        <span class="status-pill confirmed"><i class="fas fa-check-circle me-1"></i>Confirmée</span>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <span class="status-pill pending"><i class="fas fa-clock me-1"></i>En attente</span>
	                                    </c:otherwise>
	                                </c:choose>
	                            </td>
	                            <td class="text-center">
	                                <c:if test="${!res.valide}">
	                                    <form action="${pageContext.request.contextPath}/reservations/valider/${res.id}" method="post">
	                                        <button type="submit" class="btn btn-success btn-sm rounded-pill px-3 shadow-sm">
	                                            <i class="fas fa-check me-1"></i> Valider la réservation
	                                        </button>
	                                    </form>
	                                </c:if>
	                                <c:if test="${res.valide}">
	                                    <button class="btn btn-light btn-sm rounded-pill px-3 disabled">Déjà traitée</button>
	                                </c:if>
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
</div>


<%@ include file="../fragments/footer.jsp" %>
</body>
</html>