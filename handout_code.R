# =============================================================================
# Intro to R and RStudio (with tidyverse): the handout as an R script
#
# This file holds the same code as handout.qmd, but as a plain R script:
# only code and comments. There is no formatted text, no saved output, and
# nothing to render. In a Quarto file (.qmd) the writing and the results sit
# next to the code, and you press Render to build a document. In a script
# you just run the code, and the results appear in the Console.
#
# How to run it in RStudio:
#   - One line (or the selected lines):  Cmd/Ctrl + Enter
#   - The whole file, top to bottom:     Cmd/Ctrl + Option/Alt + R  ("Run All")
#   - From a terminal, in this folder:   Rscript handout_code.R
#
# Open the RStudio project (intro-r-workshop.Rproj) first, so paths like
# "data/subset_saf.csv" point to the right place.
# =============================================================================

# =============================================================================
# PACKAGES
# =============================================================================

# Run this ONCE (commented out so it does not run every time):
# install.packages("tidyverse", repos = "https://cloud.r-project.org")
library(tidyverse)

# =============================================================================
# WORKING WITH VECTORS
# =============================================================================

# ---- Creating Vectors ----

# Turnout figures from Trende's chart: one vector per column. c() combines values.
actual_2008 <- c(97677100, 16564353, 11174365, 2629262, 3418041)
projected_2012 <- c(99139605, 17455952, 13134504, 3300869, 3910201)
actual_2012 <- c(93033145, 16797651, 12921270, 3230318, 2584254)

difference <- actual_2012 - projected_2012
difference

# Square brackets pick out elements by position.
actual_2008[2]

actual_2012[1] - projected_2012[1]

# Some common operations on a vector.
length(actual_2008) # Number of elements in a vector

mean(actual_2008) # Average of the elements

median(actual_2008) # Middle element, when sorted

min(actual_2008) # Smallest element

max(actual_2008) # Largest element

range(actual_2008) # Range of a vector

sum(actual_2008) # Adds all of the numbers in a vector

prod(actual_2008) # Multiplies all of the numbers in a vector

log(actual_2008) # Logarithm (natural) of all elements in a vector

unique(actual_2008) # Lists each distinct element in a vector

# Help: ?sum opens the help page for sum(); ??summar searches help pages for similar names.

# ---- Giving Names to a Vector ----

# Give each element a name.
names(actual_2008) # No names yet

names(actual_2008) <- c("White", "Black", "Hispanic", "Asian", "Other")

actual_2008

actual_2008["White"]

# ---- From Vectors to Tibbles (and the Power of "tidy" Data) ----

# Combine the vectors into a tibble, a table with one row per group.
turnout <- tibble(
  group = c("White", "Black", "Hispanic", "Asian", "Other"),
  actual_2008 = actual_2008,
  projected_2012 = projected_2012,
  actual_2012 = actual_2012
)
turnout

# ---- The Pipe Operators: %>% and |> ----

# $ pulls out one column by name.
difference <- turnout$actual_2012 - turnout$projected_2012

# mutate() adds a new column to the tibble.
turnout <- turnout %>%
  mutate(diff_2012 = actual_2012 - projected_2012)
turnout

# ...or pull() the new column out as a plain vector.
difference <- turnout %>%
  mutate(difference = actual_2012 - projected_2012) %>%
  pull(difference)

# Which group had the biggest drop? Sort by the difference and keep the first row.
turnout %>% arrange(diff_2012) %>% slice(1)

# =============================================================================
# EXAMPLE: DISASTER RELIEF AID AND SUPPORT FOR THE INCUMBENT PRESIDENT.
# =============================================================================

# ---- Reading Data into R ----

# -- Reading in a tab-delimited .tsv or .txt file. --

# Read in a tab-delimited file, then check the first rows and get a summary.
data_disaster <- read_tsv("data/disasteraid.tsv", col_names = TRUE)
data_disaster %>% slice_head(n = 5)
summary(data_disaster)

# -- Reading in a comma-separated .csv file. --

# The same data from a comma-separated file.
data_disaster <- read_csv("data/disasteraid.csv")
data_disaster %>% slice_head(n = 5)
summary(data_disaster)

# ---- Attributes of Data Frames ----

# Look at the structure of the data frame.
data_disaster %>% colnames()

glimpse(data_disaster)

data_disaster %>% nrow()
data_disaster %>% ncol()

# Three ways to take the average of one column: $, pull(), or summarize().
mean(data_disaster$incum_vote)

data_disaster %>% pull(incum_vote) %>%
  mean()

data_disaster %>% summarize(mean_incum = mean(incum_vote))

# Every distinct value a variable takes.
data_disaster %>% distinct(year)

# =============================================================================
# WORKSHOP QUESTIONS
# =============================================================================

# -- Question 1 --

# Read the data into a data frame named saf.

# -- Question 2 --

# How many rows and how many columns are in the subset of the data?

# -- Question 3 --

# What year is the data from?

# -- Question 4 --

# What are the youngest and oldest ages?

# -- Question 5 --

# Assuming that NYC cops are arresting neither infants nor Yoda, what could be
# going on here instead?
# (Write your answer here as a comment.)

# -- Question 6 --

# How many different categories of race are considered?

# -- Question 7 --

# Is the mean statistic returned from either summary(saf$race) or the
# tidyverse equivalent saf %>% pull(race) %>% mean() useful in characterizing
# the "average race" of those stopped and frisked?
# (Write your answer here as a comment.)

# -- Question 8 --

# Try the command saf %>% count(race).
# (Write your answer here as a comment.)
