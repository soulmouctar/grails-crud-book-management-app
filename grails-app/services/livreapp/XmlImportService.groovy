package livreapp

import grails.gorm.transactions.Transactional

@Transactional
class XmlImportService {

    def importerLivresDepuisXml(String xmlContent) {
        def results = [
                success: 0,
                errors: []
        ]

        try {
            def livres = new XmlSlurper().parseText(xmlContent)

            livres.livre.each { livre ->
                try {
                    def nouveauLivre = new Livre(
                            titre: livre.titre.text(),
                            auteur: livre.auteur.text(),
                            isbn: livre.isbn.text(),
                            anneePublication: livre.anneePublication.text() ? livre.anneePublication.text().toInteger() : null,
                            genre: livre.genre.text(),
                            description: livre.description.text()
                    )

                    if (nouveauLivre.validate() && nouveauLivre.save()) {
                        results.success++
                    } else {
                        results.errors << "Unable to save the book. '${nouveauLivre.titre}': ${nouveauLivre.errors}"
                    }
                } catch (Exception e) {
                    results.errors << "Error while processing the book: ${e.message}"
                }
            }
        } catch (Exception e) {
            results.errors << "Error while analysing XML: ${e.message}"
        }

        return results
    }

}
