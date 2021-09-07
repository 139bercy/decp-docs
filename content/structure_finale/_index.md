---
title: Format final des DECP
# slug: decp_augmente
weight: 8
---

Cette partie répertorie l'ensemble des 68 variables composants le jeu de données DECP, tel qu'accessible sur [data.economie](https://data.economie.gouv.fr/explore/dataset/decp_augmente/table/). Ces variables sont ici organisées par catégorie, pour offrir une meilleure lisibilité et compréhension de ces dernières. 

### Descriptif de la commande publique

**id**
: Identifiant métier de la commande publique.

**idMarche**
: Identifiant technique de la commande publique (unique à une commande).

**source**
: Provenance de la donnée (Voir la page dédiée à cela/mettre une ref).

**type**
: Type de commande publique (Marché ou Contrat de Concession).

**natureObjetMarche**
: Services / Fournitures / Travaux.

**objetMarche**
: Descriptif complet de la commande publique.

**codeCPV_Original**
: Code [CPV](https://simap.ted.europa.eu/fr/cpv) brut, non retravaillé.

**codeCPV**
: Code CPV retravaillé, avec clef de vérification.

**codeCPV_division**
: Division de la commande publique.

**referenceCPV**
: Libellé du code CPV.

**nature**
: nature de la commande publique (Marché, Accord-cadre, Marché subséquent, Marché de partenariat).

**accord-cadrePresume**
: Variable booléenne. La commande publique est elle un accord cadre ? Variable calculée.

**procedure**
: Type de procédure utilisée (Procédure adaptée, Appel d'offres ouvert, Appel d'offres restreint, Procédure avec négociation, Dialogue compétitif, Marchés publics passés sans publicité ni mise en concurrence préalables).


### Variable temporelle

**dateNotification**
: Date à laquelle la commande publique a été notifiée (exemple: 1 janvier 2021).

**anneeNotification**
: Année de la notification de la commande publique (exemple 2021).

**moisNotification**
: Mois de la notificationde la commande publique (exemple: 01).

**datePublicationDonnees**
: Date à laquelle les données relatives à la commande publique ont été publiées (exemple: 1 janvier 2021).

**dureeMois**
: Durée de la commande publique en mois. Variable déclarative, brute.

**dureeMoisEstimee**
: Variable boléenne. La durée de mois a t-elle été recalculée ?

**dureeMoisCalculee**
: Durée de la commande publique en mois, après correction.

 
### Variable sur les montants

**montantOriginal**
: Montant de la commande publique. Variable déclarative, brute.

**nombreTitulaireSurMarchePresume**
: Nombre de titulaires sur la commande publique. Cette variable a été calculée. (lien vers le calcul).

**montantCalcule**
: Montant de la commande publique, après correction.

**formePrix** :Ferme, Révisable, Ferme et actualisable.

 
### Localisation sur l'execution de la commande publique

**lieuExecutionCode**
: Code du lieu d'éxécution de la commande publique. Attention, variable non homogène.

**lieuExecutionTypeCode**
: Type du code utilisé (exemple: Code Postal, Code département, Code Commune etc..).

**lieuExecutionNom**
: Nom du lieu d'éxécution de la commande publique.

**codeDepartementExecution**
: Code du département d'éxécution de la commande publique.

**codeRegionExecution**
: Code de la région d'éxécution de la commande publique.

**libelleRegionExecution**
: Libellé de la région d'éxécution de la commande publique.


## Variable sur l'entité passant la commande publique, appelé Acheteur

**idAcheteur**
: SIREN de l'acheteur.

**sirenAcheteurValide**
: Booléenne. Le SIREN est il valide (Lien vers le calcul).

**nomAcheteur**
: Libellé de l'acheteur.

**codeRegionAcheteur**
: Code de la région de l'acheteur.

**libelleRegionAcheteur**
: Libelle de la région de l'acheteur.

**departementAcheteur**
: Code département de l'acheteur.

**libelleDepartementAcheteur**
: Libelle du département de l'acheteur.
 
**codePostalAcheteur**
: Code postal de l'acheteur.

**libelleArrondissementAcheteur**
: Libelle de l'arrondissement départemental de l'acheteur.

**codeArrondissementAcheteur**
: Code de l'arrondissement départemental de l'acheteur.

**libelleCommuneAcheteur**
: Libelle de la commune de l'acheteur.

**codeCommuneAcheteur**
: Code commune de l'acheteur.

**superficieCommuneAcheteur**
: Superficie de la commune de l'acheteur.

**populationCommuneAcheteur**
: Nombre d'habitant sur la commune de l'acheteur.

**geolocCommuneAcheteur**
: Géolocalisation de la commune de l'acheteur (format: Latitude, Longitude).
 

## Variable sur l'entité répondant la commande publique, appelé Etablissement

**typeIdentifiantEtablissement**
: Type d'identifiant de l'établissement (SIRET, TVA, TAHITI, RIDET, FRWF, UE, HORS-UE, IREP).

**siretEtablissement**
: SIRET de l'établissement.

**siretEtablissementValide**
: Booléenne. Le SIRET est il valide? (lien vers le calcul).

**sirenEtablissement**
: SIREN de l'établissement.

**nicEtablissement**
: NIC (Numéro Interne de Classement) de l'établissement. Correspond aux 5 derniers chiffres du SIRET.

**sirenEtablissementValide**
: Booléenne. Le SIREN est il valide? (lien vers le calcul).

**categorieEtablissement**
: Catégorie de l'établissement (PME, ETI, GE).

**denominationSocialeEtablissement**
: Libellé de l'établissement.

**codeRegionEtablissement**
: Code la région de l'établissement.
 
**libelleRegionEtablissement**
: Libellé de la région de l'établissement.

**libelleDepartementEtablissement**
: Libellé du département de l'établissement.

**departementEtablissement**
: Code du département de l'établissement.

**libelleArrondissementEtablissement**
: Libellé de l'arrondissement départemental de l'établissement.

**codeArrondissementEtablissement**
: Code de l'arrondissement départemental de l'établissement.

**codePostalEtablissement**
: Code postal de l'établissement.

**adresseEtablissement**
: Adresse de l'établissement.

**communeEtablissement**
: Libellé de la commune de l'établissement.

**codeCommuneEtablissement**
: Code commune de l'établissement.

**codeTypeEtablissement**
: TODO

**superficieCommuneEtablissement**
: Superficie de la commune de l'établissement.

**populationCommuneEtablissement**
: Nombre d'habitant sur la commune de l'établissement.

**distanceAcheteurEtablissement**
: Distance séparant l'acheteur de l'établissement en km (Calcul à mettre en lien).

**geolocCommuneEtablissement**
: Géolocalisation de la commune de l'établissement (format: Latitude, Longitude).
