
const ecran = document.getElementById('ecran');

function ajouterCaractere(caractere) {
    ecran.value += caractere;
}

function effacerTout() {
    ecran.value = '';
}

function supprimer() {
    ecran.value = ecran.value.slice(0, -1);
}

function calculer() {
    try {
        // Remplace × par * pour l'évaluation
        const expression = ecran.value.replace(/×/g, '*');
        const resultat = eval(expression);

        if (isNaN(resultat) || !isFinite(resultat)) {
            ecran.value = 'Erreur';
        } else {
            ecran.value = resultat;
        }
    } catch (e) {
        ecran.value = 'Erreur';
    }
}

// Gestion du clavier
document.addEventListener('keydown', function (event) {
    const touchesValides = /[0-9+\-*/.%()=]|Backspace|Enter|Delete/;
    if (!touchesValides.test(event.key)) {
        return;
    }

    if (event.key === 'Enter') {
        calculer();
    } else if (event.key === 'Backspace') {
        supprimer();
    } else if (event.key === 'Delete') {
        effacerTout();
    } else if (event.key === '*') {
        ajouterCaractere('×');
    } else {
        ajouterCaractere(event.key);
    }
});