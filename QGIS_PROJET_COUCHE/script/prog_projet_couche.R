###########################################################################
# Ce script permet de lister les projets QGIS avec l'extension QGZ        #
# utilisant une couche spécifique.                                        #
###########################################################################
# Fonctionnement :                                                        #
#     1. Lancer le script                                                 #
#     2. Indiquer le dossier contenant les fichiers QGZ                   #
#     3. Saisir le nom de la couche faisant l'objet d'une recherche       #
#                                                                         #
# Résultat :                                                              #
#     Le fichier contenant la liste des couches se trouve dans le dossier #
# "result" et se nomme "liste_projet"                                     #
#                                                                         #
#     Si un fichier "liste_projet est déjà existant le résulta sera nommé #
# "liste_projet2". Cela permet d'optimiser la recherche si celle-ci se    #
# concentre sur 2 dossiers ne faisantpas partie de la même arborescence.  #
# ATTENTION : il faut lancer le programme 2 fois.                         #
# A défaut lancer sur toute l'arborescence.                               #
#                                                                         #
###########################################################################


#################### chargement des librairies

source("./script/librairie.R")

#################### Suppression des fichiers gitkeep

source("script/suppression_gitkeep.R")

#################### Lister les projets GQZ dans une arborescence

source("./script/lister_qgz.R")

#################### Liste des couches contenues dans les projets QGS

source("./script/lister_projet.R")
