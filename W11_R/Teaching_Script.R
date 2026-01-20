############################################################
# INTRO TO R (Hands-on) — TEACHING SCRIPT (NO MICRO SLIDES)
# Matches your current presentation slides exactly.
#
# Tip: Run a line with Ctrl/Cmd + Enter
############################################################

# ============================================================
# Slide 1 — Title (talk)
# ============================================================

# ============================================================
# Slide 2 — Learning Goals (talk)
# ============================================================

# ============================================================
# Slide 3 — Lecture Structure (talk)
# ============================================================

# ============================================================
# Slide 4 — Quotes (talk)
# ============================================================

# ============================================================
# Slide 5 — How this session will work (talk)
# ============================================================

# ============================================================
# Slide 6 — Reasons to learn R (talk)
# ============================================================

# ============================================================
# Slide 7 — Tools needed installed (talk + quick check)
# ============================================================

# ============================================================
# Slide 8 — RStudio IDE panes (DEMO: point to panes)
# ============================================================

# ============================================================
# Slide 9 — How R works (talk)
# ============================================================

# ============================================================
# Slide 10 — First R code-along (DEMO)
# ============================================================
v <- c(10, 15, 20)
mean(v)

# ============================================================
# Slide 11 — Exercise (CHALLENGE)
# ============================================================
# TODO (students):
# Create a numeric vector (>= 5 values) and compute:
# - mean
# - min
# - max
#
# my_vec <- c(...)
# mean(my_vec)
# min(my_vec)
# max(my_vec)

# ============================================================
# Slide 12 — Try this simple exercise (SOLUTION)
# ============================================================
v2 <- c(3, 6, 9, 12, 15)
mean(v2)
min(v2)
max(v2)

# ============================================================
# Slide 13 — Scripts ensure reproducibility (talk)
# ============================================================

# ============================================================
# Slide 14 — What are packages? (talk)
# ============================================================

# ============================================================
# Slide 15 — Installing vs loading packages (DEMO)
# ============================================================
# Install ONCE (only if needed)
# install.packages("dplyr")
# install.packages("ggplot2")

# Load EVERY SESSION
library(dplyr)
library(ggplot2)

# ============================================================
# Slide 16 — Working directory (DEMO)
# ============================================================
getwd()
list.files()

# ============================================================
# Slide 17 — RStudio Projects (talk/demo)
# ============================================================

# ============================================================
# Slide 18 — How data enters R (talk)
# ============================================================

# ============================================================
# Slide 19 — Code-along: Inspect mtcars (DEMO)
# ============================================================
data(mtcars)  # optional; mtcars is usually already available

head(mtcars)
names(mtcars)
str(mtcars)
summary(mtcars)

# ============================================================
# Slide 20 — Your turn: Inspect the dataset (CHALLENGE)
# ============================================================
# TODO (students):
df <- iris

head(df)
names(df)
str(df)
summary(df)
dim(df)

# ============================================================
# Slide 21 — Solutions: Inspect the dataset (SOLUTION)
# ============================================================
df <- iris

head(df)
names(df)
str(df)
summary(df)
dim(df)

# ============================================================
# Slide 22 — Missing values in datasets (NA) (DEMO)
# ============================================================
x <- c(1, 2, NA, 4)
mean(x)
mean(x, na.rm = TRUE)

# ============================================================
# Slide 23 — What is Data Wrangling? (talk)
# ============================================================

# ============================================================
# Slide 24 — Pipes: %>% (DEMO)
# ============================================================
mtcars %>%
  filter(cyl == 6) %>%
  select(mpg, hp)

# ============================================================
# Slide 25 — Filtering rows with filter() (DEMO)
# ============================================================
iris %>%
  filter(Species == "setosa")

# ============================================================
# Slide 26 — Your turn: Filtering rows (CHALLENGE)
# ============================================================
# TODO (students): filter the mtcars dataset
# Try:
# 1) cyl == 8
# 2) cyl == 8 AND mpg < 15
# 3) cyl == 8 OR mpg < 15

