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