Fichier `students.csv`

Chargement des données:
```R
students <- read.table("students.csv", sep = ";", header=TRUE)
```

On cherche à modéliser l'admission (variable `admit`: `1` pour 'oui', `0` pour 'non') de potentiels étudiants dans une université américaine en fonction de leurs résultats scolaires au lycée (variables `gre`, `gpa`, `rank`).

Question : Peut-on prédire l'admission en fonction des résultats au lycée ?
