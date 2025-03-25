# Civizualisation - Projet sur des données de Kickstarter

## Sommaire :

-   Introduction
-   Les données
-   Plan d'analyse

## Introduction :

L'objectir de ce projet d'IF36 est d'analysée et présenter des données d'une base de données que l'on à choisie. Nous avons ainsi décidé d'utiliser les données du site de financement collaboratif Kickstarter.

Ce projet nous permettra d’explorer les tendances du financement de projet participatif, d’identifier les facteurs qui influence le succès d’un projet et d’évaluer la probabilité de réussite des campagnes sur cette plateforme.

### Les données :

Nos données proviennent de la plateforme [![Kaggle](https://www.kaggle.com/static/images/site-logo.svg){alt="Kaggle"}](https://www.kaggle.com/) **Kaggle** ou nous avons trouver un jeu de données sur **Kickstarter**. Cette plateforme de financement participatif permet à des créateurs de lever des fonds pour financer leurs projets.

Ce jeu de données regroupe des informations sur les campagnes de financement lancées entre **mai 2009 et février 2017**.

Sur Kaggle, nous disposons de 2 fichiers avec des données

Fichier 1 : ks-projects-201612.csv

-   **Nombre d'observations** : 321 616 individus

-   **Nombre de variables** : 16 dimensions

-   **Format des données** : Fichier CSV (Comma-Separated Values)

Fichier 2 : ks-projects-201801.csv

-   **Nombre d'observations** : 375765 individus

-   **Nombre de variables** : 15 dimensions

-   **Format des données** : Fichier CSV (Comma-Separated Values)

Les principales variables incluent :

-   **ID** : Identifiant unique du projet (int)

-   **Name** : Nom du projet (string)

-   **Category** et **Main_category** : Domaine du projet (Musique, Film, Technologie, etc.) (string)

-   **Currency** : Devise utilisée pour le financement (String)

-   **Launched** et **Deadline** : Période de collecte des fonds (Date)

-   **Goal** : Montant que le projet espère récolter (int)

-   **Pledge** : Somme totale engagée par les contributeurs (int)

-   **State** : Succès ou échec de la campagne (String)

-   **USD pledge** : montant collecté en USD (int)

-   **Country** : pays où le montant est demandé (String)

-   **Number of baker** : number of backers (int)

Certaines variables sont uniques pour chaque fichier du jeu de données.

Fichier 1 : ks-projects-201612.csv

-   **3 Colonnes sans titre et sans donnée** : Aucune information dans les 3 colonnes

Fichier 2 : ks-projects-201801.csv :

-   **usd pledge real** : montant que le projet espère collecter en USD (conversion réalisé par KS) (int)

-   **usd goal real** : montant que le projet espère collecter en USD (conversion réalisé par fixer.io API) (int)

Ce jeu de données est pertinent pour analyser les tendances du financement participatif, étudier les facteurs de réussite et modéliser la probabilité de succès d'un projet.

## Plan d'analyse :
