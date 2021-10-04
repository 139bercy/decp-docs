---
title: "Consolidation des données"
date: 2020-05-05T12:57:45+02:00
weight: 4
---

## Les sources de données

Les données sont mises à dispositions par les partenaires pour faciliter leur téléchargement en masse, et donc leur collecte. Les scripts de consolidation, de traitement et de publication des données sont hébergés dans un dépôt dédié : [139bercy/decp-rama](https://github.com/139bercy/decp-rama/).

## Collecte

Les données sont téléchargées et traitées en intégralité toutes les nuits, autour de 5 heure du matin, depuis les sources de données identifiées ci-dessous : 

- [données issues du PES Marché de la DGFiP](https://www.data.gouv.fr/fr/datasets/donnees-essentielles-de-la-commande-publique-transmises-via-le-pes-marche/)
- [données collectées par l'API DUME de l'AIFE](https://www.data.gouv.fr/fr/organizations/agence-pour-linformatique-financiere-de-letat/)
- données issues du profil d'acheteur [Achatpublic.com](https://www.data.gouv.fr/fr/datasets/aife-de-44785462100045/) mises à disposition via l'API DUME de l'AIFE
- données issues du profil d'acheteur [Dématis](https://www.data.gouv.fr/fr/organizations/dematis/) facilitant le téléchargement des données de ses clients ([e-marchespublics.com](https://www.data.gouv.fr/fr/datasets/donnees-essentielles-des-marches-publics-e-marchespublics-com-1/#_))
- données publiées [sur le portail Open Data du Grand Lyon](https://data.grandlyon.com/citoyennete/marchf-public-de-la-mftropole-de-lyon/)
- données publiées sur le profil d'acheteur AWS ([marches-publics.info](https://www.marches-publics.info/mpiaws/index.cfm?fuseaction=pub.affResultats&IDs=25)), jusqu'au 6 mars, extraites et publiées manuellement par Colin Maudry [sur data.gouv.fr](https://www.data.gouv.fr/fr/datasets/donnees-essentielles-des-marches-publics-publies-sur-marches-publics-info-aws/)

## Gestion des anomalies

### Données non conformes des schémas réglementaires

Certaines données ne respectant pas la structure définie par les [schémas]({{< ref "/schemas" >}}), et donc la structure définie dans [la réglementation]({{< ref "/" >}}), peuvent être détectées et corrigées. Par exemple, si une date n'est pas au bon format ou qu'une valeur normée (ex : nom de procédure) n'a pas la bonne casse, un traitement automatisé pourra corriger l'erreur. En revanche, si un champ de données est manquant, on ne peut pas l'ajouter ne pouvant en connaître le contenu.

### Données inexploitables

Certaines données, incohérentes ou manifestement erronées, sont susceptibles d'altérer significativement leur analyse, comme lorsque le montant maximal est fantaisiste (1 milliard d'euro pour une mission de conseil) ou lorsque les données sont publiées par les acheteurs à des fins de test. Ces données sont extraites des données consolidées et publiées dans un fichier à part (TODO à préciser après la stabilisation des datasets), notamment lorsque l'identité de l'acheteur et du titulaire sont identiques et lorsqu'il n'existe pas d'acheteur, de titulaire ou d'identifiant de marché.

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
