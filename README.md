# 📊 Projet IF36 - Analyse des données de Kickstarter

L'objectif de ce projet d'IF36 est d'analyser et de présenter des données issues d'un jeu de données de notre choix.

## 👥 Membres

Equipe Civizualisation :

- Florian BONELLI
- Eyvan FAURE
- Ryan OUYED
- Lucas SAURON

## 📚 Sommaire

- [📌 Introduction](#-introduction)
- [📥 Téléchargement des données](#-téléchargement-des-données)
- [📁 Présentation des données](#-présentation-des-données)
- [📊 Plan d'analyse](#-plan-danalyse)

## 📌 Introduction

L'objectif de ce projet d'IF36 est d'analyser et de présenter des données issues d'une base de données que nous avons choisie. Nous avons ainsi décidé d'utiliser les données du site de financement collaboratif Kickstarter.

Ce projet nous permettra d'explorer les tendances du financement participatif, d'identifier les facteurs qui influencent le succès d'un projet et d'évaluer la probabilité de réussite des campagnes sur cette plateforme.

## 📥 Téléchargement des données

Les données utilisées dans ce projet ne sont pas incluses dans ce repo en raison de leur taille.

Vous devez les télécharger manuellement.

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

Nos données proviennent de la plateforme **Kaggle** où nous avons trouvé un jeu de données sur **Kickstarter**.

[![Kickstarter](https://i.kickstarter.com/tq0sfld-kickstarter-logo-green.png?origin=static&sig=f4aHZ5ZiQhwZCgzBFzJqR3WIwCUT6jVw6mALfOHvmu0%3D)](https://www.kaggle.com/datasets/kemical/kickstarter-projects?select=ks-projects-201801.csv)

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

L'objectif de notre analyse est d'identifier les facteurs qui influencent la réussite ou non du financement d'un projet et d'en tirer des tendances utiles.

### 🔍 Questions d'analyse

- Quels sont les taux de réussite des campagnes en fonction des catégories ?

- Le montant de l'objectif impacte-t-il la probabilité de succès ?

- Y a-t-il des périodes de l'année plus propices aux campagnes réussies ?

- L'écart entre l'objectif initial et les fonds réellement collectés varie-t-il selon la catégorie ou la devise ?

- Peut-on prédire la réussite d'un projet en fonction de ses caractéristiques initiales ?

- Le titre impacte-t-il la réussite d'une campagne ?

### 📈 Variables à comparer

- Succès/échec vs Catégorie principale

- Succès/échec vs Montant de l'objectif

- Succès/échec vs Période de lancement

- Montant collecté vs Objectif fixé

- Succès/échec vs Mots les plus récurrents dans les titres

### ⚠️ Limitations et problèmes potentiels

À cause de possibles biais dans l'approche de certaines campagnes de financement, on peut avoir des objectifs volontairement bas pour assurer la réussite.

Le taux de conversion USD peut introduire un biais selon les taux de change.

De plus, d'autres facteurs externes (tendances économiques, médiatiques) non pris en compte dans les données peuvent aussi jouer un rôle sur le succès ou non.

Cette analyse devrait nous permettre d'aboutir à une meilleure compréhension des dynamiques du financement participatif et, pourquoi pas, à un modèle prédictif de la réussite des campagnes.
