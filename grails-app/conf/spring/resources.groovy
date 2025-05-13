// Place your Spring DSL code here

import org.springframework.web.servlet.i18n.SessionLocaleResolver
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor

beans = {
    // Définir la langue par défaut
    localeResolver(SessionLocaleResolver) {
        defaultLocale = new Locale("fr")
    }

    // Intercepteur pour permettre le changement de langue via un paramètre ?lang=
    localeChangeInterceptor(LocaleChangeInterceptor) {
        paramName = "lang"
    }

    // Ajouter l’intercepteur au mapping
    localeChangeInterceptorHandlerMapping(org.springframework.web.servlet.handler.MappedInterceptor, ["/**"], localeChangeInterceptor)
}
