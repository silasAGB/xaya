<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Utilisateurs - XAYA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
        }
        
        /* Header Premium identique à l'accueil */
        .admin-hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 0;
            border-radius: 0;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .table-container {
            margin-top: 30px; /* Chevauchement élégant sur le header */
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

        .badge-role {
            padding: 8px 16px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.75rem;
        }

        .btn-action {
            width: 38px;
            height: 38px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            transition: all 0.3s;
        }

        .btn-add {
            background: white;
            color: #764ba2;
            border: none;
            font-weight: 700;
            transition: all 0.3s;
        }

        .btn-add:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            background: #f8f9fa;
        }
    </style>
</head>
<body>
	<%@ include file="../fragments/navbar.jsp" %>

    <div class="admin-hero">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h1 class="display-5 fw-bold mb-2">
                        <i class="fas fa-users-gear me-3"></i>Utilisateurs
                    </h1>
                    <p class="lead mb-0 opacity-75">Administration des comptes de la plateforme XAYA</p>
                </div>
                <div class="d-flex gap-3">
                    <a href="${pageContext.request.contextPath}/utilisateurs/nouveau" class="btn btn-add btn-lg px-4 shadow-sm">
                        <i class="fas fa-plus-circle me-2"></i>Nouveau
                    </a>
                </div>
            </div>
        </div>
		
		<div class="container table-container">
		       <div class="card card-custom">
		           <div class="card-body p-0">
		               <div class="table-responsive">
		                   <table class="table table-hover mb-0">
		                       <thead>
		                           <tr>
		                               <th class="ps-4">Identifiant</th>
		                               <th>Nom Complet</th>
		                               <th>Email</th>
		                               <th>Rôle</th>
		                               <th class="text-end pe-4">Actions</th>
		                           </tr>
		                       </thead>
		                       <tbody>
		                           <c:forEach items="${utilisateurs}" var="u">
		                               <tr>
		                                   <td class="ps-4 text-muted">#${u.id}</td>
		                                   <td>
		                                       <div class="d-flex align-items-center">
		                                           <div class="avatar-sm me-3 bg-light rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
		                                               <i class="fas fa-user text-primary"></i>
		                                           </div>
		                                           <span class="fw-bold">${u.nom}</span>
		                                       </div>
		                                   </td>
		                                   <td>${u.email}</td>
		                                   <td>
		                                       <c:choose>
		                                           <c:when test="${u.role == 'ADMIN'}">
		                                               <span class="badge bg-success-subtle text-success badge-role">ADMINISTRATEUR</span>
		                                           </c:when>
		                                           <c:otherwise>
		                                               <span class="badge bg-primary-subtle text-primary badge-role">CLIENT</span>
		                                           </c:otherwise>
		                                       </c:choose>
		                                   </td>
		                                   <td class="text-end pe-4">
		                                       <a href="${pageContext.request.contextPath}/utilisateurs/edit/${u.id}" class="btn btn-action btn-outline-primary me-2" title="Modifier">
		                                           <i class="fas fa-pen"></i>
		                                       </a>
		                                       <a href="${pageContext.request.contextPath}/utilisateurs/delete/${u.id}" 
		                                          class="btn btn-action btn-outline-danger" 
		                                          title="Supprimer"
		                                          onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ?')">
		                                           <i class="fas fa-trash"></i>
		                                       </a>
		                                   </td>
		                               </tr>
		                           </c:forEach>
		                           <c:if test="${empty utilisateurs}">
		                               <tr>
		                                   <td colspan="5" class="text-center py-5 text-muted">
		                                       <i class="fas fa-user-slash fa-3x mb-3 d-block"></i>
		                                       Aucun utilisateur trouvé.
		                                   </td>
		                               </tr>
		                           </c:if>
		                       </tbody>
		                   </table>
		               </div>
		           </div>
		       </div>
		   </div>
    </div>

   
	<%@ include file="../fragments/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>