package BiblioApp

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

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
}
