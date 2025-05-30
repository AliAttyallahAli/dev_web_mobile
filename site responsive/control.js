// Barre de recherche //
// Fonction pour afficher/masquer les éléments en fonction de la recherche
document.getElementById("searchInput").addEventListener("input", function(e) {
    const searchTerm = e.target.value.toLowerCase();
    const items = document.querySelectorAll(".item");
// les elements qui contiennent la classe "item" sont ceux qui seront filtrés
    // Parcours de chaque élément et vérification de la correspondance 
    items.forEach(item => {
        const text = item.getAttribute("data-search").toLowerCase();
        if (text.includes(searchTerm)) {
            item.classList.remove("hidden");
        } else {
            item.classList.add("hidden");
        }
    });
});


document.getElementById("contactForm").addEventListener("submit"), function(e) {
    e.preventDefault(); // Empêche le rechargement de la page

    // Récupération des valeurs du formulaire
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const message = document.getElementById("message").value;

    // Simulation d'envoi (remplacer par fetch() ou XMLHttpRequest en réel)
    console.log("Message envoyé :", { name, email, message });

    // Affichage d'un message de confirmation
    document.getElementById("confirmation").textContent = "Message envoyé avec succès !";

     // Réinitialisation du formulaire après 2 secondes
     setTimeout(() => {
        document.getElementById("contactForm").reset();
        document.getElementById("confirmation").textContent = "";
    }, 2000);
}
