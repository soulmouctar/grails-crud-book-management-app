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
    <title>Modifier Livre</title>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Accueil</a></li>
        <li><g:link class="list" action="index">Liste des Livres</g:link></li>
        <li><g:link class="create" action="create">Créer un Livre</g:link></li>
    </ul>
</div>
<div id="edit-livre" class="content scaffold-edit" role="main">
    <h1>Modifier Livre</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${livre}">
        <ul class="errors" role="alert">
            <g:eachError bean="${livre}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${livre}" method="PUT">
        <g:hiddenField name="version" value="${livre?.version}" />
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <input class="save btn btn-primary" type="submit" value="Mettre à jour" />
        </fieldset>
    </g:form>
</div>
</body>
</html>