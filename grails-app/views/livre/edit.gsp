<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>

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
    </style>
</head>
<body>
<div class="container my-5">

    <!-- Header + Navigation -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">
            <i class="fas fa-pen-to-square me-2"></i>
            <g:message code="default.edit.label" args="[entityName]" />
        </h2>
        <div>
            <a class="btn btn-outline-secondary me-2" href="${createLink(uri: '/')}">
                <i class="fas fa-home"></i> <g:message code="default.home.label" />
            </a>
            <g:link class="btn btn-outline-primary me-2" action="index">
                <i class="fas fa-list"></i> <g:message code="default.list.label" args="[entityName]" />
            </g:link>
            <g:link class="btn btn-outline-success" action="create">
                <i class="fas fa-plus"></i> <g:message code="default.new.label" args="[entityName]" />
            </g:link>
        </div>
    </div>

<!-- Messages -->
    <g:if test="${flash.message}">
        <div class="alert alert-info"><i class="fas fa-info-circle me-1"></i> ${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${this.livre}">
        <div class="alert alert-danger">
            <h6 class="mb-2"><i class="fas fa-bug me-2"></i> <g:message code="default.errors.label" default="Form Errors:"/></h6>
            <ul class="mb-0 ps-3">
                <g:eachError bean="${this.livre}" var="error">
                    <li><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

<!-- Formulaire -->
    <div class="card card-custom">
        <div class="card-header-custom">
            <h5 class="fw-semibold mb-0 text-primary">
                <i class="fas fa-book me-2"></i> <g:message code="default.edit.label" args="[entityName]" />
            </h5>
        </div>

        <g:form resource="${this.livre}" method="PUT">
            <g:hiddenField name="version" value="${this.livre?.version}" />
            <div class="row g-4">
                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.titre.label" default="Titre" /> <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="titre" value="${livre?.titre}" class="form-control" required />
                </div>

                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.auteur.label" default="Auteur" /> <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="auteur" value="${livre?.auteur}" class="form-control" required />
                </div>

                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.isbn.label" default="ISBN" /> <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="isbn" value="${livre?.isbn}" class="form-control" required />
                </div>

                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.anneePublication.label" default="Année de publication" /> <span class="required-indicator">*</span>
                    </label>
                    <input type="number" name="anneePublication" value="${livre?.anneePublication}" min="0" max="2030" class="form-control" required />
                </div>

                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.genre.label" default="Genre" />
                    </label>
                    <select name="genre" class="form-select form-control" required>
                        <option value="spring" ${livre?.genre == 'spring' ? 'selected' : ''}><g:message code="livre.genre.spring.label" default="Spring Boot"/></option>
                        <option value="programming" ${livre?.genre == 'programming' ? 'selected' : ''}><g:message code="livre.genre.programming.label" default="Programmation"/></option>
                        <option value="dramatique" ${livre?.genre == 'dramatique' ? 'selected' : ''}><g:message code="livre.genre.dramatique.label" default="Dramatique"/></option>
                        <option value="humouristique" ${livre?.genre == 'humouristique' ? 'selected' : ''}><g:message code="livre.genre.humouristique.label" default="Humouristique"/></option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label">
                        <g:message code="livre.description.label" default="Description" />
                    </label>
                    <textarea name="description" class="form-control" rows="2">${livre?.description}</textarea>
                </div>
            </div>

            <div class="d-flex justify-content-end mt-4">
                <button type="submit" class="btn btn-success me-2">
                    <i class="fas fa-check me-1"></i> <g:message code="default.button.edit.label" default="Mettre à jour" />
                </button>

                <g:link class="btn btn-secondary ml-3" action="index">
                    <i class="fas fa-times me-1"></i> <g:message code="default.button.cancel.label" default="Annuler" />
                </g:link>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
