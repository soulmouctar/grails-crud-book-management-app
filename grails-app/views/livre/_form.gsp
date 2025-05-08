<!-- _form.gsp - Partiel de formulaire réutilisable -->
<!-- Ce fichier doit être placé dans grails-app/views/livre/_form.gsp -->
<div class="form-group">
    <label for="titre">Title<span class="required-indicator">*</span></label>
    <input type="text" class="form-control" name="titre" value="${livre?.titre}" required/>
</div>

<div class="form-group">
    <label for="auteur">Author<span class="required-indicator">*</span></label>
    <input type="text" class="form-control" name="auteur" value="${livre?.auteur}" required/>
</div>

<div class="form-group">
    <label for="isbn">ISBN<span class="required-indicator">*</span></label>
    <input type="text" class="form-control" name="isbn" value="${livre?.isbn}" required/>
</div>

<div class="form-group">
    <label for="anneePublication">Year<span class="required-indicator">*</span></label>
    <input type="number" class="form-control" name="anneePublication" value="${livre?.anneePublication}" min="1000" max="2030" required/>
</div>

<div class="form-group">
    <label for="genre">Type</label>
    <input type="text" class="form-control" name="genre" value="${livre?.genre}"/>
</div>

<div class="form-group">
    <label for="description">Description</label>
    <textarea class="form-control" name="description" rows="5">${livre?.description}</textarea>
</div>