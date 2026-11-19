# ============================================================
# data_check.R
# Purpose: load the dataset and check our main research question
# Main RQ: family_history (independent) vs treatment (dependent)
# ============================================================

library(tidyverse)

# Load the dataset
df <- read_csv("survey.csv")

# ---- Dataset overview ----
# Number of survey responses (rows)
print(nrow(df))

# All 27 column names
print(colnames(df))

# ---- Main research question: family_history vs treatment ----
# Counts: family_history down the side, treatment across the top
print(table(df$family_history, df$treatment))

# Group sizes (to check both groups are large enough)
print(table(df$family_history))

# Row percentages: % who sought treatment in each family_history group
print(round(prop.table(table(df$family_history, df$treatment), margin = 1) * 100, 1))