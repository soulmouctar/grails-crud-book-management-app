package BiblioApp

import grails.validation.ValidationException

class LivreController {

    LivreService livreService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond livreService.list(params), model:[livreCount: livreService.count()]
    }

    def show(Long id) {
        respond livreService.get(id)
    }

    def create() {
        respond new Livre(params)
    }

    def save(Livre livre) {
        if (livre == null) {
            notFound()
            return
        }

        try {
            livreService.save(livre)
        } catch (ValidationException e) {
            respond livre.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Livre ${livre.titre} créé avec succès."
                redirect livre
            }
            '*' { respond livre, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond livreService.get(id)
    }

    def update(Livre livre) {
        if (livre == null) {
            notFound()
            return
        }

        try {
            livreService.save(livre)
        } catch (ValidationException e) {
            respond livre.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Livre ${livre.titre} mis à jour avec succès."
                redirect livre
            }
            '*'{ respond livre, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        livreService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = "Livre supprimé avec succès."
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = "Livre non trouvé."
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}