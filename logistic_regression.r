library(ggplot2)
library(broom)
library(forestmodel)
library(effects)
library(ggeffects)

students <- read.table(file = "dataset/students.csv", sep = ";", header=TRUE)
head(students)

class(students) # Data Frame

students$admitBool <- FALSE
students$admitBool[students$admit == 1] <- TRUE
head(students)

lapply(students, levels) # No levels in students data frame

reg <- glm(admitBool ~ gre + gpa + rank, data = students, family = binomial(logit))
summary(reg)

# Odds ratio
exp(coef(reg))

#Trust interval
exp(confint(reg))

# Odds ratio & Trust Interval binded
exp(cbind(coef(reg), confint(reg)))

tmp <- tidy(reg, conf.int = TRUE, exponentiate = TRUE)
ggplot(tmp) +
  aes(x = estimate, y = term, xmin = conf.low, xmax = conf.high) +
  geom_vline(xintercept = 1) +
  geom_errorbarh() +
  geom_point() +
  scale_x_log10()

forest_model(reg)
plot(allEffects(reg))

plot(ggeffect(reg, "gre"))
plot(ggeffect(reg, "gpa"))
plot(ggeffect(reg, "rank"))

students.pred <- predict(reg, type = "response", newdata = students)
head(students.pred)

# Confusion Matrix
table(students.pred > 0.5, students$admit)

### Significative variables

library(stats)

drop1(reg,test = "Chisq")