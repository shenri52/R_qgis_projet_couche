# Script R : qgis_projet_couche

Ce script permet de lister les projets QGIS avec l'extension QGZ utilisant une couche spécifique.

## Descriptif du contenu

* Racine : emplacement du projet R --> "QGIS_PROJET_COUCHE.Rproj"
* Un dossier "result" pour le stockage du résultat
* Un dosssier script qui contient :
  * prog_couche_projet_qgis.R --> script principal
  * librairie.R --> script contenant les librairies utiles au programme
  * lister_qgz --> script listant les fichiers QGZ dans l'arborescence choisie
  * lister_couche.R --> script listant les projets QGZ utilisant une couche spécifique
  * suppression_gitkeep.R --> script de suppression des .gitkeep

## Fonctionnement

1. Lancer le script intitulé "prog_projet_couche" qui se trouve dans le dossier "script"
2. Indiquer le dossier contenant les fichiers QGZ
3. Saisir le nom de la couche faisant l'objet de la recherche
4. Saisir le nom du fichier résultat

## Résultat
;
Le fichier contenant la liste des couches se trouve dans le dossier "result" et sera nommé en fonction du nom que vous avez saisi.
