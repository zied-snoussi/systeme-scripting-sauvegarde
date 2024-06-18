#!/bin/bash

# Fonction pour afficher l'usage du script
show_usage() {
    echo "Usage: sauvegarde.sh [-h] [-g] [-m] [-v] [-n] [-r] [-a] [-s FICHIER] chemin"
}

# Fonction pour afficher l'aide détaillée à partir d'un fichier texte
HELP() {
    if [[ -f help.txt ]]; then
        cat help.txt
    else
        echo "Le fichier help.txt est introuvable."
    fi
}

# Fonction pour afficher le nombre de fichiers et la taille totale des fichiers modifiés dans les dernières 24 heures
afficher_nombre_taille() {
    local chemin="$1"
    echo "Nombre de fichiers modifiés dans les dernières 24 heures :"
    find "$chemin" -type f -mtime -1 | wc -l
    echo "Taille totale des fichiers modifiés dans les dernières 24 heures :"
    find "$chemin" -type f -mtime -1 -exec du -ch {} + | grep total$
}

# Fonction pour archiver les fichiers modifiés dans les dernières 24 heures
archiver_fichiers() {
    local chemin="$1"
    local archive_name="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
    find "$chemin" -type f -mtime -1 -print0 | tar --null -czvf "$archive_name" --files-from -
    echo "Fichiers archivés dans $archive_name"
}

# Fonction pour renommer l'archive avec la date et l'heure de la modification
renommer_archive() {
    local archive_name="$1"
    local new_archive_name="backup_$(date +%Y%m%d_%H%M%S)_modified.tar.gz"
    mv "$archive_name" "$new_archive_name"
    echo "Archive renommée en $new_archive_name"
}

# Fonction pour sauvegarder les informations sur les fichiers archivés
sauvegarder_infos() {
    local fichier="$1"
    local chemin="$2"
    find "$chemin" -type f -mtime -1 -exec ls -lh {} + >"$fichier"
    echo "Informations sauvegardées dans $fichier"
}

# Fonction pour afficher un menu textuel
afficher_menu() {
    while true; do
        echo "Menu :"
        echo "1. Afficher l'usage"
        echo "2. Afficher l'aide"
        echo "3. Afficher le nombre de fichiers et la taille totale"
        echo "4. Archiver les fichiers"
        echo "5. Renommer l'archive"
        echo "6. Sauvegarder les informations"
        echo "7. Quitter"
        read -p "Choisissez une option : " choix
        case $choix in
        1) show_usage ;;
        2) HELP ;;
        3)
            read -p "Entrez le chemin : " chemin
            afficher_nombre_taille "$chemin"
            ;;
        4)
            read -p "Entrez le chemin : " chemin
            archiver_fichiers "$chemin"
            ;;
        5)
            read -p "Entrez le nom de l'archive : " archive_name
            renommer_archive "$archive_name"
            ;;
        6)
            read -p "Entrez le fichier de sauvegarde : " fichier
            read -p "Entrez le chemin : " chemin
            sauvegarder_infos "$fichier" "$chemin"
            ;;
        7) exit 0 ;;
        *) echo "Choix invalide" ;;
        esac
    done
}

# Fonction pour afficher un menu graphique (utilisation de YAD)
afficher_menu_graphique() {
    yad --form --title "Sauvegarde" --field "Option":CB "Afficher l'usage!Afficher l'aide!Afficher le nombre de fichiers et la taille totale!Archiver les fichiers!Renommer l'archive!Sauvegarder les informations!Quitter" | while read choix; do
        case $choix in
        "Afficher l'usage") show_usage ;;
        "Afficher l'aide") HELP ;;
        "Afficher le nombre de fichiers et la taille totale")
            chemin=$(yad --entry --title "Chemin" --text "Entrez le chemin :")
            afficher_nombre_taille "$chemin"
            ;;
        "Archiver les fichiers")
            chemin=$(yad --entry --title "Chemin" --text "Entrez le chemin :")
            archiver_fichiers "$chemin"
            ;;
        "Renommer l'archive")
            archive_name=$(yad --entry --title "Archive" --text "Entrez le nom de l'archive :")
            renommer_archive "$archive_name"
            ;;
        "Sauvegarder les informations")
            fichier=$(yad --entry --title "Fichier de sauvegarde" --text "Entrez le fichier de sauvegarde :")
            chemin=$(yad --entry --title "Chemin" --text "Entrez le chemin :")
            sauvegarder_infos "$fichier" "$chemin"
            ;;
        "Quitter") exit 0 ;;
        *) yad --text "Choix invalide" ;;
        esac
    done
}

# Vérifier la présence d'au moins un argument
if [ $# -lt 1 ]; then
    show_usage >&2
    exit 1
fi

# Traiter les options avec getopts
while getopts ":hnargms:v" opt; do
    case ${opt} in
    h) HELP ;;
    n)
        read -p "Entrez le chemin : " chemin
        afficher_nombre_taille "$chemin"
        ;;
    a)
        read -p "Entrez le chemin : " chemin
        archiver_fichiers "$chemin"
        ;;
    r)
        read -p "Entrez le nom de l'archive : " archive_name
        renommer_archive "$archive_name"
        ;;
    s)
        read -p "Entrez le fichier de sauvegarde : " fichier
        read -p "Entrez le chemin : " chemin
        sauvegarder_infos "$fichier" "$chemin"
        ;;
    m) afficher_menu ;;
    g) afficher_menu_graphique ;;
    v) echo "Nom des auteurs : Zied Snoussi, Mouhib Dakhli. Version du code : 1.0" ;;
    *)
        show_usage >&2
        exit 1
        ;;
    esac
done
