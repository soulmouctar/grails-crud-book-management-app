package livreapp

import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.*

class LivreController {

    LivreService livreService
    XmlExportService xmlExportService
    XmlImportService xmlImportService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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
                flash.message = message(code: 'default.created.message', args: [message(code: 'livre.label', default: 'Livre'), livre.id])
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'livre.label', default: 'Livre'), livre.id])
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'livre.label', default: 'Livre'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'livre.label', default: 'Livre'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    // Action pour exporter un seul livre en XML
    def exportXmlOneBook(Long id) {
        def xmlContent = xmlExportService.xmlExportOneBook(id)
        response.contentType = 'application/xml'
        response.setHeader("Content-disposition", "attachment; filename=livre_${id}.xml")
        render  text: xmlContent, contentType: 'application/xml', encoding: 'UTF-8'

    }

    def uploadXml() {
        MultipartFile f = request.getFile('xmlFile')

        if (f.empty) {
            flash.message = "Veuillez sélectionner un fichier XML à importer"
            redirect(action: "index")
            return
        }

        if (!f.contentType.contains("xml")) {
            flash.message = "Le fichier doit être au format XML"
            redirect(action: "index")
            return
        }

        String xmlContent = f.inputStream.text
        def results = xmlImportService.importerLivresDepuisXml(xmlContent)

        flash.success = "${results.success} livres ont été importés avec succès"

        if (results.errors) {
            flash.error = "Des erreurs sont survenues lors de l'importation: ${results.errors.join('; ')}"
        }

        redirect(action: "index")
    }
}
