# Import libraries
library(mosaic)
library(ggplot2)

# Read raw data set
raw_ds <- eLearning

# print the raw data frame
View(raw_ds)

# get column names
names(raw_ds)

cleaned_ds <- raw_ds

# Calculate sample proportion 
sample_stat <- prop(~is_c=="Agree",data=cleaned_ds)


# Generate bootstrap samples
boot_df <- do(1000)*prop(~is_c=="Agree",data=resample(cleaned_ds))

ggplot(data=boot_df) + 
  geom_histogram(mapping = aes(x = prop_TRUE)) +
  xlab("Propotions")

# Get the standard deviation of bootstrap sample distribution
SE <- sd(boot_df$prop_TRUE);
SE