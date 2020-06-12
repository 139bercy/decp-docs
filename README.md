# decp-docs

Documentation de la collecte et de la publication des données essentielles de la commande publique (DECP)

## Cloner le dépôt

Ce dépôt référence un submodule, le thème Ace. Pour récupérer l'ensemble des fichiers nécessaires au bon fonctionnement du site :

```
git clone https://github.com/139bercy/decp-docs.git --recursive
```

Pour télécharger le thème Ace si vous avez cloné le dépôt sans l'option `--recursive` :

```
git submodule update --init
```

## Génération du site

1. [Installer Hugo extended](https://gohugo.io/getting-started/installing/)
2. Lancer `hugo -D` pour simplement générer le site statique, ou `hugo server -D` pour lancer un server HTTP local

Le site statique est créé dans `/public`.
