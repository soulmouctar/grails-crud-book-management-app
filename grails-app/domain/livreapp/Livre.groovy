package livreapp

class Livre {
    String titre
    String auteur
    String isbn
    Integer anneePublication
    String genre
    String description

    static constraints = {
        titre blank: false
        auteur blank: false
        isbn unique: true, blank: false
        anneePublication min: 1000, max: 2030
        genre nullable: true
        description nullable: true, maxSize: 1000
    }

    String toString() {
        return titre
    }
}
