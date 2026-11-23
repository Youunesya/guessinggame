#!/usr/bin/env bash
# File: guessinggame.sh
# Jeu : deviner le nombre de fichiers dans le répertoire actuel

# Fonction qui compte les fichiers du répertoire actuel
function count_files {
    find . -maxdepth 1 -type f | wc -l
}

correct=$(count_files)
guess=-1

echo "Bienvenue dans le jeu de devinettes !"

while [[ $guess -ne $correct ]]
do
    echo "Combien de fichiers se trouvent dans le répertoire actuel ?"
    read -p "Votre réponse : " guess

    # Vérifier que la réponse est bien un nombre entier
    if ! [[ $guess =~ ^[0-9]+$ ]]
    then
        echo "Veuillez entrer un nombre entier."
        guess=-1
    elif [[ $guess -lt $correct ]]
    then
        echo "Trop bas ! Essayez encore."
    elif [[ $guess -gt $correct ]]
    then
        echo "Trop haut ! Essayez encore."
    fi
done

echo "Félicitations ! Il y a bien $correct fichiers dans le répertoire actuel."
