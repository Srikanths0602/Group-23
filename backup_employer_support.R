# backup_employer_support.R
# Purpose: check backup research questions about employer support
# Backup 1: care_options vs treatment
# Backup 2: benefits vs treatment
library(tidyverse)
df <- read_csv("survey.csv")
print(table(df$care_options, df$treatment))
print(round(prop.table(table(df$care_options, df$treatment), margin = 1) * 100, 1))
print(table(df$benefits, df$treatment))
print(round(prop.table(table(df$benefits, df$treatment), margin = 1) * 100, 1))
