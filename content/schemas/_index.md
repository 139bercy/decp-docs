---
title: "Schémas de données"
date: 2020-05-05T12:57:45+02:00
weight: 2
chapter: true
---

### Schémas réglementaires nationaux

Traduction technique des [textes réglementaires]({{< ref "/" >}}), les schémas de données reprennent la distinction entre marchés publics et contrats de concessions. Publiés aux formats JSON et XML, ceux-ci sont accessibles dans un dépôt dédié : [139bercy/format-commande-publique](https://github.com/139bercy/format-commande-publique).

| versions | texte réglementaire | JSON | XML |
|--|--|--|--|
| dernière | à jour | <https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/latest/marches.json> | non disponible pour le schéma XML ([#46](https://github.com/139bercy/format-commande-publique/issues/46#issuecomment-628710331)) |
| 1.5.0 | arrêté du 22 mars 2019 | <https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/1.5.0/marches.json> | https://raw.githubusercontent.com/etalab/format-commande-publique/master/marches.xsd |
| 1.4.0  | arrêté modificatif du 27 juillet 2018 | <https://schema.data.gouv.fr/schemas/139bercy/format-commande-publique/1.4.0/marches.json> | <https://raw.githubusercontent.com/139bercy/format-commande-publique/7655b975a208bd9f5adb7e1f9d6fa2dd5475b919/marches.xsd>

#### Marchés publics

- identifiant du marché
- objet
- montant HT forfaitaire ou estimé maximum
- procédure utilisée (Procédure adaptée, Appel d'offres ouvert, Appel d'offres restreint, Procédure avec négociation, Dialogue compétitif, Marchés publics passés sans publicité ni mise en concurrence préalables)
- acheteur
  - SIRET de l'acheteur
  - nom de l'acheteur
- titulaires du marché
  - identifiant du titulaire
  - type d'identifiant du titulaire (SIRET, TVA, TAHITI, RIDET, FRWF, UE, HORS-UE, IREP)
  - nom du titulaire
- nature du marché (Marché, Accord-cadre, Marché subséquent, Marché de partenariat)
- durée du marché (en mois)
- code [*Common Procurement Vocabulary* (CPV)](https://www.collectivites-locales.gouv.fr/commande-publique/acces-la-nomenclature-europeenne), vocabulaire communautaire pour les marchés publics de l'Union européenne
- forme du prix (Ferme, Révisable, Ferme et actualisable)
- lieu principal d'exécution
  - nom du lieu d'exécution
  - code du lieu d'exécution
  - type de code utilisé (Code commune, Code canton, Code arrondissement, Code département, Code région, Code pays, Code postal)
- date de publication des données
- date de la notification de l'attribution
- modifications
  - objet de la modification
  - de montant
  - de titulaires
  - de durée
  - date de publication des données de modification
  - date de notification de la modification

#### Contrats de concessions

- identifiant du contrat de concession
- objet
- autorité concédante
  - SIRET de l'autorité concédante
  - nom de l'autorité concédante
- nature du contrat de concession (Concession de travaux, Concession de service, Concession de service public, Délégation de service public)
- procédure (Procédure négociée ouverte, Procédure non négociée ouverte, Procédure négociée restreinte, Procédure non négociée restreinte)
- lieu principal d'exécution
  - nom du lieu d'exécution
  - code du lieu d'exécution
  - type de code utilisé (Code commune, Code canton, Code arrondissement, Code département, Code région, Code pays, Code postal)
- valeur globale
- durée (en mois)
- montant des subventions publiques
- données d'exécution
  - données annuelles
    - date de publication des données d'exécution
    - montant des dépenses d'investissement
    - tarifs pratiqués
       - intitulé du tarif
       - montant du tarif
- concessionnaires
  - identifiant du concessionnaire
  - type d'identifiant du concessionnaire (SIRET, TVA, TAHITI, RIDET, FRWF, UE, HORS-UE, IREP)
  - nom de chaque concessionnaire
- date de la signature
- date du début d'exécution
- date de publication des données
- modifications
  - objet de la modification
  - de montant
  - de titulaires
  - de durée
  - date de publication des données de modification
  - date de notification de la modification

### Schémas standards internationaux

Les données sont également publiées selon le standard [Open Contracting Data Standard](https://standard.open-contracting.org/latest/fr/) pour permettre la comparaison et l'exploitation des données à l'échelle internationale. À ce jour, seules les données initiales d'attribution sont publiées au format OCDS, les modifications (montant, titulaires, durée) n'étant pas incluses. Les données d'attributions modifiées une fois ou plus représentent moins de 1% de l'ensemble des commandes.

