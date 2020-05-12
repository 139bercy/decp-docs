---
title: "Consolidation et traitement des données"
date: 2020-05-05T12:57:45+02:00
draft: true
---

## Dépôt de code

Les scripts de consolidation, de traitement et de publication des données sont hébergés dans un dépôt dédié : [etalab/decp-rama](https://github.com/etalab/decp-rama/).

## Collecte

Les données sont téléchargées et traitées en intégralité toutes les nuits, autour de 5 heure du matin, depuis les sources de données identifiées (TODO lien vers les section "Sources de données").

## Correction des anomalies

### Données non respectueuses des schémas réglementaires

Données ne respectant pas la structure définie par les schémas (TODO lien vers la section des schémas), et donc la structure définie dans la réglementation. Ces anomalies ne sont corrigées que si elles sont détectées et qu'elles peuvent être corrigées.

Par exemple :

- si un champ de données est manquant, on ne peut pas l'ajouter ne pouvant en connaître le contenu
- si une date n'est pas au bon format ou qu'une valeur normée (ex : nom de procédure) n'a pas la bonne casse, on peut appliquer un traitement automatisé qui corrigera l'erreur

Les données consolidées ne sont donc pas conformes aux schémas car les données publiées par les partenaires (TODO lien vers les sources) ne sont pas toujours valides et que l'on ne peut pas corriger toutes les entorses aux schémas.

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

- l'ensemble des marchés consolidé est publié aux formats suivants (TODO lien vers la section "Les schémas") :
  - JSON réglementaire
  - XML réglementaire
  - OCDS JSON
- les nouveaux marchés du jour sont publiés aux formats suivants :
  - JSON réglementaire
  - XML réglementaire

## Publication

Les données consolidées et les fichiers du jour sont publiées [sur data.gouv.fr](https://www.data.gouv.fr/fr/datasets/5cd57bf68b4c4179299eb0e9/) via l'API.
