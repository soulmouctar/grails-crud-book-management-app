<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div id="content" role="main">
    <div class="container py-4 card card-container mb-5">

        <!-- Navigation -->
        <nav class="mb-4">
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <a class="nav-link" href="${createLink(uri: '/')}">
                        <i class="fas fa-home"></i> <g:message code="default.home.label"/>
                    </a>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" action="index">
                        <i class="fas fa-list"></i> <g:message code="default.list.label" args="[entityName]"/>
                    </g:link>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" action="create">
                        <i class="fas fa-plus-circle"></i> <g:message code="default.new.label" args="[entityName]"/>
                    </g:link>
                </li>
            </ul>
        </nav>

        <!-- Header -->
        <div class="text-center mb-4">
            <h2><i class="fas fa-book-open text-primary"></i> <g:message code="default.show.label" args="[entityName]"/></h2>
        </div>

    <!-- Flash Message -->
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">
                ${flash.message}
            </div>
        </g:if>

    <!-- Book Details Card -->
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h5 class="card-title text-primary mb-3"><i class="fas fa-info-circle"></i> <g:message code="livre.details.label" default="Book Details"/></h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <strong><g:message code="livre.titre.label" default="Title"/> :</strong> ${livre?.titre}
                    </li>
                    <li class="list-group-item">
                        <strong><g:message code="livre.auteur.label" default="Author"/> :</strong> ${livre?.auteur}
                    </li>
                    <li class="list-group-item">
                        <strong><g:message code="livre.isbn.label" default="ISBN"/> :</strong> ${livre?.isbn}
                    </li>
                    <li class="list-group-item">
                        <strong><g:message code="livre.anneePublication.label" default="Year of Publication"/> :</strong> ${livre?.anneePublication}
                    </li>
                    <li class="list-group-item">
                        <strong><g:message code="livre.genre.label" default="Genre"/> :</strong> ${livre?.genre}
                    </li>
                    <li class="list-group-item">
                        <strong><g:message code="livre.description.label" default="Description"/> :</strong><br/>
                        <span class="text-muted">${livre?.description ?: message(code: 'livre.description.empty.label', default: 'Not provided')}</span>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="mt-4 d-flex justify-content-between">
            <g:link class="btn btn-outline-primary" action="edit" resource="${this.livre}">
                <i class="fas fa-edit"></i> <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>

            <g:form resource="${this.livre}" method="DELETE"
                    onsubmit="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                <div class="d-flex gap-2">
                    <input class="btn btn-danger" type="submit"
                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"/>
                    <g:link class="btn btn-outline-secondary ml-2"
                            controller="livre"
                            action="exportXmlOneBook"
                            id="${livre?.id}">
                        <i class="fas fa-file-code"></i> <g:message code="livre.export.xml.label" default="Export XML"/>
                    </g:link>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
