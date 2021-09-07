---
title: Traitement sur les decp
# slug: decp_augmente
weight: 7
---

Une fois les decp agrégéés, celle-ci sont retraitées afin d'être publiées sur [data économie](https://data.economie.gouv.fr/explore/dataset/decp_augmente/table/) et à des fins de communications publiques avec le [tableau de bord](https://datavision.economie.gouv.fr/decp/?view=France) proposé. Ce retraitement est d'autant plus nécessaire que ces données osnt des données rentrées manuellement. L'ensemble du code est à retrouver sur [139bercy/decp-augmente](https://github.com/139bercy/decp-augmente/), et le processus est synthétisé ci-dessous.

## Valorisation de la donnée

### Nettoyage

TODO : explication de l'ensemble du traitement réalisé pour la partie nettoyage des données. 

#### Travail sur les titulaires

Si l'on distingue, au sein des decp, deux types de données -- les marchés et les concessions -- nous avons fusionnés les colonnes comportant des informations semblables.

- La colonne `concessionnaire` a fusionné avec la colonne `titulaire` 
- La colonne `valeur globale` a fusionné avec la colonne `montant`
- La colonne `autoriteConcedante.id` a fusionné avec la colonne `acheteur.id`
- La colonne `autoriteConcedante.nom` a fusionné avec la colonne `acheteur.nom`

De manière générale, on ne conserve que les données ou un titulaire est renseigné.

#### Travail sur les montants

Dans un soucis de conservation de l'information source, la colonne montant est renomée en `montantOriginal` et l'ensemble des opérations suivantes seront appliquées à la colonne `montantCalcule` : 

- Les valeurs manquantes sont remplacées par 0
- Les montants inférieurs à 200€ et supérieur à 999 999 999€ sont remis à 0
- Les montants composés d'au moins 5 fois le même chiffre (hors 0) sont remis à 0.

#### Travail sur les indentifiants

Les codes, ou variables d'identifications, recoupent aussi bien de la variable `id` (identifiant des lignes de la base), que `id.Titulaires` (ientifiant des entreprises) ou encore `code_CPV` permettant l'identification des types de marchés. 

- Remplacement des valeurs manquantes de `id` par '0000000000000000' (la colonne id sera retravaillé un peu plus tard dans le processus de nettoyage)
- Rerait des caractères spéciaux présent dans `idTitulaires`. On obtient le numéro SIRET
- Récupération du NIC et stockage dans une colonne `nic`
- Création d'une colonne `CPV_min` composé des deux premiers chiffre du code CPV. Cela permet d'identifier le type de marché (Fournitures/Travaux/Services)

#### Travail sur la géographie administrative

On récupére les codes de départements des marchés, en y ajoutant les libellés et la région. 

- Extraction du code département de la colonne `lieuExecution.code` et stocké dans `codeDepartementExecution`
- Ajout du libellé du département / code de la région / libellé de la région respectivement dans `libelleDepartementExecution`, `codeRegionExecution` et `libelleRegionExecution`

#### Travail sur les dates

On récupère les dates des marchés.

- Récupération de l'année et du mois de notification du marché et stockage dans `anneeNotification` et `moisNotification`
- Remplacement par np.NaN des dates lorsque l'années est inférieur à 1980 et supérieur à 2100

#### Travail sur la durée du marché

Au sein des DECP les durées de marché sont exprimées en mois. De même que pour les montants, on conserve les durées initiales et on modifie les durées dans la colonne `dureeMoisCalculee`. De plus, on ajoute la colonne `dureeMoisEstimee` : TODO.

Les durées manquantes sont corrigées à 0. Tous les cas suivant seront corrigées en divisant par 30 (conversion en mois) : 

- durée égale au montant 
- montant / durée < __100__
- montant / durée < __1000__ pour une durée > __12__ mois
- duréee == __30__ ou __31__ et montant < __200 000__ €
- duréee == __360__ ou __365__ ou __366__ et montant < __10 000 000__ €
- durée > __120__ et montant < __2 000 000__ €

Un début de travail sur de l'imputation a aussi été réalisé. On se place dans le cas des marchés qui ne sont pas des travaux (CPV_min != 45) et qui ont une `duréeCalculee` supérieure à 120 : 

- Imputation par la médiane des durées de mois pour un `CPV_min` équivalent.

#### Travail sur la variable qualitative objet.

Remplacement du caractère '�' par 'XXXXX' dans la colonne objet

## Enrichissement des données

La partie enrichissement des données va nous permettre d'ajouter, grâce à des sources externes, de la donnée dans nos DECP. Pour cela nous utiliserons les sources de données suivantes:

   - INSEE
       - Code des régions, départements, arrondissements, cantons.
       - La base SIREN 
   - OpenDatasoft
       - Géolocalisations des communes
   - SIMAP (Système d'Information pour les MArchés Publics)
       - Nomencalture européenne des codes CPV

La structure finale de la base, exportée sur [data économie](https://data.economie.gouv.fr/explore/dataset/decp_augmente/table/), est explicitée dans la partie [Format final des DECP](../structure_finale/_index.md)