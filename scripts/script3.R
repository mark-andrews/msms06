library(tidyverse)
library(msmsr)

m1 <- lm(Fertility ~ Education, data = swiss)
m2 <- lm(Fertility ~ Education + Catholic, data = swiss)
m3 <- lm(Fertility ~ Education + Catholic + Infant.Mortality + Agriculture, data = swiss)

# likelihood ratio test comparing m1 and m2
lrt(m1, m2)

# -2 * log(L1/L2)
# 2 * log(L2/L1)
lrt_statistic <- -2 * (logLik(m1) - logLik(m2)) # likelihood ratio
pchisq(lrt_statistic, df = 1, lower.tail = FALSE)

# F test
anova(m1, m2)

lrt(m2, m3)
anova(m2, m3)

# Non-nested models -------------------------------------------------------
m_edu <- lm(Fertility ~ Education, data = swiss)
m_cath <- lm(Fertility ~ Catholic, data = swiss)
m_agri <- lm(Fertility ~ Agriculture, data = swiss)

anova(m_edu, m_cath) # this does not make sense
lrt(m_edu, m_cath) # and this does not make sense

# model comparison
model_table(Education = m_edu, Catholic = m_cath, Agriculture = m_agri)


# models to compare; doesn't matter if any one is nested in any other
formulas <- list(
  m1 <- Fertility ~ Education,
  m2 <- Fertility ~ Education + Catholic,
  m3 <- Fertility ~ Education + Catholic + Infant.Mortality,
  m4 <- Fertility ~ Education + Catholic + Agriculture,
  m5 <- Fertility ~ Education + Catholic + Infant.Mortality + Agriculture
)
