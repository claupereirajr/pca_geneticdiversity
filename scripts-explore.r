#
# Install Packages
pacotes <- c("plotly", "tidyverse", "knitr", "kableExtra", "car", "rgl", "gridExtra",
             "PerformanceAnalytics", "reshape2", "rayshader", "psych", "pracma",
             "polynom", "rqPen", "ggrepel", "factoextra", "sp", "tmap", "magick",
             "readxl", "pca3d")

if (sum(as.numeric(!pacotes %in% installed.packages())) != 0) {
  instalador <- pacotes[!pacotes %in% installed.packages()]
  for (i in 1:length(instalador)) {
    install.packages(instalador, dependencies = T)
    break
  }
  sapply(pacotes, require, character = T)
} else {
  sapply(pacotes, require, character = T)
}

# import dataset #
df_genes <- read.csv("genetic_dataset.csv", header = T, sep = ",")
view(df_genes)

# sacale #
df_scaled <- scale(df_genes[, -1:-2], center = T)
df_scaled

# vizualization #
pca1 <- princomp(df_scaled)
pca1
summary(pca1)
biplot(pca1)

pca2 <- prcomp(df_scaled)
pca2
summary(pca2)
