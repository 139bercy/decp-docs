---
title: "Processus automatisés"
date: 2020-08-26:57:45+02:00
weight: 41
---

## decp-gw

**Description** : téléchargement des données PES marché de la DGFiP et publication sur files.data.gouv.fr

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

<!-- Méthode d'inclusion utilisée : dans draw.io, faites File/Export as.../HTML, et ne gardez que <div> et          <script> -->

<body><div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2020-09-07T16:03:21.249Z\&quot; agent=\&quot;5.0 (X11)\&quot; etag=\&quot;B_iVuNBz-7iAvqzI__Am\&quot; version=\&quot;13.6.6\&quot; type=\&quot;device\&quot;&gt;&lt;diagram id=\&quot;YwVPcnQrtgQc1rpSdtJS\&quot; name=\&quot;Page-1\&quot;&gt;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&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>

1. ouverture d'un tunnel VPN vers la DGFiP
2. téléchargement des données disponibles sur le serveur FTP (les données sont supprimées du serveur FTP après téléchargement)
3. archivage des fichiers XML
4. correction des anomalies et suppression des champs non pertinents
5. extraction et enregistrement dans un CSV des SIRETs et URL des profils d'acheteurs trouvés dans les fichiers
6. fusion de l'ensemble des XML dans un seuil fichier `dgfip-pes-decp.xml`
7. publication des nouveaux fichiers et du nouveau `dgfip-pes-decp.xml` sur [files.data.gouv.fr](https://files.data.gouv.fr/decp/) avec `rsync` ([jeu de données](https://www.data.gouv.fr/fr/datasets/donnees-essentielles-de-la-commande-publique-transmises-via-le-pes-marche/))

## decp-rama

**Description** : téléchargement des DECP publiques et publication sur data.gouv.fr

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

<!-- Méthode d'inclusion utilisée : dans draw.io, faites File/Export as.../HTML, et ne gardez que <div> et <script> -->

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2020-09-07T09:01:07.563Z\&quot; agent=\&quot;5.0 (X11)\&quot; etag=\&quot;_qclodUT4bsLZwi-tAGX\&quot; version=\&quot;13.6.6\&quot; type=\&quot;device\&quot;&gt;&lt;diagram id=\&quot;YwVPcnQrtgQc1rpSdtJS\&quot; name=\&quot;Page-1\&quot;&gt;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&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://app.diagrams.net/js/viewer-static.min.js"></script>


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
5. extraction des nouveaux marchés du jour (c'est de loin l'étape la plus chronophage, dont la durée dépend du nombre de nouveaux marchés)
6. conversion du fichier consolidé et du fichier du jour en XML
7. conversion du fichier consolidé au format OCDS JSON
8. publication des données sur data.gouv.fr via l'API data.gouv.fr ([jeu de données](https://www.data.gouv.fr/fr/datasets/5cd57bf68b4c4179299eb0e9/))
  - les fichiers consolidés JSON, XML et OCDS JSON remplacent les versions précédentes
  - les fichiers du jour JSON et XML sont ajoutés

## decp-monitoring

TODO