# ============================================================
# Slide 27 — Solutions: Filtering rows (SOLUTION)
# ============================================================
mtcars %>% filter(cyl == 8)

mtcars %>% filter(cyl == 8 & mpg < 15)

mtcars %>% filter(cyl == 8 | mpg < 15)

# ============================================================
# Slide 28 — Selecting columns with select() (DEMO)
# ============================================================
mtcars %>% select(mpg, hp, wt)

# ============================================================
# Slide 29 — Your turn: Selecting columns (CHALLENGE)
# ============================================================
# TODO (students): select any 2–3 columns from iris
# iris_small <- iris %>% select(...)
# head(iris_small)

# ============================================================
# Slide 30 — Creating new variables with mutate() (DEMO)
# ============================================================
iris %>%
  mutate(petal_ratio = Petal.Length / Petal.Width) %>%
  head()

# ============================================================
# Slide 31 — Your turn: mutate() (CHALLENGE)
# ============================================================
# TODO (students):
# Create a new column sepal_ratio = Sepal.Length / Sepal.Width
# Then check the result using head()

# ============================================================
# Slide 32 — Solution: mutate() (SOLUTION)
# ============================================================
iris %>%
  mutate(sepal_ratio = Sepal.Length / Sepal.Width) %>%
  head()

# ============================================================
# Slide 33 — Visualizations using R (talk)
# ============================================================

# ============================================================
# Slide 34 — First plot: Scatter plot (DEMO)
# ============================================================
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# ============================================================
# Slide 35 — Colour encodes information (DEMO)
# ============================================================
mtcars %>%
  ggplot(aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point()

# ============================================================
# Slide 36 — More information in the same plot (DEMO)
# ============================================================
mtcars %>%
  ggplot(aes(x = wt, y = mpg,
             color = factor(cyl),
             size = hp)) +
  geom_point(alpha = 0.7)

# ============================================================
# Slide 37 — CHALLENGE: Build your own scatter plot (CHALLENGE)
# ============================================================
# TODO (students):
# Required:
# - x = wt
# - y = mpg
# Add TWO extra variables:
# - colour = factor(gear) OR factor(am)
# - size   = disp OR qsec
#
# Template:
# mtcars %>%
#   ggplot(aes(x = wt, y = mpg, color = factor(gear), size = disp)) +
#   geom_point(alpha = 0.7)

# ============================================================
# Slide 38 — SOLUTION: One possible answer (SOLUTION)
# ============================================================
# Example 1:
mtcars %>%
  ggplot(aes(x = wt, y = mpg,
             color = factor(gear),
             size = disp)) +
  geom_point(alpha = 0.7)

# Example 2:
mtcars %>%
  ggplot(aes(x = wt, y = mpg,
             color = factor(am),
             size = qsec)) +
  geom_point(alpha = 0.7)

# ============================================================
# Slide 39 — Saving results (write.csv) (DEMO)
# ============================================================
result <- mtcars %>%
  select(mpg, wt, hp) %>%
  head(10)

write.csv(result, "mtcars_sample.csv", row.names = FALSE)

# ============================================================
# Slide 40 — Saving plots (ggsave) (DEMO)
# ============================================================
# ggsave saves the most recent plot shown in the Plots pane
ggsave("my_plot.png", width = 6, height = 4)

# ============================================================
# Slide 41 — When things break: Debugging checklist (talk + DEMO)
# ============================================================
ls()
head(df)
names(df)
str(df)

?filter
?ggplot

# ============================================================
# Slide 42 — How to keep learning (talk)
# ============================================================

# ============================================================
# Slide 43 — Resources (talk)
# ============================================================

# ============================================================
# Slide 44 — Final message (talk)
# ============================================================

############################################################
# END OF SCRIPT
############################################################
