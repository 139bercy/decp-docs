---
title: Publier ses données essentielles via API
slug: publier-donnees-essentielles-attribution
weight: 3
---

La documentation de l’API data.gouv.fr est [consultable en ligne](https://www.data.gouv.fr/fr/apidoc), de même que le [détail des propriétés](https://www.data.gouv.fr/fr/apidoc/#!/datasets/create_dataset).

Afin de faciliter la localisation et donc l’utilisation des données essentielles, la publication de ces données doit respecter une certaine structure. Les deux structures proposées sont les suivantes :

- Structure **plateforme** : un jeu de données (`dataset` dans l’API) par plateforme de marchés (identifiée par son SIRET), adapté à la publication par une plateforme des données de ses clients ou adhérents ;
- Structure **acheteur** : un jeu de données par acheteur public (SIRET), adapté à la publication par un acheteur de ses propres données.

### Jeu de données

Pour des raisons d’archivage, le téléversement des fichiers de données sur data.gouv.fr est fortement préféré par rapport à un lien vers des serveurs externes. Une fois que le jeu de données a été créé, vous pouvez y ajouter des `ressources` ([API ressource](https://www.data.gouv.fr/fr/apidoc/#!/datasets/upload_new_dataset_resource)).

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

