package BiblioApp

import grails.testing.gorm.DomainUnitTest
import grails.testing.web.controllers.ControllerUnitTest
import grails.validation.ValidationException
import spock.lang.Specification

class LivreControllerSpec extends Specification implements ControllerUnitTest<LivreController>, DomainUnitTest<Livre> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200
     }

    def setup() {
    }

    def cleanup() {
    }

    void "test createLivre - succès"() {
        when:
        def params = [titre: "Le Petit Prince", auteur: "Antoine de Saint-Exupéry"]
        def livre = service.createLivre(params)

        then:
        livre.id != null
        livre.titre == "Le Petit Prince"
        Livre.count() == 1
    }

    void "test createLivre - validation échoue"() {
        when:
        def params = [:] // Pas de titre, erreur attendue
        service.createLivre(params)

        then:
        ValidationException e = thrown()
        e.errors.hasFieldErrors("titre")
    }

    void "test updateLivre - succès"() {
        given:
        def livre = new Livre(titre: "Ancien Titre", auteur: "Auteur").save(flush: true)

        when:
        def updatedLivre = service.updateLivre(livre.id, [titre: "Nouveau Titre"])

        then:
        updatedLivre.titre == "Nouveau Titre"
        Livre.count() == 1
    }

    void "test updateLivre - id inexistant"() {
        when:
        service.updateLivre(9999L, [titre: "Test"])

        then:
        IllegalArgumentException e = thrown()
        e.message.contains("Livre non trouvé")
    }

    void "test updateLivre - validation échoue"() {
        given:
        def livre = new Livre(titre: "Test", auteur: "Auteur").save(flush: true)

        when:
        service.updateLivre(livre.id, [titre: ""]) // Supposons que le titre soit requis

        then:
        ValidationException e = thrown()
        e.errors.hasFieldErrors("titre")
    }

    void "test deleteLivre - succès"() {
        given:
        def livre = new Livre(titre: "À supprimer", auteur: "Auteur").save(flush: true)

        when:
        service.deleteLivre(livre.id)

        then:
        Livre.count() == 0
    }

    void "test deleteLivre - id inexistant"() {
        when:
        service.deleteLivre(9999L)

        then:
        IllegalArgumentException e = thrown()
        e.message.contains("Livre non trouvé")
    }
}
