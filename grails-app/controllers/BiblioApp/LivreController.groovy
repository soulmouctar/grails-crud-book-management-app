package BiblioApp

import grails.validation.ValidationException
import groovy.xml.MarkupBuilder

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


    def exportCsv() {
        response.contentType = 'text/csv'
        response.setHeader('Content-Disposition', 'attachment; filename="books.csv"')

        def writer = new PrintWriter(response.outputStream)
        writer.println("ID,Title,Author,ISBN,PublishedDate,Description,Genre")

        Livre.list().each { livre ->
            writer.println("${livre.id},\"${livre.titre}\",\"${livre.auteur}\",${livre.isbn},${livre.anneePublication},\"${livre.description}\",\"${livre.genre}\"")
        }

        writer.flush()
        writer.close()
    }

    def exportXml() {
        response.contentType = 'application/xml'
        response.setHeader('Content-Disposition', 'attachment; filename="books.xml"')

        def writer = new PrintWriter(response.outputStream)
        writer.println '<?xml version="1.0" encoding="UTF-8"?>'
        writer.println '<books>'

        Livre.list().each { book ->
            writer.println "  <book>"
            writer.println "    <id>${book.id}</id>"
            writer.println "    <title>${book.titre.encodeAsXML()}</title>"
            writer.println "    <author>${book.auteur.encodeAsXML()}</author>"
            writer.println "    <isbn>${book.isbn.encodeAsXML()}</isbn>"
            writer.println "    <publishedDate>${book.anneePublication}</publishedDate>"
            writer.println "    <description>${book.description}</descrption>"
            writer.println "    <genre>${book.genre}</genre>"
            writer.println "  </book>"
        }

        writer.println '</books>'
        writer.flush()
        writer.close()
    }

    def exportXml2() {
        response.contentType = 'application/xml'
        response.setHeader('Content-Disposition', 'attachment; filename="books.xml"')

        def writer = new PrintWriter(response.outputStream)
        def xml = new MarkupBuilder(writer)
        xml.books {
            Livre.list().each { book ->
                book {
                    id(book.id)
                    title(book.titre)
                    author(book.auteur)
                    publishedDate(book.anneePublication)
                }
            }
        }

        writer.flush()
        writer.close()
    }

    // Action pour exporter un seul livre en XML
    def exporterXML(Long id) {
        def livre = Livre.get(id)
        if (!livre) {
            flash.message = "Livre non trouvé avec l'ID: ${id}"
            redirect(action: "index")
            return
        }

        String xmlContent = exportService.exporterLivreXML(livre)

        response.setContentType("application/xml")
        response.setHeader("Content-disposition", "attachment; filename=livre_${id}.xml")
        response.outputStream << xmlContent
        response.outputStream.flush()
    }

}
