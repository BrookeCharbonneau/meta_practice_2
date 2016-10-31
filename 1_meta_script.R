library(metaPsychometric)
library(tidyverse)

# example 1 load data
ex1_meta_data <- read_csv("meta_data_ex1.csv")
View(ex1_meta_data)

# example 1 conduct meta-analysis
ex1_results <- meta_bare_bones(ex1_meta_data)
print(ex1_results)
# per_error is over 75 - assume all variance due to sampling error

# example 1 funnel plot
meta_plot_funnel(ex1_results)
# small sample sizes have a ton of variance!!


# example 2 load data
ex2_meta_data <- read_csv("meta_data_ex2.csv")
View(ex2_meta_data)

# example 2 conduct meta-analysis
ex2_results <- meta_bare_bones(ex2_meta_data)
print(ex2_results)
# per_error is over 75 - assume all variance due to sampling error

# example 2 funnel plot
meta_plot_funnel(ex2_results)


# example 3 load data
ex3_meta_data <- read_csv("meta_data_ex3.csv")
View(ex3_meta_data)

# example 3 conduct meta-analysis
ex3_results <- meta_bare_bones(ex3_meta_data)
print(ex3_results)
# credibility interval rangers from .265 to .525 - moderators??

# example 3 forest plot
meta_plot_forest(ex3_results)
# seems to be 2 means

# example 3 funnel plot
meta_plot_funnel(ex3_results)
# lots of dots outside the funnel - 2 means?

# example 3 funnel plot with non-sig bounds
meta_plot_funnel(ex3_results, show_null_dist = TRUE)
# dots don't fit into non-sig bounds either!

# example 3 - break data into groups
ex3_meta_data_canada <- ex3_meta_data %>% filter(country=="Canada")
ex3_meta_data_usa <- ex3_meta_data %>% filter(country=="United States")

# example 3 - analyze groups
ex3_results_canada <- meta_bare_bones(ex3_meta_data_canada)
print(ex3_results_canada)
meta_plot_forest(ex3_results_canada)
# 1 mean but per_error over 173 - variability due to random sampling

ex3_results_usa <- meta_bare_bones(ex3_meta_data_usa)
print(ex3_results_usa)
meta_plot_forest(ex3_results_usa)
# high per_error - variability due to random sampling


# example 4 load data
ex4_meta_data <- read_csv("meta_data_ex4.csv")
View(ex4_meta_data)

# example 1 conduct meta-analysis
ex4_results <- meta_corrected(ex4_meta_data)
print(ex4_results)

# example 4 - break data into groups
ex4_meta_data_canada <- ex4_meta_data %>% filter(country=="Canada")
ex4_meta_data_usa <- ex4_meta_data %>% filter(country=="United States")

# example 4 - analyze groups
ex4_results_canada <- meta_corrected(ex4_meta_data_canada)
print(ex4_results_canada)
# cred int from .33 to .48

ex4_results_usa <- meta_bare_bones(ex4_meta_data_usa)
print(ex4_results_usa)
# high per_error - variability due to random sampling, cred int from .48 to .51
## looks like something happening within Canada, but nothing within US

