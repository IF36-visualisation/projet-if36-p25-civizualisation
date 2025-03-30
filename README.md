# 📊 Projet IF36 - Analyse des données de Kickstarter

L'objectif de ce projet d'IF36 est d'analyser et de présenter des données issues d'un jeu de données de notre choix.

## 👥 Membres
Equipe Civizualisation :
- Florian Bonelli
- Eyvan FAURE
- Ryan OUYED
- Lucas SAURON

## 📚 Sommaire
- [📌 Introduction](#📌-introduction)
- [📁 Présentation des données](#📁-présentation-des-données)
- [📊 Plan d'analyse](#📊-plan-danalyse)

## 📌 Introduction

L'objectif de ce projet d'IF36 est d'analyser et de présenter des données issues d'une base de données que nous avons choisie. Nous avons ainsi décidé d'utiliser les données du site de financement collaboratif Kickstarter.

Ce projet nous permettra d'explorer les tendances du financement participatif, d'identifier les facteurs qui influencent le succès d'un projet et d'évaluer la probabilité de réussite des campagnes sur cette plateforme.

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
