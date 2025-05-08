package BiblioApp

class UrlMappings {
    static mappings = {
        "/books/export"(controller: 'livre', action: 'exportCsv')
        "/books/exportXml"(controller: 'livre', action: 'exportXml2')
        //export one domain class
        "/book/$id/exportXmlOneBook"(controller: 'livre', action: 'exportXmlOneBook')
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
