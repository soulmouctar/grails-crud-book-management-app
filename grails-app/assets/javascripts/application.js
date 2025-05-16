// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.5.1.min
//= require popper.min
//= require bootstrap
//= require_self
let langueActuelle = navigator.language.startsWith('en') ? 'en' : 'fr';

const i18n = {
    fr: {
        selectFile: "Veuillez sélectionner un fichier XML",
        loadError: "Erreur lors de la lecture du fichier",
        parseError: "Erreur lors du traitement du fichier XML. Vérifiez le format du fichier.",
        bookLoaded: titre => `Livre "${titre}" chargé avec succès!`
    },
    en: {
        selectFile: "Please select an XML file",
        loadError: "Error reading the file",
        parseError: "Error processing the XML file. Check the file format.",
        bookLoaded: title => `Book "${title}" loaded successfully!`
    }
};

function chargerFichierXML() {
    const inputFichier = document.getElementById('fichierXML');

    if (!inputFichier.files.length) {
        alert(i18n[langueActuelle].selectFile);
        return;
    }

    const fichier = inputFichier.files[0];
    const lecteur = new FileReader();

    lecteur.onload = function(e) {
        try {
            const contenu = e.target.result;
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(contenu, "text/xml");

            const livre = {
                titre: xmlDoc.querySelector('titre')?.textContent || '',
                auteur: xmlDoc.querySelector('auteur')?.textContent || '',
                isbn: xmlDoc.querySelector('isbn')?.textContent || '',
                anneePublication: xmlDoc.querySelector('anneePublication')?.textContent || '',
                genre: xmlDoc.querySelector('genre')?.textContent || '',
                description: xmlDoc.querySelector('description')?.textContent || ''
            };

            document.querySelector('input[name="titre"]').value = livre.titre;
            document.querySelector('input[name="auteur"]').value = livre.auteur;
            document.querySelector('input[name="isbn"]').value = livre.isbn;
            document.querySelector('input[name="anneePublication"]').value = livre.anneePublication;

            const selectGenre = document.querySelector('select[name="genre"]');
            for (let option of selectGenre.options) {
                if (option.value === livre.genre) {
                    option.selected = true;
                    break;
                }
            }

            document.querySelector('textarea[name="description"]').value = livre.description;

            document.getElementById('messageConfirmation').textContent =
                i18n[langueActuelle].bookLoaded(livre.titre);

            document.getElementById('messageConfirmation').classList.remove('d-none');
        } catch (erreur) {
            console.error("Erreur lors du traitement du XML:", erreur);
            alert(i18n[langueActuelle].parseError);
        }
    };

    lecteur.onerror = function() {
        alert(i18n[langueActuelle].loadError);
    };

    lecteur.readAsText(fichier);
}


// Ajout d'un écouteur d'événement sur le bouton de chargement
document.addEventListener('DOMContentLoaded', function() {
    const boutonCharger = document.getElementById('boutonChargerXML');
    if (boutonCharger) {
        boutonCharger.addEventListener('click', chargerFichierXML);
    }
});
