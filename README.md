# Script de Sauvegarde

## Description

Ce script permet de sauvegarder des fichiers modifiés dans les dernières 24 heures, de les archiver, de renommer des archives, de sauvegarder des informations sur les fichiers et d'afficher des informations diverses via un menu textuel ou graphique.

## Fonctionnalités

1. **Afficher l'Usage**
   - Commande: `./sauvegarde.sh -h`
   - Affiche l'usage du script.

2. **Afficher l'Aide**
   - Commande: `./sauvegarde.sh -v`
   - Affiche l'aide à partir d'un fichier texte.

3. **Afficher le Nombre de Fichiers et la Taille Totale**
   - Commande: `./sauvegarde.sh -n chemin`
   - Affiche le nombre de fichiers et la taille totale des fichiers modifiés dans les dernières 24 heures au chemin spécifié.

4. **Archiver les Fichiers**
   - Commande: `./sauvegarde.sh -a chemin`
   - Archive les fichiers modifiés dans les dernières 24 heures au chemin spécifié.

5. **Renommer l'Archive**
   - Commande: `./sauvegarde.sh -r nom_archive`
   - Renomme l'archive spécifiée avec la date et l'heure de la modification.

6. **Sauvegarder les Informations**
   - Commande: `./sauvegarde.sh -s fichier_sauvegarde chemin`
   - Sauvegarde les informations sur les fichiers modifiés dans les dernières 24 heures dans le fichier spécifié au chemin donné.

7. **Afficher un Menu Textuel**
   - Commande: `./sauvegarde.sh -m`
   - Affiche un menu textuel pour choisir parmi les options disponibles.

8. **Afficher un Menu Graphique**
   - Commande: `./sauvegarde.sh -g`
   - Affiche un menu graphique pour choisir parmi les options disponibles.

## Exemples de Commandes

### 1. Afficher l'Usage

```bash
./sauvegarde.sh -h
```

### 2. Afficher l'Aide

```bash
./sauvegarde.sh -v
```

### 3. Afficher le Nombre de Fichiers et la Taille Totale

1. Créez des fichiers de test :

    ```bash
    mkdir -p ~/test_dir
    touch ~/test_dir/file1.txt ~/test_dir/file2.txt
    sleep 1
    touch ~/test_dir/file3.txt
    ```

2. Exécutez la commande :

    ```bash
    ./sauvegarde.sh -n ~/test_dir
    ```

3. Nettoyez les fichiers de test :

    ```bash
    rm -r ~/test_dir
    ```

### 4. Archiver les Fichiers

1. Créez des fichiers de test :

    ```bash
    mkdir -p ~/test_dir
    touch ~/test_dir/file1.txt ~/test_dir/file2.txt
    sleep 1
    touch ~/test_dir/file3.txt
    ```

2. Exécutez la commande :

    ```bash
    ./sauvegarde.sh -a ~/test_dir
    ```

3. Vérifiez l'archive :

    ```bash
    ls -l backup_*.tar.gz
    ```

4. Nettoyez les fichiers de test :

    ```bash
    rm -r ~/test_dir backup_*.tar.gz
    ```

### 5. Renommer l'Archive

1. Créez une archive de test :

    ```bash
    mkdir -p ~/test_dir
    touch ~/test_dir/file1.txt ~/test_dir/file2.txt
    sleep 1
    touch ~/test_dir/file3.txt
    ./sauvegarde.sh -a ~/test_dir
    ```

2. Renommez l'archive :

    ```bash
    archive_name=$(ls backup_*.tar.gz)
    ./sauvegarde.sh -r "$archive_name"
    ```

3. Vérifiez le nouveau nom de l'archive :

    ```bash
    ls -l backup_*.tar.gz
    ```

4. Nettoyez les fichiers de test :

    ```bash
    rm -r ~/test_dir backup_*.tar.gz
    ```

### 6. Sauvegarder les Informations

1. Créez des fichiers de test :

    ```bash
    mkdir -p ~/test_dir
    touch ~/test_dir/file1.txt ~/test_dir/file2.txt
    sleep 1
    touch ~/test_dir/file3.txt
    ```

2. Exécutez la commande :

    ```bash
    ./sauvegarde.sh -s "infos_sauvegardees.txt" ~/test_dir
    ```

3. Vérifiez le contenu du fichier de sauvegarde :

    ```bash
    cat infos_sauvegardees.txt
    ```

4. Nettoyez les fichiers de test :

    ```bash
    rm -r ~/test_dir infos_sauvegardees.txt
    ```

### 7. Menu Textuel

```bash
./sauvegarde.sh -m
```

### 8. Menu Graphique

```bash
./sauvegarde.sh -g
```

## Prérequis

- Le script doit être exécutable. Assurez-vous d'utiliser la commande suivante pour rendre le script exécutable :

    ```bash
    chmod +x sauvegarde.sh
    ```

- Pour les fonctionnalités graphiques, `yad` doit être installé. Vous pouvez l'installer avec :

    ```bash
    sudo apt-get install yad
    ```

## Contributeurs

- Zied Snoussi
- Mouhib Dakhli

## Version

1.0

## Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.