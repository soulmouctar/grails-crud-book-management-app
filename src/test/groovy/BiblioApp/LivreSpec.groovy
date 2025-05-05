package BiblioApp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class LivreSpec extends Specification implements DomainUnitTest<Livre> {

     void "test domain constraints"() {
        when:
        Livre domain = new Livre()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
