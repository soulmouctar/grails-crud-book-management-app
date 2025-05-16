<div class="container form-group">
    <div class="row">
        <div class="form-group col-md-6">
            <label for="titre">
                <g:message code="livre.titre.label" default="Title"/><span class="required-indicator">*</span>
            </label>
            <input type="text" class="form-control" name="titre" value="${livre?.titre}" required/>
        </div>

        <div class="form-group col-md-6">
            <label for="auteur">
                <g:message code="livre.auteur.label" default="Author"/><span class="required-indicator">*</span>
            </label>
            <input type="text" class="form-control" name="auteur" value="${livre?.auteur}" required/>
        </div>

        <div class="form-group col-md-6">
            <label for="isbn">
                <g:message code="livre.isbn.label" default="ISBN"/><span class="required-indicator">*</span>
            </label>
            <input type="text" class="form-control" name="isbn" value="${livre?.isbn}" required/>
        </div>

        <div class="form-group col-md-6">
            <label for="anneePublication">
                <g:message code="livre.annee.label" default="Year"/><span class="required-indicator">*</span>
            </label>
            <input type="number" class="form-control" name="anneePublication"
                   value="${livre?.anneePublication}" min="0" max="2030" required/>
        </div>

        <div class="form-group col-md-6">
            <label for="genre">
                <g:message code="livre.genre.label" default="Genre"/>
            </label>
            <select class="form-control" name="genre">
                <option value="spring" ${livre?.genre == 'spring' ? 'selected' : ''}>
                    <g:message code="livre.genre.spring.label" default="Spring boot"/>
                </option>
                <option value="programming" ${livre?.genre == 'programming' ? 'selected' : ''}>
                    <g:message code="livre.genre.programming.label" default="Programming"/>
                </option>
                <option value="dramatique" ${livre?.genre == 'dramatique' ? 'selected' : ''}>
                    <g:message code="livre.genre.dramatique.label" default="Dramatic"/>
                </option>
                <option value="humouristique" ${livre?.genre == 'humouristique' ? 'selected' : ''}>
                    <g:message code="livre.genre.humouristique.label" default="Humorous"/>
                </option>
            </select>
        </div>

        <div class="form-group col-md-6">
            <label for="description">
                <g:message code="livre.description.label" default="Description"/>
            </label>
            <textarea class="form-control" name="description" rows="1">${livre?.description}</textarea>
        </div>
    </div>
</div>
