package BiblioApp

import grails.validation.ValidationException

class LivreController {

    LivreService livreService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond livreService.list(params), model: [livreCount: livreService.count()]
    }

    def show(Long id) {
        respond livreService.get(id)
    }

    def create() {
        respond new Livre(params)
    }

    def save() {
        try {
            def livre = livreService.createLivre(params)

            request.withFormat {
                form multipartForm {
                    flash.message = "Livre ${livre.titre} créé avec succès."
                    redirect livre
                }
                '*' { respond livre, [status: CREATED] }
            }
        } catch (ValidationException e) {
            respond e.errors, view: 'create'
        } catch (Exception e) {
            flash.message = "Erreur lors de la création du livre : ${e.message}"
            redirect action: "create"
        }
    }

    def edit(Long id) {
        respond livreService.get(id)
    }

    def update(Long id) {
        try {
            def livre = livreService.updateLivre(id, params)

            request.withFormat {
                form multipartForm {
                    flash.message = "Livre ${livre.titre} mis à jour avec succès."
                    redirect livre
                }
                '*' { respond livre, [status: OK] }
            }
        } catch (ValidationException e) {
            respond e.errors, view: 'edit'
        } catch (Exception e) {
            flash.message = "Erreur lors de la mise à jour : ${e.message}"
            redirect action: "edit", id: id
        }
    }

    def delete(Long id) {
        if (!id) {
            notFound()
            return
        }

        try {
            livreService.deleteLivre(id)

            request.withFormat {
                form multipartForm {
                    flash.message = "Livre supprimé avec succès."
                    redirect action: "index", method: "GET"
                }
                '*' { render status: NO_CONTENT }
            }
        } catch (Exception e) {
            flash.message = "Erreur lors de la suppression : ${e.message}"
            redirect action: "index"
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = "Livre non trouvé."
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
