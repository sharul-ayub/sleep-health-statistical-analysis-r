# 02_data_cleaning.R

# Load dataset
sleep_data <- read.csv("data/Sleep_Health.csv")

# Redefine variable types
sleep_data$Person.ID <- as.character(sleep_data$Person.ID)
sleep_data$Gender <- as.factor(sleep_data$Gender)
sleep_data$Age <- as.integer(sleep_data$Age)
sleep_data$Occupation <- as.factor(sleep_data$Occupation)
sleep_data$Sleep.Duration <- as.numeric(sleep_data$Sleep.Duration)
sleep_data$Quality.of.Sleep <- as.integer(sleep_data$Quality.of.Sleep)
sleep_data$Physical.Activity.Level <- as.integer(sleep_data$Physical.Activity.Level)
sleep_data$Stress.Level <- as.integer(sleep_data$Stress.Level)
sleep_data$Heart.Rate <- as.integer(sleep_data$Heart.Rate)
sleep_data$Sleep.Disorder <- as.factor(sleep_data$Sleep.Disorder)

# Rename dataset
dt.sleep1 <- sleep_data

# Replace -1 with NA
dt.sleep1[dt.sleep1 == -1] <- NA

# Detect rows with missing values
rows_with_na <- dt.sleep1[!complete.cases(dt.sleep1), ]
print(rows_with_na)

# Total missing rows
total_missing_rows <- nrow(rows_with_na)
print(total_missing_rows)

# Remove missing values
dt1_cleaned <- na.omit(dt.sleep1)

# Confirm no missing values
sum(is.na(dt1_cleaned))

# Clean factor levels
dt1_cleaned$Gender <- as.factor(as.character(dt1_cleaned$Gender))

# Summary and dimensions
summary(dt1_cleaned)
dim(dt1_cleaned)

# Descriptive statistics
library(psych)
describe(dt1_cleaned)

# Optional: save cleaned data for next scripts
saveRDS(dt1_cleaned, "data/dt1_cleaned.rds")
