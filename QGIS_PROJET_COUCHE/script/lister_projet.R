#################### Liste des couches contenues dans les projets QGS

# Récupérer la liste des fichiers QGS décompressés
list_qgs <- list.files(path = "result/",
                       pattern = ".qgs",
                       full.names = TRUE,
                       recursive = TRUE) %>%
                       as.data.frame() %>%
            rename.variable(".", "Chemin")

# Boucle de listing des projets couches contenues dans les projets QGS
nb_qgs <- count(list_qgs)

# Initialisation dataframe
liste_projet <- data.frame(PROJET = character())

# Recherche de la couche
recherche <- NULL

while (is_empty(recherche))
{
  recherche <- dlgInput("Saisir le nom de la couche à rechercher", default = "")$res  
}

for (i in 1: nb_qgs$n)
{
  # Fichiers QGZ à décompresser
  projet_qgs <- list_qgs$Chemin[i]
  
  # Parcours des projets à la recherche de la couche
  couche_sig <- read_html(projet_qgs) %>%
                html_nodes("layer-tree-layer") %>%
                html_attr("source") %>%
                as.data.frame() %>%
                # Suppression des couches dupliquées
                unique(.) %>%
                rename.variable(".", "couche") %>%
                filter(grepl(recherche, couche, fixed = TRUE))

  if (nrow(couche_sig) == 1)
  {
  # Liste des projets utilisant la couche
  liste_projet[i, ] <- list_qgz %>%
                       filter(grepl(str_sub(projet_qgs, 8, nchar(projet_qgs)-4), Chemin, fixed = TRUE))
  }
  
  # Suppression du fichier QGS traité
  file.remove(list_qgs$Chemin[i])
}

# Export des données
if(file.exists("result/liste_projet.csv") == TRUE)
{
  # Sauvegarde sous un autre nom si les programmes et lancé 2 fois pour optimiser la recherche
  # Le fichier contiendra la liste des projets du dossier 2
  write.table(liste_projet,
              file = "result/liste_projet2.csv",
              fileEncoding = "UTF-8",
              sep =";",
              row.names = FALSE)
} else
{
  write.table(liste_projet,
              file = "result/liste_projet.csv",
              fileEncoding = "UTF-8",
              sep =";",
              row.names = FALSE)
}
