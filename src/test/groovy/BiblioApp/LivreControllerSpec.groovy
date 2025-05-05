package BiblioApp

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class LivreControllerSpec extends Specification implements ControllerUnitTest<LivreController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
