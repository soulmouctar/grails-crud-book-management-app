<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#edit-livre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="edit-livre" class="col-12 content scaffold-edit" role="main">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.livre}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.livre}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.livre}" method="PUT">
                        <g:hiddenField name="version" value="${this.livre?.version}" />
                        <fieldset class="form">
                            <div class="container form-group">
                                <div class="row"ss>
                                    <div class="form-group col-md-6">
                                        <label for="titre">Title<span class="required-indicator">*</span></label>
                                        <input type="text" class="form-control" name="titre" value="${livre?.titre}" required/>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="auteur">Author<span class="required-indicator">*</span></label>
                                        <input type="text" class="form-control" name="auteur" value="${livre?.auteur}" required/>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="isbn">ISBN<span class="required-indicator">*</span></label>
                                        <input type="text" class="form-control" name="isbn" value="${livre?.isbn}" required/>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="anneePublication">Year <span class="required-indicator">*</span></label>
                                        <input type="number" class="form-control" name="anneePublication"
                                               value="${livre?.anneePublication}"
                                               min="0" max="2030" required />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="genre">Type</label>
                                        <select class="form-control" name="genre">
                                            <option value="spring" ${livre?.genre == 'spring' ? 'selected' : ''}>Spring boot</option>
                                            <option value="programming" ${livre?.genre == 'programming' ? 'selected' : ''}>Programming</option>
                                            <option value="dramatique" ${livre?.genre == 'dramatique' ? 'selected' : ''}>Dramatique</option>
                                            <option value="humouristique" ${livre?.genre == 'humouristique' ? 'selected' : ''}>Humouristique</option>
                                        </select>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="description">Description</label>
                                        <textarea class="form-control" name="description" rows="1">${livre?.description}</textarea>
                                    </div>

                                </div>
                            </div>
                        </fieldset>
                        <fieldset class="buttons">
                            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
