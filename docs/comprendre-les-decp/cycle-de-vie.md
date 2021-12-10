# Cycle de vie des DECP <!-- {docsify-ignore-all} -->

Cette page décrit le cycle de vie des DECP, depuis les systèmes d'informations des acheteurs publics jusqu'aux plateformes Open Data telles que *data.gouv.fr*.

### Remontée des données des acheteurs publics jusqu'à la plateforme *data.gouv.fr*

[filename](./cycle-de-vie-diagram-pre.html ':include')

Les DECP peuvent être remontées par deux principales voies :
* Voie "PES Marché" :
    1. Le SI Financier de l'acheteur remonte les marchés jusqu'à la DGFiP par le PES Marché ;
    2. La DGFiP publie ensuite les marchés sur *data.gouv.fr* par l'API.
* Voie "AIFE" :
    1. Le profil acheteur (PLACE ou autre) du SI Achats de l'acheteur remonte les marchés jusqu'à l'AIFE par l'API AIFE ;
    2. L'AIFE publie ensuite les marchés sur *data.gouv.fr* par l'API.
A la marge, certains acheteurs remontent directement leurs DECP vers *data.gouv.fr* sans passer par la voie AIFE ou PES Marché. Ces flux ne figurent pas sur le schéma.

### Consolidation et traitements ultérieurs à la remontée sur *data.gouv.fr*

[filename](./cycle-de-vie-diagram-post.html ':include')

Les données remontées sont déposées sur *data.gouv.fr* dans plusieurs sources. Deux processus viennent y puiser les données pour des traitements supplémentaires :
1. Un premier processus, *decp-rama*, consolide toutes les sources en un seul fichier déposé à nouveau sur *data.gouv.fr* ;
2. Un second processus, *decp-augmente*, enrichit ce fichier consolidé d'informations supplémentaires à l'aide de sources externes, et opère une mise en qualité. Le résultat est déposé sur *data.gouv.fr* et *data.economie.gouv.fr*.