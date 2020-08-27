---
title: "Processus automatisés"
date: 2020-08-26:57:45+02:00
weight: 41
---

## decp-gw

**Description** : télécharge des données PES marché de la DGFiP et publication sur files.data.gouv.fr

**Code source** :

- hébergement : Gitlab de la mission Etalab
- langages :
  - bash
  - xslt
- publicité : confidentiel (contient des données de configuration)

**Exécution** :

- serveur : VPS loué par la mission Etalab, Debian Linux 4.9, 8 GB RAM
- fréquence : tous les jours à 0:45 CET
- durée :
  - moyenne : 5 minutes

**Actions** :

1. ouverture d'un tunnel VPN vers la DGFiP
2. téléchargement des données disponibles sur le serveur FTP (les données sont supprimées du serveur FTP après téléchargement)
3. archivage des fichiers XML
4. correction des anomalies et suppression des champs non pertinents
5. extraction et enregistrement dans un CSV des SIRETs et URL des profils d'acheteurs trouvés dans les fichiers
6. fusion de l'ensemble des XML dans un seuil fichier `dgfip-pes-decp.xml`
7. publication des nouveaux fichiers et du nouveau `dgfip-pes-decp.xml` sur [files.data.gouv.fr](https://files.data.gouv.fr/decp/) avec `rsync` ([jeu de données](https://www.data.gouv.fr/fr/datasets/donnees-essentielles-de-la-commande-publique-transmises-via-le-pes-marche/))

## decp-rama

**Description** : télécharge les DECP publiques et les publie sur data.gouv.fr

**Code source** :

- hébergement : compte Github du Ministère de l'économie, des finances et de la relance (https://github.com/139bercy/decp-rama)
- langages :
  - bash
  - xslt
  - [jq](https://stedolan.github.io/jq/)
- publicité : public, licence MIT

**Exécution** :

- serveur : instance gratuite de CircleCI ([journaux](https://app.circleci.com/pipelines/github/139bercy/decp-rama))
- fréquence : du mardi au samedi, à 4:00 CET
- durée :
  - moyenne : 50 minutes
  - maximale : 4 heures

**Actions** :

{{< figure src="/img/decp-rama.svg" title="" >}}

**a.** Pour chaque source de données répertoriée :

1. téléchargement
2. correction des anomalies
3. si la source est en XML, conversion vers JSON
4. fusion de l'ensemble des fichiers de la source en un seul fichier JSON

**b.** Puis, opérations sur les données consolidées :

1. consolidation des données de toutes les sources
2. déduplication des marchés par `uid` (SIRET + `id`)
2. exclusion des marchés inexploitables
3. correction des anomalies globales (présentes dans plusieurs sources)
4. production de statistiques
5. extraction des nouveaux marchés du jour
6. conversion du fichier consolidé et du fichier du jour en XML
7. conversion du fichier consolidé au format OCDS JSON
8. publication des données sur data.gouv.fr via l'API data.gouv.fr ([jeu de données](https://www.data.gouv.fr/fr/datasets/5cd57bf68b4c4179299eb0e9/))
  - les fichiers consolidés JSON, XML et OCDS JSON remplacent les versions précédentes
  - les fichiers du jour JSON et XML sont ajoutés

## decp-monitoring

TODO
