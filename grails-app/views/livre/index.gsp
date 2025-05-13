<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1><i class="fa fa-book"></i> <g:message code="default.list.label" args="[entityName]" /></h1>
        <g:link class="btn btn-success" action="create">
            <i class="fa fa-plus"></i> <g:message code="default.new.label" args="[entityName]" />
        </g:link>
    </div>

    <g:if test="${flash.message}">
        <div class="alert alert-info" role="alert">
            ${flash.message}
        </div>
    </g:if>

<!-- Table des livres -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-success">
            <tr>
                <th>ID</th>
                <th>Titre</th>
                <th>Auteur</th>
                <th>Genre</th>
                <th>Année</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${livreList}" var="livre">
                <tr>
                    <td>${livre.id}</td>
                    <td>${livre.titre}</td>
                    <td>${livre.auteur}</td>
                    <td>${livre.genre}</td>
                    <td>${livre.anneePublication}</td>
                    <td>
                        <g:link class="btn btn-sm btn-info me-1" action="show" id="${livre.id}">
                            <i class="fa fa-eye"></i>
                        </g:link>
                        <g:link class="btn btn-sm btn-primary me-1" action="edit" id="${livre.id}">
                            <i class="fa fa-edit"></i>
                        </g:link>
                        <g:form action="delete" method="DELETE" style="display:inline;">
                            <g:hiddenField name="id" value="${livre.id}"/>
                            <button class="btn btn-sm btn-danger" onclick="return confirm('Supprimer ce livre ?')">
                                <i class="fa fa-trash"></i>
                            </button>
                        </g:form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>


    </div>

<!-- Pagination -->
    <g:if test="${livreCount > params.int('max')}">
        <nav class="mt-4">
            <g:paginate total="${livreCount ?: 0}" class="pagination justify-content-center" />
        </nav>
    </g:if>
</div>
</body>
</html>
