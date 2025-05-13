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
                        results.errors << "Impossible d'enregistrer le livre '${nouveauLivre.titre}': ${nouveauLivre.errors}"
                    }
                } catch (Exception e) {
                    results.errors << "Erreur lors du traitement d'un livre: ${e.message}"
                }
            }
        } catch (Exception e) {
            results.errors << "Erreur lors de l'analyse du XML: ${e.message}"
        }

        return results
    }


    def importerUnLivreDepuisXml(String xmlContent) {
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
                        results.errors << "Impossible d'enregistrer le livre '${nouveauLivre.titre}': ${nouveauLivre.errors}"
                    }
                } catch (Exception e) {
                    results.errors << "Erreur lors du traitement d'un livre: ${e.message}"
                }
            }
        } catch (Exception e) {
            results.errors << "Erreur lors de l'analyse du XML: ${e.message}"
        }

        return results
    }
}
