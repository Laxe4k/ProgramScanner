# ProgramScanner

## Explication du Script

Ce script batch génère un fichier HTML listant les programmes installés sur l'ordinateur. Voici les étapes principales :

1. **Initialisation** : Le script configure l'encodage UTF-8 et active l'expansion différée des variables.
2. **Préparation du fichier de sortie** : Il définit le nom du fichier HTML (`programs.html`) et le supprime s'il existe déjà.
3. **Création de l'en-tête HTML** : Le script crée l'en-tête du fichier HTML, incluant des balises pour le titre, le charset, et un script pour rendre la table triable.
4. **Récupération des programmes** : Utilise `WMIC` pour obtenir la liste des programmes installés et les ajoute au fichier HTML avec des liens de recherche Google.
5. **Fermeture des balises HTML** : Ajoute les balises de fermeture et un style CSS pour le fichier HTML.
6. **Finalisation** : Affiche un message de confirmation indiquant que le fichier HTML a été généré.
