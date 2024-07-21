Voici des commandes en ligne pour tester chaque fonctionnalité du script `sauvegarde.sh`. Vous pouvez les exécuter directement dans votre terminal.

### 1. Afficher l'Usage

```bash
./sauvegarde.sh -h
```

### 2. Afficher l'Aide

```bash
./sauvegarde.sh -v
```

### 3. Afficher le Nombre de Fichiers et la Taille Totale

1. **Créer un répertoire temporaire avec des fichiers de test :**

    ```bash
    mkdir -p ~/test_dir
    touch ~/test_dir/file1.txt ~/test_dir/file2.txt
    sleep 1
    touch ~/test_dir/file3.txt
    ```

2. **Exécuter la commande pour afficher le nombre de fichiers et la taille totale :**

    ```bash
    ./sauvegarde.sh -n ~/test_dir
    ```

3. **Nettoyer les fichiers de test :**

    ```bash
    rm -r ~/test_dir
    ```

### 4. Archiver les Fichiers

1. **Créer un répertoire temporaire avec des fichiers de test :**

    ```bash
    mkdir -p ~/test_dir
    touch ~/test_dir/file1.txt ~/test_dir/file2.txt
    sleep 1
    touch ~/test_dir/file3.txt
    ```

2. **Exécuter la commande pour archiver les fichiers :**

    ```bash
    ./sauvegarde.sh -a ~/test_dir
    ```

3. **Vérifier si l'archive est créée :**

    ```bash
    ls -l backup_*.tar.gz
    ```

4. **Nettoyer les fichiers de test :**

    ```bash
    rm -r ~/test_dir backup_*.tar.gz
    ```

### 5. Renommer l'Archive

1. **Créer une archive de test :**

    ```bash
    mkdir -p ~/test_dir
    touch ~/test_dir/file1.txt ~/test_dir/file2.txt
    sleep 1
    touch ~/test_dir/file3.txt
    ./sauvegarde.sh -a ~/test_dir
    ```

2. **Renommer l'archive :**

    ```bash
    archive_name=$(ls backup_*.tar.gz)
    ./sauvegarde.sh -r "$archive_name"
    ```

3. **Vérifier si l'archive est renommée :**

    ```bash
    ls -l backup_*.tar.gz
    ```

4. **Nettoyer les fichiers de test :**

    ```bash
    rm -r ~/test_dir backup_*.tar.gz
    ```

### 6. Sauvegarder les Informations

1. **Créer un répertoire temporaire avec des fichiers de test :**

    ```bash
    mkdir -p ~/test_dir
    touch ~/test_dir/file1.txt ~/test_dir/file2.txt
    sleep 1
    touch ~/test_dir/file3.txt
    ```

2. **Exécuter la commande pour sauvegarder les informations :**

    ```bash
    ./sauvegarde.sh -s "infos_sauvegardees.txt" ~/test_dir
    ```

3. **Vérifier le contenu du fichier de sauvegarde :**

    ```bash
    cat infos_sauvegardees.txt
    ```

4. **Nettoyer les fichiers de test :**

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

Ces commandes vous permettront de tester les fonctionnalités principales de votre script `sauvegarde.sh`. Assurez-vous que le script est exécutable (`chmod +x sauvegarde.sh`) avant de lancer ces commandes.