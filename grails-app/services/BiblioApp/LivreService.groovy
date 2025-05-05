package BiblioApp

//import groovy.transform.CompileStatic
//@CompileStatic

import grails.gorm.transactions.Transactional

@Transactional
class LivreService {

    Livre get(Serializable id) {
        return Livre.get(id)
    }

    List<Livre> list(Map args) {
        return Livre.list(args)
    }

    Long count() {
        return Livre.count()
    }

    void delete(Serializable id) {
        get(id)?.delete()
    }

    Livre save(Livre livre) {
        livre.save(flush: true)
    }
}