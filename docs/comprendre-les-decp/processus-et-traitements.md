# Processus automatisés <!-- {docsify-ignore-all} -->



## Collecte

Les données sont téléchargées et traitées en intégralité toutes les nuits, autour de 5 heure du matin, depuis [les sources de données identifiées](comprendre-les-decp/sources.md).

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

[schema gw](../_media/decp-gw.drawio.html ':include')


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

[schema rama](../_media/decp-rama.drawio.html ':include')


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

# Traitements <!-- {docsify-ignore-all} -->

## Correction des anomalies <!-- {docsify-ignore-all} -->

### Données non respectueuses des schémas réglementaires

Données ne respectant pas la structure définie par les [schémas](comprendre-les-decp/schemas.md), et donc la structure définie dans la réglementation. Ces anomalies ne sont corrigées que si elles sont détectées et qu'elles peuvent être corrigées.

Par exemple :

- si un champ de données est manquant, on ne peut pas l'ajouter ne pouvant en connaître le contenu
- si une date n'est pas au bon format ou qu'une valeur normée (ex : nom de procédure) n'a pas la bonne casse, on peut appliquer un traitement automatisé qui corrigera l'erreur

Les données consolidées ne sont donc pas conformes aux schémas car les données publiées par les partenaires ne sont pas toujours valides et que l'on ne peut pas corriger toutes les entorses aux schémas.

### Données inexploitables

Données incohérentes ou manifestement erronées, susceptibles d'altérer significativement leur analyse.

Par exemple :

- identité de l'acheteur et du titulaire identiques
- pas d'acheteur, pas de titulaire, pas d'identifiant de marché
- montant maximal fantaisiste (1 milliard d'euro pour une mission de conseil) en lieu et place d'un montant estimé
- données publiées par les acheteurs à des fins de test

Ces données sont extraites des données consolidées et publiées dans un fichier à part (TODO à préciser après la stabilisation des datasets).

## Consolidation

Les données au format XML sont converties au format JSON, puis les données de chaque source sont fusionnées dans un seul fichier JSON.

Les données consolidées de la veille sont ensuite téléchargées afin

1. d'être comparées avec les données actuelles
2. d'établir la liste des nouveaux marchés du jour (marchés présents dans les données consolidées du jour mais absents des données de la veille)
3. d'exporter les nouveaux marchés du jour dans un fichier dédié

Enfin les fichiers finaux sont produits :

1. le fichier consolidé au format JSON est converti aux formats XML et OCDS JSON
2. le fichier JSON des nouveaux marchés du jour est converti au format XML.

Résultat :

- l'ensemble des marchés consolidé est publié aux formats suivants :
  - JSON réglementaire
  - XML réglementaire
  - OCDS JSON
- les nouveaux marchés du jour sont publiés aux formats suivants :
  - JSON réglementaire
  - XML réglementaire

## Publication

Les données consolidées et les fichiers du jour sont publiées [sur data.gouv.fr](https://www.data.gouv.fr/fr/datasets/5cd57bf68b4c4179299eb0e9/) via l'API.

# Les différents repositories Github <!-- {docsify-ignore-all} -->

Github de l'équipe https://github.com/139bercy

## Dépôt de code

Les scripts de consolidation, de traitement et de publication des données sont hébergés dans un dépôt dédié : [139bercy/decp-rama](https://github.com/139bercy/decp-rama/).

Les scripts permettant d'ajouter au fichier DECP consolidés des informations sur les établissements et les acheteurs venant de l'INSEE ainsi que certaines corrections sont hébergés dans le dépot [139bercy/decp-augmente](https://github.com/139bercy/decp-augmente)

Les scripts supportants le [tableau de bord de supervision](https://139bercy.github.io/decp-monitoring/)
sont hébergés dans le dépot [139bercy/decp-monitoring](https://github.com/139bercy/decp-monitoring)

DECP docs https://github.com/139bercy/decp-docs