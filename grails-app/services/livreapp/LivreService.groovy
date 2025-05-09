package livreapp

import grails.gorm.services.Service

@Service(Livre)
interface LivreService {

    Livre get(Serializable id)

    List<Livre> list(Map args)

    Long count()

    void delete(Serializable id)

    Livre save(Livre livre)


}