package livreapp

import groovy.xml.MarkupBuilder

class XmlExportService {

    def xmlExportOneBook(long id) {
        def livre = Livre.get(id)
        if (!livre) {
            return '<?xml version="1.0" encoding="UTF-8"?><error>Livre not found</error>'
        }

        def writer = new StringWriter()
        def xml = new MarkupBuilder(writer)
        xml.livre {
            "${'titre'}"(livre.titre)
            "${'auteur'}"(livre.auteur)
            "${'isbn'}"(livre.isbn)
            "${'anneePublication'}"(livre.anneePublication)
            "${'description'}"(livre.description)
        }

        return '<?xml version="1.0" encoding="UTF-8"?>\n' + writer.toString()
    }
}
