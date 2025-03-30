# 📊 Civizualisation - Projet sur des données de Kickstarter

## ✅ Sommaire :

-   Introduction
-   Les données
-   Plan d'analyse

## 📌 Introduction :

L'objectif de ce projet d'IF36 est d'analysée et présenter des données d'une base de données que l'on à choisie. Nous avons ainsi décidé d'utiliser les données du site de financement collaboratif Kickstarter.

Ce projet nous permettra d’explorer les tendances du financement de projet participatif, d’identifier les facteurs qui influence le succès d’un projet et d’évaluer la probabilité de réussite des campagnes sur cette plateforme.

### 📁 Les données :

Nos données proviennent de la plateforme **Kaggle** ou nous avons trouver un jeu de données sur **Kickstarter**. 


 [![Kickstarter](https://i.kickstarter.com/tq0sfld-kickstarter-logo-green.png?origin=static&sig=f4aHZ5ZiQhwZCgzBFzJqR3WIwCUT6jVw6mALfOHvmu0%3D)](https://www.kaggle.com/datasets/kemical/kickstarter-projects?select=ks-projects-201801.csv)


Cette plateforme de financement participatif permet à des créateurs de lever des fonds pour financer leurs projets.

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

## 📊 Plan d'analyse :

L'objectif de notre analyse est d'identifié les facteurs qui influencent la réussite ou non du financement d'un projet et d'en tirer des tendances utilises.

### 🔍 Question d'analyse

- Quels sont les taux de réussite des campagnes en fonction des catégories ?

- Le montant de l'objectif impacte-t-il la probabilité de succès ?

- Y a-t-il des périodes de l'année plus propices aux campagnes réussies ?

- L'écart entre l'objectif initial et les fonds réellement collectés varie-t-il selon la catégorie ou la devise ?

- Peut-on prédire la réussite d'un projet en fonction de ses caractéristiques initiales ?

- Le titre impacte-t-il la réussite d'une campagne ?

### 📈 Variable à comparer 

- Succès/échec vs Catégorie principale

- Succès/échec vs Montant de l'objectif

- Succès/échec vs Période de lancement

- Montant collecté vs Objectif fixé

- Succès/échec vs Mot les plus récurents dans les titres

### ⚠️ Limitations et problèmes potentiels

À cause de possible biais dans l’approche de certains campagnes de financements, on peut avoir des objectifs volontairement bas pour assurer la réussite.

Le taux de conversion USD peut imposer du biais selon les taux de change.

De plus, d’autres facteurs externes (tendances économique, médiatique) non pris en compte dans les données peuvent aussi jouer un rôle sur le succès ou non.

Cette analyse devrait nous permettre d’aboutir à une meilleure compréhension des dynamiques du financement participatif et, pourquoi pas, au modèle prédictif de la réussite de campagne.


