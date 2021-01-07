# Students dataset analysis

# Need to install ggplot2
# install.packages("ggplot2")

# Chargement de la librairie Ggplot2
library(ggplot2)

# Lecture du fichier csv
students <- read.csv(file = 'dataset/students.csv', sep = ";", header=TRUE)
head(students)

class(students$admit) #integer => need to be a boolean
class(students$gre) #integer
class(students$gpa) #numeric
class(students$rank) #integer


# Nuage de points
# ggplot(students, aes(x=gpa, y=gre)) +
#   geom_point(aes(color = admit, shape = rank)) +
#   theme_minimal()

###-- Boxplot --###

## GRE
ggplot(students) +
  geom_boxplot(aes(factor(admit), gre))
## GPA
ggplot(students) +
  geom_boxplot(aes(factor(admit), gpa))

