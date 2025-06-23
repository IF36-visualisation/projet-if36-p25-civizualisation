# 📊 Projet IF36 - Analyse des données de Kickstarter

L'objectif de ce projet d'IF36 est d'analyser et de présenter des données issues d'un jeu de données de notre choix.

## 👥 Membres

Équipe Civizualisation :

- Florian BONELLI
- Eyvan FAURE
- Ryan OUYED
- Lucas SAURON

## 📚 Sommaire

- [📝 Contexte des données choisis](#-contexte-des-données-choisis)
- [📥 Téléchargement des données](#-téléchargement-des-données)
- [📁 Présentation des données](#-présentation-des-données)
- [📊 Plan d'analyse](#-plan-danalyse)

## 📝 Contexte des données choisis

[![Kickstarter](https://i.kickstarter.com/tq0sfld-kickstarter-logo-green.png?origin=static&sig=f4aHZ5ZiQhwZCgzBFzJqR3WIwCUT6jVw6mALfOHvmu0%3D)](https://www.kaggle.com/datasets/kemical/kickstarter-projects?select=ks-projects-201801.csv)

Nous avons choisi d'utiliser les données du site de financement participatif Kickstarter.

Kickstarter offre l'opportunité à des créateurs de transformer des idées en réalité grâce au financement participatif.

Cette plateforme permet de lever des fonds pour financer des projets en mettant en relation des contributeurs du monde entier.

Nous avons décidé d'utiliser le jeu de données [Kickstarter Projects](https://www.kaggle.com/datasets/kemical/kickstarter-projects) disponible sur Kaggle.

Ces données sont collectées depuis la plateforme [Kickstarter](https://www.kickstarter.com/).

Ce projet nous permettra d'explorer les tendances du financement participatif, d'identifier les facteurs qui influencent le succès d'un projet et d'évaluer la probabilité de réussite des campagnes sur cette plateforme.

Nous chercherons également à visualiser ces données de manière claire et intuitive pour mieux comprendre les dynamiques du financement participatif.

## 📥 Téléchargement des données

Les données utilisées dans ce projet ne sont pas incluses dans ce dépôt en raison de leur taille.

Il faut les télécharger manuellement.

Suivez les étapes ci-dessous pour récupérer les fichiers nécessaires :

1. Téléchargez l'archive contenant les jeux de données.

    ```bash
    curl -L -o ./data/kickstarter-projects.zip https://www.kaggle.com/api/v1/datasets/download/kemical/kickstarter-projects
    ```

2. Une fois l'archive téléchargée, extrayez les fichiers.

    ```bash
    unzip ./data/kickstarter-projects.zip -d ./data
    ```

    Si `unzip` n'est pas installé, vous pouvez l'installer avec la commande suivante

    ```bash
    sudo apt-get install unzip
    ```

3. (Facultatif) Après avoir extrait les fichiers, vous pouvez supprimer l'archive pour libérer de l'espace.

    ```bash
    rm ./data/kickstarter-projects.zip
    ```

## 📁 Présentation des données

### Premier fichier : `ks-projects-201612.csv`

Ce premier jeu de données au format CSV (Comma-Separated Values) contient 321 616 individus et 17 variables.

| Variable             | Type de données   | Description                                                                            |
|----------------------|-------------------|----------------------------------------------------------------------------------------|
| `ID`                 | Integer           | Identifiant unique du projet                                                           |
| `name`               | String            | Nom du projet                                                                          |
| `category`           | String            | Catégorie spécifique du projet                                                         |
| `main_category`      | String            | Catégorie principale du projet                                                         |
| `currency`           | String            | Devise utilisée pour le financement                                                    |
| `deadline`           | Date              | Date limite pour la collecte des fonds                                                 |
| `goal`               | Float             | Montant que le projet espère récolter                                                  |
| `launched`           | Date and time     | Date et heure de lancement du projet                                                   |
| `pledged`            | Float             | Somme totale engagée par les contributeurs                                             |
| `state`              | String            | État de la campagne (ex : "failed", "successful")                                      |
| `backers`            | Integer           | Nombre de contributeurs                                                                |
| `country`            | String            | Pays où le projet est lancé (ISO 3166)                                                 |
| `usd pledged`        | Float             | Montant collecté en USD (conversion réalisée par Kickstarter)                          |
| NA                   | NA                | NA                                                                                     |
| NA                   | NA                | NA                                                                                     |
| NA                   | NA                | NA                                                                                     |
| NA                   | NA                | NA                                                                                     |

On remarque que les 4 dernières variables sont sans titre et sans données.

### Deuxième fichier : `ks-projects-201801.csv`

Ce deuxième jeu de données au format CSV (Comma-Separated Values) contient 375 765 individus et 15 variables.

| Variable             | Type de données   | Description                                                                            |
|----------------------|-------------------|----------------------------------------------------------------------------------------|
| `ID`                 | Integer           | Identifiant unique du projet                                                           |
| `name`               | String            | Nom du projet                                                                          |
| `category`           | String            | Catégorie spécifique du projet                                                         |
| `main_category`      | String            | Catégorie principale du projet                                                         |
| `currency`           | String            | Devise utilisée pour le financement                                                    |
| `deadline`           | Date              | Date limite pour la collecte des fonds                                                 |
| `goal`               | Float             | Montant que le projet espère récolter                                                  |
| `launched`           | Date and time     | Date et heure de lancement du projet                                                   |
| `pledged`            | Float             | Somme totale engagée par les contributeurs                                             |
| `state`              | String            | État de la campagne (ex : "failed", "successful")                                      |
| `backers`            | Integer           | Nombre de contributeurs                                                                |
| `country`            | String            | Pays où le projet est lancé (ISO 3166)                                                 |
| `usd pledged`        | Float             | Montant collecté en USD (conversion réalisée par Kickstarter)                          |
| `usd_pledged_real`   | Float             | Montant collecté en USD (conversion réalisée par l'API fixer.io)                       |
| `usd_goal_real`      | Float             | Montant que le projet espère collecter en USD (conversion réalisée par l'API fixer.io) |

Ce fichier contient plus d'individus que le premier, exclut les variables inutiles et ajoute deux variables supplémentaires par rapport au premier fichier.

En observant juste les noms des fichiers, il est raisonnable de supposer que le fichier `ks-projects-201612.csv` contient des données jusqu'en décembre 2016, tandis que le fichier `ks-projects-201801.csv` inclut des données jusqu'en janvier 2018. Une vérification sera nécessaire pour s'assurer qu'il n'y a pas de doublons entre les individus présents dans ces deux fichiers.

De plus, si c'est le cas, le fichier de 2018 semble être plus pertinent à utiliser seul. En effet, il ne comporte pas les variables vides présentes dans le fichier de 2016, inclut deux variables supplémentaires (`usd_pledged_real` et `usd_goal_real`), contient un plus grand nombre d'individus et propose des données plus récentes.

## 📊 Plan d'analyse

### 🎯 Objectif principal de l'analyse

L'objectif principal de notre analyse est de comprendre les dynamiques du financement participatif sur Kickstarter. Plus précisément, nous cherchons à identifier des tendances utiles pour optimiser les chances de succès des projets afin de dégager les facteurs qui influencent la réussite ou l'échec d'une campagne.

### 🔍 Questions d'analyse

- Quels sont les taux de réussite des campagnes selon les catégories ?
- Dans quelle mesure le montant de l'objectif influence-t-il la probabilité de succès d'une campagne ?
- Existe-t-il des périodes de l'année où les campagnes ont plus de chances de réussir ?
- Quels sont les pays où le plus de campagnes sont créées? Parmi eux, lesquels ont les meilleurs taux de réussite?
- L'écart entre l'objectif initial et les fonds réellement collectés varie-t-il en fonction de la catégorie ou de la devise utilisée ?
- Le choix des mots dans le titre d'une campagne a-t-il un impact sur son succès ?
- Comment a évolué le taux de réussite et le nombre de campagne au fil des années? Les campagnes sont elles plus ambitieuses qu'avant?

### 📈 Variables à comparer

Pour répondre à nos questions d'analyse, nous comparerons les variables suivantes :

- **Taux de réussite et d'échec par catégorie** : Identifier les catégories où les campagnes réussissent ou échouent le plus souvent.
- **Taux de réussite et d'échec en fonction du montant de l'objectif** : Analyser l'impact du montant demandé sur le succès ou l'échec des campagnes.
- **Taux de réussite et d'échec selon la période de lancement** : Étudier si certaines périodes de l'année influencent les chances de succès ou d'échec.
- **Nombre de campagnes créées et leur taux de réussite selon le pays**: Comparer les pays où les campagnes sont les plus populaires pour observer des différences de nombres de campagnes et de taux de réussite selon les régions.
- **Écart entre le montant collecté et l'objectif fixé** : Comparer les fonds espérés et les fonds réellement obtenus pour évaluer les écarts.
- **Impact des mots-clés dans les titres sur le succès** : Identifier les mots les plus fréquents dans les titres des campagnes réussies et leur influence.
- **Nombre de campagnes réussies montant moyen récolté par campagne réussie selon l'année** : Comparer le nombre de campagnes réussies et leur valeur moyenne chaque année pour dégager des tendances.

Ces comparaisons nous permettront de mieux comprendre les facteurs influençant le succès des campagnes Kickstarter.

### ⚠️ Limitations et problèmes potentiels

- Certains porteurs de projets peuvent fixer des objectifs volontairement bas pour maximiser leurs chances de succès ou, au contraire, volontairement élevé par manque de sérieux, ce qui pourrait biaiser les résultats de l'analyse.
- Les taux de conversion en USD peuvent introduire des biais en fonction des fluctuations des taux de change et de l'inflation.
- Des facteurs externes, tels que les tendances économiques ou médiatiques, qui ne sont pas inclus dans les données, peuvent également influencer le succès des campagnes.
