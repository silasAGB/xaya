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
        
        /* 🆕 Zone de drag & drop */
        .upload-area {
            border: 2px dashed #667eea;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            background-color: #f8f9fa;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .upload-area:hover {
            background-color: #e9ecef;
            border-color: #764ba2;
        }
        
        .upload-area.dragover {
            background-color: #e7eeff;
            border-color: #667eea;
        }
        
        #imagePreview {
            border: 2px solid #dee2e6;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            background-color: #fff;
        }
        
        #previewImg {
            max-width: 100%;
            max-height: 300px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

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
                           method="post" modelAttribute="salle" enctype="multipart/form-data">
                    
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

                    <!-- 🆕 Upload d'image -->
                    <div class="mb-4">
                        <label class="form-label fw-bold">
                            <i class="fas fa-image me-2"></i>Image de la salle
                        </label>
                        
                        <!-- Zone de drag & drop -->
                        <div class="upload-area" id="uploadArea">
                            <i class="fas fa-cloud-upload-alt fa-3x text-primary mb-3"></i>
                            <p class="mb-2"><strong>Cliquez pour sélectionner</strong> ou glissez-déposez une image</p>
                            <small class="text-muted">JPG, PNG, GIF (Max 10 MB)</small>
                            <input type="file" id="imageFile" name="imageFile" 
                                   accept="image/*" style="display: none;">
                        </div>
                        
                        <!-- Affichage de l'image actuelle en mode édition -->
                        <c:if test="${not empty salle.imageUrl}">
                            <div class="mt-3 text-center">
                                <small class="text-muted d-block mb-2">Image actuelle :</small>
                                <img src="${salle.imageUrl}" alt="Image actuelle" 
                                     style="max-width: 200px; border-radius: 8px;">
                            </div>
                        </c:if>
                    </div>

                    <!-- 🆕 Aperçu de l'image -->
                    <div class="mb-4" id="imagePreview" style="display: none;">
                        <label class="form-label fw-bold mb-3">
                            <i class="fas fa-eye me-2"></i>Aperçu
                        </label>
                        <img id="previewImg" src="" alt="Aperçu de la salle" />
                        <div class="mt-2">
                            <span id="fileName" class="badge bg-info"></span>
                            <span id="fileSize" class="badge bg-secondary ms-2"></span>
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
<script>
    // 🆕 Gestion de l'upload d'image avec drag & drop
    const uploadArea = document.getElementById('uploadArea');
    const imageFile = document.getElementById('imageFile');
    const imagePreview = document.getElementById('imagePreview');
    const previewImg = document.getElementById('previewImg');
    const fileName = document.getElementById('fileName');
    const fileSize = document.getElementById('fileSize');

    // Clic sur la zone pour ouvrir le sélecteur
    uploadArea.addEventListener('click', () => {
        imageFile.click();
    });

    // Changement de fichier
    imageFile.addEventListener('change', (e) => {
        handleFile(e.target.files[0]);
    });

    // Drag & Drop
    uploadArea.addEventListener('dragover', (e) => {
        e.preventDefault();
        uploadArea.classList.add('dragover');
    });

    uploadArea.addEventListener('dragleave', () => {
        uploadArea.classList.remove('dragover');
    });

    uploadArea.addEventListener('drop', (e) => {
        e.preventDefault();
        uploadArea.classList.remove('dragover');
        
        const files = e.dataTransfer.files;
        if (files.length > 0) {
            imageFile.files = files;
            handleFile(files[0]);
        }
    });

    // Fonction pour gérer le fichier
    function handleFile(file) {
        if (!file) return;
        
        // Vérifier que c'est une image
        if (!file.type.startsWith('image/')) {
            alert('Veuillez sélectionner une image valide');
            return;
        }
        
        // Vérifier la taille (10 MB max)
        if (file.size > 10 * 1024 * 1024) {
            alert('L\'image ne doit pas dépasser 10 MB');
            return;
        }
        
        // Afficher l'aperçu
        const reader = new FileReader();
        reader.onload = (e) => {
            previewImg.src = e.target.result;
            imagePreview.style.display = 'block';
            fileName.textContent = file.name;
            fileSize.textContent = formatFileSize(file.size);
        };
        reader.readAsDataURL(file);
    }

    // Formater la taille du fichier
    function formatFileSize(bytes) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
    }
</script>
</body>
</html>