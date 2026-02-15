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
		.table-container {
		    margin-top: 30px;
		}

		.card-custom {
		    border: none;
		    border-radius: 20px;
		    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
		    overflow: hidden;
		}

		.table thead {
		    background-color: #f1f4f9;
		    text-transform: uppercase;
		    font-size: 0.85rem;
		    letter-spacing: 1px;
		}

		.table thead th {
		    padding: 20px;
		    border: none;
		    color: #555;
		}

		.table tbody td {
		    padding: 20px;
		    vertical-align: middle;
		    border-color: #f1f4f9;
		}
        .status-pill { padding: 5px 15px; border-radius: 50px; font-weight: 600; font-size: 0.8rem; }
        .pending { background: #fff3cd; color: #856404; }
        .confirmed { background: #d4edda; color: #155724; }
        .card-table { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); margin-top: 30px; }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file="../fragments/navbar.jsp" %>
<div class="header-gradient text-center shadow flex-grow-1">
    <div class="container">
        <h2 class="fw-bold"><i class="fas fa-tasks me-2"></i>Gestion des Réservations</h2>
        <p class="opacity-75">Validez les demandes des clients en un clic</p>
    </div>
	
	<div class="container table-container">
	    <div class="card card-custom">
	        <div class="card-body p-0">
				<div class="table-responsive">
					                   <table class="table table-hover mb-0">
	                <thead class="table-light">
						<tr>
						                            <th>Client</th>
						                            <th>Salle</th>
						                            <th>Date</th>
						                            <th>Horaires</th>
						                            <th>Statut</th>
						                            <th>Actions</th>
						</tr>
	                </thead>
	              <tbody>
                        <c:forEach items="${reservations}" var="res">
                            <tr>
                                <td>
                                    <strong>${res.utilisateur.nom}</strong><br>
                                    <small class="text-muted">${res.utilisateur.email}</small>
                                </td>
                                <td>${res.salle.nom}</td>
                                <td>${res.dateReservation}</td>
                                <td>
                                    <span class="badge bg-info">
                                        ${res.heureDebut} - ${res.heureFin}
                                    </span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${res.statut == 'VALIDEE'}">
                                            <span class="badge bg-success">
                                                <i class="fas fa-check-circle"></i> Validée
                                            </span>
                                        </c:when>
                                        <c:when test="${res.statut == 'REJETEE'}">
                                            <span class="badge bg-danger">
                                                <i class="fas fa-times-circle"></i> Rejetée
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-warning">
                                                <i class="fas fa-clock"></i> En attente
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${res.statut == 'EN_ATTENTE'}">
                                        <form action="${pageContext.request.contextPath}/reservations/valider/${res.id}" 
                                              method="post" style="display:inline;">
                                            <button type="submit" class="btn btn-sm btn-success">
                                                <i class="fas fa-check"></i> Valider
                                            </button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/reservations/rejeter/${res.id}" 
                                              method="post" style="display:inline;">
                                            <button type="submit" class="btn btn-sm btn-danger">
                                                <i class="fas fa-times"></i> Rejeter
                                            </button>
                                        </form>
                                    </c:if>
                                    <c:if test="${res.statut != 'EN_ATTENTE'}">
                                        <span class="text-muted">Traité</span>
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
</div>


<%@ include file="../fragments/footer.jsp" %>
</body>
</html>