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
    <meta name="layout" content="main"/>
    <title>Détails du Livre</title>
    <style>
    .property-list {
        margin-top: 20px;
    }
    .property-label {
        font-weight: bold;
    }
    .property-value {
        margin-bottom: 15px;
    }
    </style>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="list" action="index">List of the Book</g:link></li>
        <li><g:link class="create" action="create">create book</g:link></li>
    </ul>
</div>
<div id="show-livre" class="content scaffold-show" role="main">
    <h1>Details of the book</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="property-list livre">
        <div class="row">
            <div class="col-md-2 property-label">Title:</div>
            <div class="col-md-10 property-value">${livre.titre}</div>
        </div>

        <div class="row">
            <div class="col-md-2 property-label">Author:</div>
            <div class="col-md-10 property-value">${livre.auteur}</div>
        </div>

        <div class="row">
            <div class="col-md-2 property-label">ISBN:</div>
            <div class="col-md-10 property-value">${livre.isbn}</div>
        </div>

        <div class="row">
            <div class="col-md-2 property-label">Year Published :</div>
            <div class="col-md-10 property-value">${livre.anneePublication}</div>
        </div>

        <div class="row">
            <div class="col-md-2 property-label">Type:</div>
            <div class="col-md-10 property-value">${livre.genre}</div>
        </div>

        <div class="row">
            <div class="col-md-2 property-label">Description:</div>
            <div class="col-md-10 property-value">${livre.description}</div>
        </div>
    </div>

    <g:form resource="${livre}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit btn btn-warning" action="edit" resource="${livre}">Modifier</g:link>
            <input class="delete btn btn-danger" type="submit" value="Supprimer" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Êtes-vous sûr?')}');" />
            <a class="download btn-primary" href="${createLink(uri: "/livre/${livre.id}/exportXmlOneBook")}">
                Export as XML
            </a>
        </fieldset>
    </g:form>
</div>
</body>
</html>