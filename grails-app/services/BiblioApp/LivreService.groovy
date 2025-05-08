package BiblioApp

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException
import groovy.xml.MarkupBuilder


@Transactional
class LivreService {

    def list(Map params) {
        Livre.list(params)
    }

    def count() {
        Livre.count()
    }

    Livre get(Long id) {
        Livre.get(id)
    }

    @Transactional
    Livre createLivre(Map params) {
        def livre = new Livre(params)
        if (!livre.save(flush: true)) {
            throw new ValidationException("Erreur de validation lors de la création.", livre.errors)
        }
        return livre
    }

    @Transactional
    Livre updateLivre(Long id, Map params) {
        def livre = Livre.get(id)
        if (!livre) {
            throw new IllegalArgumentException("Livre non trouvé pour l'ID : $id")
        }

        livre.properties = params
        if (!livre.save(flush: true)) {
            throw new ValidationException("Erreur de validation lors de la mise à jour.", livre.errors)
        }
        return livre
    }

    @Transactional
    void deleteLivre(Long id) {
        def livre = Livre.get(id)
        if (!livre) {
            throw new IllegalArgumentException("Livre non trouvé pour l'ID : $id")
        }
        livre.delete(flush: true)
    }


    /**
     * Exporte un livre au format XML
     * @param livre Le livre à exporter
     * @return String contenant le XML
     */
    String exporterLivreXML(Livre livre) {
        def writer = new StringWriter()
        def xml = new MarkupBuilder(writer)

        xml.livre(id: livre.id) {
            titre(livre.titre)
            auteur(livre.auteur)
            if (livre.isbn) isbn(livre.isbn)
            if (livre.anneePublication) anneePublication(livre.anneePublication)
            if (livre.genre) genre(livre.genre)
            if (livre.description) description(livre.description)
        }

        return writer.toString()
    }
}
