---
title: Format final des DECP
# slug: decp_augmente
weight: 9
---

Dans cette partie sera repertorié l'ensemble des 68 variables composants le jeu de données DECP, tel qu'accessible sur [data économie](https://data.economie.gouv.fr/explore/dataset/decp_augmente/table/). Ces variables sont ici "triées" par catégorie pour une meilleure lisibilité et compréhension de ces dernières. 

### Descriptif de la commande publique
**id** : Identifiant métier de la commande publique. <br>
**idMarche** : Identifiant technique de la commande publique (unique à une commande). <br>
**source** : Provenance de la donnée (Voir la page dédiée à cela/mettre une ref). <br>
**type** : Type de commande publique (Marché ou Contrat de Concession). <br>
**natureObjetMarche** : Services / Fournitures / Travaux. <br>
**objetMarche** : Descriptif complet de la commande publique. <br>
**codeCPV_Original** : Code [CPV](https://simap.ted.europa.eu/fr/cpv) brut, non retravaillé. <br>
**codeCPV** : Code CPV retravaillé, avec clef de vérification. <br>
**codeCPV_division** : Division de la commande publique. <br>
**referenceCPV** : Libellé du code CPV. <br>
**nature** : nature de la commande publique (Marché, Accord-cadre, Marché subséquent, Marché de partenariat). <br>
**accord-cadrePresume** : Variable booléenne. La commande publique est elle un accord cadre ? Variable calculée. <br>
**procedure** : Type de procédure utilisée (Procédure adaptée, Appel d'offres ouvert, Appel d'offres restreint, Procédure avec négociation, Dialogue compétitif, Marchés publics passés sans publicité ni mise en concurrence préalables). <br>

### Variable temporelle
**dateNotification** : Date à laquelle la commande publique a été notifiée (exemple: 1 janvier 2021). <br>
**anneeNotification** : Année de la notification de la commande publique (exemple 2021). <br>
**moisNotification** : Mois de la notificationde la commande publique (exemple: 01). <br>
**datePublicationDonnees** : Date à laquelle les données relatives à la commande publique ont été publiées (exemple: 1 janvier 2021). <br>
**dureeMois** : Durée de la commande publique en mois. Variable déclarative, brute. <br>
**dureeMoisEstimee** : Variable boléenne. La durée de mois a t-elle été recalculée ? <br>
**dureeMoisCalculee** : Durée de la commande publique en mois, après correction. <br>
 
### Variable sur les montants
**montantOriginal** : Montant de la commande publique. Variable déclarative, brute. <br>
**nombreTitulaireSurMarchePresume** : Nombre de titulaires sur la commande publique. Cette variable a été calculée. (lien vers le calcul). <br>
**montantCalcule** : Montant de la commande publique, après correction. <br>
**formePrix** :Ferme, Révisable, Ferme et actualisable. <br>
 
### Localisation sur l'execution de la commande publique.
**lieuExecutionCode** : Code du lieu d'éxécution de la commande publique. Attention, variable non homogène. <br>
**lieuExecutionTypeCode** : Type du code utilisé (exemple: Code Postal, Code département, Code Commune etc..). <br>
**lieuExecutionNom** : Nom du lieu d'éxécution de la commande publique. <br>
**codeDepartementExecution** : Code du département d'éxécution de la commande publique. <br>
**codeRegionExecution** : Code de la région d'éxécution de la commande publique. <br>
**libelleRegionExecution** : Libellé de la région d'éxécution de la commande publique. <br>

## Variable sur l'entité passant la commande publique, appelé Acheteur

**idAcheteur** : SIREN de l'acheteur. <br>
**sirenAcheteurValide** : Booléenne. Le SIREN est il valide (Lien vers le calcul). <br>
**nomAcheteur** : Libellé de l'acheteur. <br>
**codeRegionAcheteur** : Code de la région de l'acheteur. <br>
**libelleRegionAcheteur** : Libelle de la région de l'acheteur. <br>
**departementAcheteur** : Code département de l'acheteur. <br>
**libelleDepartementAcheteur** : Libelle du département de l'acheteur. <br> 
**codePostalAcheteur** : Code postal de l'acheteur. <br>
**libelleArrondissementAcheteur** : Libelle de l'arrondissement départemental de l'acheteur. <br>
**codeArrondissementAcheteur** : Code de l'arrondissement départemental de l'acheteur. <br>
**libelleCommuneAcheteur** : Libelle de la commune de l'acheteur. <br>
**codeCommuneAcheteur** : Code commune de l'acheteur. <br>
**superficieCommuneAcheteur** : Superficie de la commune de l'acheteur. <br>
**populationCommuneAcheteur** : Nombre d'habitant sur la commune de l'acheteur. <br>
**geolocCommuneAcheteur** : Géolocalisation de la commune de l'acheteur (format: Latitude, Longitude). <br> 

## Variable sur l'entité répondant la commande publique, appelé Etablissement
**typeIdentifiantEtablissement** : Type d'identifiant de l'établissement (SIRET, TVA, TAHITI, RIDET, FRWF, UE, HORS-UE, IREP). <br>
**siretEtablissement** : SIRET de l'établissement. <br>
**siretEtablissementValide** : Booléenne. Le SIRET est il valide? (lien vers le calcul). <br>
**sirenEtablissement** : SIREN de l'établissement. <br>
**nicEtablissement** : NIC (Numéro Interne de Classement) de l'établissement. Correspond aux 5 derniers chiffres du SIRET. <br>
**sirenEtablissementValide** : Booléenne. Le SIREN est il valide? (lien vers le calcul). <br>
**categorieEtablissement** : Catégorie de l'établissement (PME, ETI, GE). <br>
**denominationSocialeEtablissement** : Libellé de l'établissement. <br>
**codeRegionEtablissement** : Code la région de l'établissement. <br> 
**libelleRegionEtablissement** : Libellé de la région de l'établissement. <br>
**libelleDepartementEtablissement** : Libellé du département de l'établissement. <br>
**departementEtablissement** : Code du département de l'établissement. <br>
**libelleArrondissementEtablissement** : Libellé de l'arrondissement départemental de l'établissement. <br>
**codeArrondissementEtablissement** : Code de l'arrondissement départemental de l'établissement. <br>
**codePostalEtablissement** : Code postal de l'établissement. <br>
**adresseEtablissement** : Adresse de l'établissement. <br>
**communeEtablissement** : Libellé de la commune de l'établissement. <br>
**codeCommuneEtablissement** : Code commune de l'établissement. <br>
**codeTypeEtablissement** : ??
**superficieCommuneEtablissement** : Superficie de la commune de l'établissement. <br>
**populationCommuneEtablissement** : Nombre d'habitant sur la commune de l'établissement. <br>
**distanceAcheteurEtablissement** : Distance séparant l'acheteur de l'établissement en km (Calcul à mettre en lien). <br>
**geolocCommuneEtablissement** : Géolocalisation de la commune de l'établissement (format: Latitude, Longitude). <br>