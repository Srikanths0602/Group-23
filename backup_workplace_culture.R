# Purpose: check backup research questions about workplace culture
# Backup 3: obs_consequence vs treatment
# Backup 4: wellness_program vs treatment
# Backup 5: anonymity vs treatment
# ============================================================

library(tidyverse)

df <- read_csv("survey.csv")

# ---- Backup 3: obs_consequence vs treatment ----
# "Have you heard of or observed negative consequences for coworkers
#  with mental health conditions in your workplace?"
print(table(df$obs_consequence, df$treatment))
print(round(prop.table(table(df$obs_consequence, df$treatment), margin = 1) * 100, 1))

# ---- Backup 4: wellness_program vs treatment ----
# "Has your employer ever discussed mental health as part of a wellness programme?"
print(table(df$wellness_program, df$treatment))
print(round(prop.table(table(df$wellness_program, df$treatment), margin = 1) * 100, 1))

# ---- Backup 5: anonymity vs treatment ----
# "Is your anonymity protected if you use mental health treatment resources?"
# Note: the "No" group is small (65 people)
print(table(df$anonymity, df$treatment))
print(round(prop.table(table(df$anonymity, df$treatment), margin = 1) * 100, 1))
