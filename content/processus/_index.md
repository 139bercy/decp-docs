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

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2020-09-07T15:06:51.791Z\&quot; agent=\&quot;5.0 (X11)\&quot; etag=\&quot;sxZUSUvnlvqFJY0pXJcK\&quot; version=\&quot;13.6.6\&quot; type=\&quot;github\&quot;&gt;&lt;diagram id=\&quot;YwVPcnQrtgQc1rpSdtJS\&quot; name=\&quot;Page-1\&quot;&gt;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&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>

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
