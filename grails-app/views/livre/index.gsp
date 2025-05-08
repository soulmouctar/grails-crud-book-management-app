<%--
  Created by IntelliJ IDEA.
  User: soulmouctar
  Date: 05/05/2025
  Time: 11:45
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Liste des Livres</title>
    <style>
    .livre-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .livre-table th, .livre-table td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    .livre-table th {
        background-color: #f2f2f2;
    }
    .livre-table tr:hover {
        background-color: #f5f5f5;
    }
    .action-buttons .btn {
        margin-right: 5px;
    }
    </style>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="create" action="create">Créer un Livre</g:link></li>
    </ul>
</div>

<div id="list-livre" class="content scaffold-list" role="main" class="container">
    <div class="row">
        <div class="col-md-4">
            <h1>Liste des Livres</h1>
        </div>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="col-md-4 search-box mb-3">
            <g:form action="search" method="GET" class="form-inline">
                <div class="input-group">
                    <input type="text" name="q" value="${params.q}" class="form-control" placeholder="Search By title, author..." />
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </g:form>
        </div>
        <div class="col-md-4 action-buttons">
            <a class="btn btn-primary" href="${createLink(controller: 'livre', action: 'exportCsv')}">
                Export as CSV
            </a>
            <a class="btn btn-secondary" href="${createLink(uri: '/books/exportXml')}">
                Export as XML
            </a>
        </div>
    </div>

</div>

    <table class="livre-table">
        <thead>
        <tr>
            <th>Titre</th>
            <th>Auteur</th>
            <th>ISBN</th>
            <th>Année</th>
            <th>Genre</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${livreList}" var="livre">
            <tr>
                <td>${livre.titre}</td>
                <td>${livre.auteur}</td>
                <td>${livre.isbn}</td>
                <td>${livre.anneePublication}</td>
                <td>${livre.genre}</td>
                <td class="action-buttons">
                    <g:link action="show" id="${livre.id}" class="btn btn-sm btn-info">Voir</g:link>
                    <g:link action="edit" id="${livre.id}" class="btn btn-sm btn-warning">Modifier</g:link>
                    <g:form action="delete" id="${livre.id}" method="DELETE" style="display:inline;">
                        <input type="submit" class="btn btn-sm btn-danger" value="Supprimer" onclick="return confirm('Êtes-vous sûr?')" />
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${livreCount ?: 0}" />
    </div>
</div>
</body>
</html>