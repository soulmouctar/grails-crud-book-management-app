<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

    <!-- Font Awesome & Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
    .card-custom {
        border-radius: 1rem;
        box-shadow: 0 0 15px rgba(0,0,0,0.05);
        padding: 2rem;
        background-color: #fff;
    }
    .card-header-custom {
        border-bottom: 2px solid #dee2e6;
        margin-bottom: 1rem;
    }
    .required-indicator {
        color: red;
        margin-left: 2px;
    }
    .section-divider {
        margin: 3rem 0 1rem;
        border-top: 2px dashed #ccc;
    }
    </style>
</head>
<body>
<div class="container my-5">

    <!-- Header + Navigation -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">
            <i class="fas fa-plus-circle me-2"></i>
            <g:message code="livre.create.title" default="Ajouter un nouveau livre"/>
        </h2>
        <div>
            <a class="btn btn-outline-secondary me-2" href="${createLink(uri: '/')}">
                <i class="fas fa-home"></i> <g:message code="default.home.label" default="Accueil"/>
            </a>
            <g:link class="btn btn-outline-primary" action="index">
                <i class="fas fa-list"></i> <g:message code="livre.list.label" default="Liste des Livres"/>
            </g:link>
        </div>
    </div>

<!-- Messages -->
    <g:if test="${flash.message}">
        <div class="alert alert-info"><i class="fas fa-info-circle me-1"></i> ${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="alert alert-danger"><i class="fas fa-exclamation-triangle me-1"></i> ${flash.error}</div>
    </g:if>
    <g:if test="${flash.success}">
        <div class="alert alert-success"><i class="fas fa-check-circle me-1"></i> ${flash.success}</div>
    </g:if>

    <g:hasErrors bean="${this.livre}">
        <div class="alert alert-danger">
            <h6 class="mb-2"><i class="fas fa-bug me-2"></i> <g:message code="form.error.header" default="Erreurs dans le formulaire :"/></h6>
            <ul class="mb-0 ps-3">
                <g:eachError bean="${this.livre}" var="error">
                    <li><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

<!-- Formulaire dans une carte -->
    <div class="card card-custom">
        <div class="card-header-custom">
            <h5 class="fw-semibold mb-0 text-primary">
                <i class="fas fa-book me-2"></i>
                <g:message code="livre.form.title" default="Informations sur le livre"/>
            </h5>
        </div>

        <g:form resource="${this.livre}" method="POST">
            <div class="row g-4">
                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.titre.label" default="Titre"/> <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="titre" value="${livre?.titre}" class="form-control" required />
                </div>

                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.auteur.label" default="Auteur"/> <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="auteur" value="${livre?.auteur}" class="form-control" required />
                </div>

                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.isbn.label" default="ISBN"/> <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="isbn" value="${livre?.isbn}" class="form-control" required />
                </div>

                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.annee.label" default="Année de publication"/> <span class="required-indicator">*</span>
                    </label>
                    <input type="number" name="anneePublication" value="${livre?.anneePublication}" min="0" max="2030" class="form-control" required />
                </div>

                <div class="col-md-6 form-group">
                    <label class="form-label form-group">
                        <g:message code="livre.genre.label" default="Genre"/>
                    </label>
                    <select name="genre" class="form-select form-control" required>
                        <option value="spring" ${livre?.genre == 'spring' ? 'selected' : ''}><g:message code="livre.genre.spring.label"/></option>
                        <option value="programming" ${livre?.genre == 'programming' ? 'selected' : ''}><g:message code="livre.genre.programming.label"/></option>
                        <option value="dramatique" ${livre?.genre == 'dramatique' ? 'selected' : ''}><g:message code="livre.genre.dramatique.label"/></option>
                        <option value="humouristique" ${livre?.genre == 'humouristique' ? 'selected' : ''}><g:message code="livre.genre.humouristique.label"/></option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><g:message code="livre.description.label" default="Description"/></label>
                    <textarea name="description" class="form-control" rows="2">${livre?.description}</textarea>
                </div>
            </div>

            <div class="d-flex justify-content-end mt-4">
                <button type="submit" class="btn btn-success me-2">
                    <i class="fas fa-check me-1"></i> <g:message code="default.button.save.label" default="Enregistrer"/>
                </button>
                <g:link class="btn btn-secondary" action="index">
                    <i class="fas fa-times me-1"></i> <g:message code="default.button.cancel.label" default="Annuler"/>
                </g:link>
            </div>
        </g:form>
    </div>

    <!-- Section Import XML -->
    <div class="section-divider"></div>
    <h4 class="fw-bold mb-3"><i class="fas fa-file-import me-2"></i> <g:message code="livre.xml.import.title" default="Importer depuis un fichier XML"/></h4>

    <g:form action="uploadXml" method="post" enctype="multipart/form-data">
        <div class="card card-custom">
            <div class="row g-4 align-items-end">
                <div class="col-md-5">
                    <label class="form-label"><g:message code="livre.xml.import.multiple.label" default="Plusieurs livres"/></label>
                    <input type="file" name="xmlFile" class="form-control" />
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-outline-primary w-100">
                        <i class="fas fa-upload"></i>
                    </button>
                </div>

                <div class="col-md-5">
                    <label class="form-label"><g:message code="livre.xml.import.single.label" default="Un seul livre"/></label>
                    <input type="file" name="xmlFile" class="form-control" />
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-outline-success w-100">
                        <i class="fas fa-upload"></i>
                    </button>
                </div>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>
