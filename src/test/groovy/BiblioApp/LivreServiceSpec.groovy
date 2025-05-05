package BiblioApp

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class LivreServiceSpec extends Specification implements ServiceUnitTest<LivreService> {

     void "test something"() {
        expect:
        service.doSomething()
     }
}
