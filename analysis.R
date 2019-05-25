# Workbook 6: analyze NHANES data

# Set up
library(foreign)
library(survey)
library(Hmisc)
library(dplyr)

demo <- sasxport.get("DEMO_I.XPT")
alc <- sasxport.get("ALQ_I.XPT")

nhanes <- left_join(demo, alc, by = "seqn")

nhanes <- nhanes %>%
  mutate( alq151 = replace(alq151, alq151 == 2, 0), 
          alq151 = replace(alq151, alq151 == 7 | alq151 == 9, NA))

sum(nhanes$wtint2yr)

nhanes_design <- svydesign(
  weights = ~wtint2yr,
  data = nhanes,
  id = ~sdmvpsu,
  strata = ~sdmvstra,
  nest = TRUE
)

svymean(~alq151, nhanes_design, na.rm = T)

svyby(~alq151, ~riagendr, nhanes_design, svymean, na.rm = T)
