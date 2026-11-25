# ============================================================
# Visualisation.R
# Group 23 - ds349, survey.csv (Mental Health in Tech Survey)
#
# RQ: Among employees of tech companies, is there a difference in the
#     proportion who have sought mental health treatment among those who
#     know their employer's mental health care options, those who do not,
#     and those who are not sure?
#
# Dependent variable:   treatment    (nominal: Yes/No)
# Independent variable: care_options (nominal: Yes/No/Not sure)
#
# H0: There is no difference in the proportion who have sought treatment
#     among the three care_options groups.
# H1: There is a difference in the proportion who have sought treatment
#     among the three care_options groups.
# ============================================================

library(tidyverse)

# Load the dataset
df <- read_csv("survey.csv")

# ---- SLIDE 3: number of rows in the full dataset ----
print(nrow(df))   # expected: 1259

# ---- SLIDE 3: filter the data in R (not in Excel) ----
# Keep only employees (remove self-employed)
df_tech <- subset(df, self_employed == "No")

# Keep only those whose employer is a tech company
df_tech <- subset(df_tech, tech_company == "Yes")

print(nrow(df_tech))   # expected: 883

# ---- SLIDE 3: sample of the data (first 5 rows of the columns we use) ----
print(head(df_tech[, c("self_employed", "tech_company", "care_options", "treatment")], 5))

# ---- SLIDE 6: contingency table ----
# Dependent variable (treatment) as rows, independent (care_options) as columns
care_table <- table(df_tech$treatment, df_tech$care_options)
print(care_table)

# Group sizes for each care_options answer (column totals)
print(table(df_tech$care_options))

# Number who did / did not seek treatment (row totals)
print(table(df_tech$treatment))

# ---- SLIDE 4: percentages within each care_options group ----
# margin = 2 makes each column (each care_options group) add up to 100%
care_pct <- prop.table(care_table, margin = 2) * 100
print(round(care_pct, 1))

# ---- SLIDE 4: normalised stacked bar chart, saved as a PNG file ----
cols <- c("grey80", "steelblue")

png("care_options_treatment.png", width = 900, height = 650)

barplot(care_pct,
        col = cols,
        names.arg = c("No", "Not sure", "Yes"),
        main = "Sought mental health treatment by knowledge of care options (tech-company employees, n = 883)",
        xlab = "Knows employer's mental health care options",
        ylab = "Percentage of employees (%)",
        ylim = c(0, 130))

legend("topright",
       legend = c("Did not seek treatment", "Sought treatment"),
       fill = cols,
       bty = "o",
       bg = "white",
       box.col = "black",
       cex = 0.9)

dev.off()

# ---- SLIDE 7: chi-square test ----
# Tests whether treatment and care_options are independent (H0)
result <- chisq.test(care_table)
print(result)

# Expected counts (chi-square needs each expected count to be at least 5)
print(round(result$expected, 1))