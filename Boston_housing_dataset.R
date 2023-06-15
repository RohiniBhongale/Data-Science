# Load required packages
library(MASS)
install.packages("ggplot2")
library(ggplot2)
library(dplyr)
install.packages("tidyr")

# Load the Boston Housing dataset
data(Boston)

# View the first few rows of the dataset
head(Boston)

# Display summary statistics of the dataset
summary(Boston)

# Show the structure of the dataset
str(Boston)

# Explore the distribution of the target variable (medv)
ggplot(Boston, aes(x = medv)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Median Home Value",
       x = "Median Home Value (in $1000s)", y = "Frequency")


# Explore the relationship between variables
ggplot(Boston, aes(x = lstat, y = medv)) +
  geom_point(color = "blue") +
  labs(title = "Lower Status of the Population vs. Median Home Value",
       x = "Lower Status of the Population (%)", y = "Median Home Value (in $1000s)")


install.packages("tidyverse")
library(tidyverse)


correlation_matrix <- cor(Boston)

# Convert correlation matrix to long format
correlation_df <- as.data.frame(as.table(correlation_matrix)) %>%
  rename(Var1 = Var1, Var2 = Var2, value = Freq)


head(correlation_df)


# Create correlation matrix plot
ggplot(data = correlation_df, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Correlation Matrix")
