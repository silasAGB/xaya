<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="/">
                <i class="fas fa-champagne-glasses me-2"></i>
                XAYA
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <!-- Menu pour utilisateurs non connectés -->
                    <sec:authorize access="!isAuthenticated()">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Salles</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/connexion">Se connecter</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-primary text-white px-3" href="/inscription">S'inscrire</a>
                        </li>
                    </sec:authorize>
                    
                    <!-- Menu pour clients connectés -->
                    <sec:authorize access="isAuthenticated() and !hasRole('ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Salles</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/reservations/mesReservations">Mes réservations</a>
                        </li>
						<li class="nav-item dropdown">
						                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
						                                <i class="fas fa-user-circle"></i>
						                                <sec:authentication property="principal.username"/>
						                            </a>
						                            <ul class="dropdown-menu">
						                                <li><hr class="dropdown-divider"></li>
						                                <li>
						                                    <form action="/logout" method="post" style="display:inline;">
						                                        <button type="submit" class="dropdown-item">
						                                            <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
						                                        </button>
						                                    </form>
						                                </li>
						                            </ul>
						                        </li>
                    </sec:authorize>
                    
                    <!-- Menu pour administrateurs -->
                    <sec:authorize access="hasRole('ADMIN')">
                        <li class="nav-item">
                            <a class="nav-link" href="/utilisateurs/list">Utilisateurs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/reservations/list">Réservations</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user-shield"></i>
                                Admin
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <form action="/logout" method="post" style="display:inline;">
                                        <button type="submit" class="dropdown-item">
                                            <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
    </nav>