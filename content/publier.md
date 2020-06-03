
---
title: Publier les données essentielles d'attribution des marchés
slug: publier-donnees-essentielles-attribution
---

# Publier les données essentielles d'attribution des marchés

## Obligation légale

Depuis le 1<sup>er</sup> octobre 2018, les acheteurs publics doivent publier les données d’attribution de leur marché, et ce, au plus tard deux mois après la notification du marché.

## Structure des données à publier

La structure des données à publier est définie par des schémas de données aux formats XML et JSON (TODO lien vers la page schémas).

Pour en savoir plus sur la publication des données, consultez [le site de la direction des affaires juridiques](https://www.economie.gouv.fr/daj/ouverture-des-donnees-commande-publique), ainsi que [l’article de blog](https://www.data.gouv.fr/fr/posts/le-point-sur-les-donnees-essentielles-de-la-commande-publique/) consacré par data.gouv.fr à ce sujet.

## Publier des données par l’intermédiaire de l’API de data.gouv.fr

La documentation de l’API est [consultable en ligne](https://www.data.gouv.fr/fr/apidoc), le détails des propriétés des jeux de données est [visible sur cette page](https://www.data.gouv.fr/fr/apidoc/#!/datasets/create_dataset).

Afin de faciliter la localisation et donc l’utilisation des données essentielles, la publication de ces données doit respecter une certaine structure. Les deux structures proposées sont les suivantes :

1. Structure **plateforme** : un jeu de données (`dataset` dans l’API) par plateforme de marchés (identifiée par son SIRET) ;
2. Structure **acheteur** : un jeu de données par acheteur public (SIRET).

### Jeu de données

Pour des raisons d’archivage, le téléversement des fichiers de données sur data.gouv.fr est fortement préféré par rapport à un lien vers des serveurs externes.

Une fois que le jeu de données a été créé, vous pouvez y ajouter des `ressources` ([API ressource](https://www.data.gouv.fr/fr/apidoc/#!/datasets/upload_new_dataset_resource)).

Exemple de commande :

```bash
curl --request POST --url https://data.gouv.fr/api/1/datasets/<dataset-id>/upload/ --header ’content-type: multipart/form-data’ --header ’x-api-key: <api-key>’ --form "file=<chemin du fichier à téléverser>"
```

#### Nom (`title` dans l’API)

Le nom du jeu de données dépend de la structure choisie pour la publication :

- jeu de données pour une **plateforme** : Données essentielles des marchés publics - `{nom de la plateforme}`;
- jeu de données pour un **acheteur** : Données essentielles des marchés publics - `{nom de l’acheteur}`.

Exemple :

> Données essentielles des marchés publics - Conseil régional de Bretagne

#### Description (`description`)

La description attendue est un texte générique décrivant le contexte de publication des données essentielles, ainsi que quelques liens utiles. Le texte suivant remplit ces conditions et peut être étendu par le producteur, notamment avec un lien vers l’interface de visualisaton de données du profil d’acheteur concerné.

[L’arrêté du 14 avril 2017](https://www.legifrance.gouv.fr/eli/arrete/2017/4/14/ECFM1637256A/jo/texte) impose à tous les acheteurs publics la publication des données essentielles de la commande publique. Ainsi, depuis le 1er octobre 2018, les acheteurs publics doivent publier les données d’attribution au plus tard deux mois après la notification du marché sur leur profil d'acheteur.

La structure des données est définie par [des schémas XML et JSON](https://github.com/139bercy/format-commande-publique) qui appliquent les exigences réglementaires.

Pour plus d’informations, vous pouvez consulter [la page thématique](https://www.economie.gouv.fr/daj/ouverture-des-donnees-commande-publique) sur le site de la Direction des Affaires Juridiques.

#### Mot-clés (`tags`)

Renseignez les mot-clés suivants :

- `données-essentielles` ;
- `commande-publique`.

#### Extras (`extras`)

Si le jeu de données est spécifique à un **acheteur** et non à une plateforme, ajoutez une propriété `siret` à la propriété `extras` de l’objet `Dataset`, et indiquez le SIRET de l’acheteur.

```
{
    "title": "Données essentielles des marchés publics - Conseil régional de Bretagne"
    …
    "extras": {
        "siret": "89764547841001"
}
```

Si le jeu de données est spécifique à une **plateforme**, ne renseignez pas la propriété `extras`.

#### Licence (`license`)

La licence à renseigner est la [licence ouverte](https://www.etalab.gouv.fr/wp-content/uploads/2014/05/Licence_Ouverte.pdf) : `fr-lo`.

#### Organisation (`organization`)

Ajoutez votre identifiant d’organisation data.gouv.fr. L’utilisateur qui publie les données doit appartenir à cette organisation.

#### Fréquence (`frequency`)

Renseignez la fréquence de la publication des mises à jour.

### Ressource

#### Nom du fichier

Format : DECP-`{SIRET}`-`{année}`-`{mois}`-`{jour}`-`{numéro de séquence}`.`{extension}`

- `DECP` pour « données essentielles de la commande publique » ;
- `siret` : SIRET de la plateforme si structure plateforme, sinon SIRET de l’acheteur ;
- `année` : année de la publication sur data.gouv.fr ;
- `mois` : mois de la publication sur data.gouv.fr ;
- `jour` : jour de la publication sur data.gouv.fr ;
- `numéro de séquence` : numéro de séquence du fichier à incrémenter si plusieurs fichiers sont publiées dans la même journée. Le premier numéro est `01` ;
- `extension` : `xml` ou `json` en fonction du format de publication. Il n’est pas obligatoire de publier les données à la fois en XML et en JSON, un seul des deux formats suffit.

Exemple :

> DECP-89764547841001-2018-11-28-01.xml

#### URL (`url`)

L’URL n’est renseignée que si le fichier n’est pas téléversé sur data.gouv.fr et hébergé sur un serveur externe.

#### Nom (`title` dans l’API)

Identique au nom de fichier.

#### Type de fichier (`filetype`)

- `xml` pour du XML ;
- `json` pour du JSON.

#### Type MIME (`mime`)

- `application/xml` pour du XML ;
- `application/json` pour du JSON.

#### Type de ressource (`type`)

Renseignez `main`.

