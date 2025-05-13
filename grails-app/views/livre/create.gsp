<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'livre.label', default: 'Livre')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#create-livre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="create-livre" class="col-12 content scaffold-create" role="main">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
                    <g:form resource="${this.livre}" method="POST">
                        <%-- <fieldset class="form">
                                <f:all bean="livre"/>
                            </fieldset>
                        --%>
                        <fieldset class="form">
                            <g:render template="form"/>
                        </fieldset>

                        <fieldset class="buttons">
                            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            <g:link class="cancel" action="index">
                                <g:message code="default.button.cancel.label" default="Cancel"/>
                            </g:link>

                        </fieldset>

                    </g:form>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <h1>Import many books from XML File</h1>
                            </div>
                            <div class="col-md-6">
                                <h2>Import one book from XML File</h2>
                            </div>
                        </div>

                        <g:if test="${flash.message}">
                            <div class="alert alert-warning">${flash.message}</div>
                        </g:if>
                        <g:if test="${flash.error}">
                            <div class="alert alert-danger">${flash.error}</div>
                        </g:if>
                        <g:if test="${flash.success}">
                            <div class="alert alert-success">${flash.success}</div>
                        </g:if>

                        <div class="panel panel-default">
                            <div class="panel-body">
                                <g:form action="uploadXml" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">

                                                <input type="file" name="xmlFile" id="xmlFile" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-secondary">Importer</button>
                                            </div>
                                        </div>
                                        <!-- import one Book -->
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="file" name="xmlFile" id="xmlFile" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-success">Importer</button>
                                            </div>
                                        </div>
                                    </div>
                                </g:form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>
    </div>

</body>
</html>
