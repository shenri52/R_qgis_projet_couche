#################### Liste des couches contenues dans les projets QGS

# Recherche de la couche
recherche <- NULL

while (is_empty(recherche))
{
  recherche <- dlgInput("Saisir le nom de la couche à rechercher", default = "")$res  
}

# Dossier de recherche pour personnaliser le nom
nom_dossier <- NULL

while (is_empty(nom_dossier))
{
  nom_dossier <- dlgInput("Nom du dossier pour personnaliserle nom du fichier", default = "")$res  
}

# Initialisation liste
num_liste <- 1
liste_projet <- data.frame(PROJET = character())

# Décompression et vérification du contenu
for (i in 1: nrow(list_qgz))
{
  # Fichiers QGZ à décompresser
  zip_fichier <- list_qgz$Chemin[i]
  
  # Création d'une liste du fichiers QGS contenu dans les fichiers QGZ à décompresser
  zip_qgs <- grep('\\.qgs$', unzip(zip_fichier, list=TRUE)$Name, ignore.case=TRUE, value=TRUE)
  
  # Décompression du QGS contenu dans les QGZ
  unzip(zip_fichier, files=zip_qgs, exdir = "result/")

  # Parcours du QGS à la recherche de la couche
  couche_sig <- read_html(paste("result/", zip_qgs, sep ="")) %>%
                html_nodes("layer-tree-layer") %>%
                html_attr("source") %>%
                as.data.frame() %>%
                # Suppression des couches dupliquées
                unique(.) %>%
                rename.variable(".", "couche") %>%
                filter(grepl(recherche, couche, fixed = TRUE))
  
  # Liste des projets utilisant la couche
  if (nrow(couche_sig) > 0)
  {
  liste_projet[num_liste, ] <- zip_fichier
  num_liste <- num_liste+1
  }
  
  # Suppression du fichier QGS traité
  file.remove(paste("result/", zip_qgs, sep =""))
  
}

# Export des données
write.table(liste_projet,
            file = paste("result/",
                         paste(nom_dossier, ".csv", sep =""),
                         sep = ""),
            fileEncoding = "UTF-8",
            sep =";",
            row.names = FALSE)