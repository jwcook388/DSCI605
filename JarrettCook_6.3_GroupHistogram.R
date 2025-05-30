# Load tidyverse and colorspace libraries
library(tidyverse)
library(colorspace)

# Set working directory

# Load and inspect the data set
df <- read.csv("Sampledata2.csv")
view(df)
summary(df)

# Break the variable “CrimeRate” into three groups based on the range and create a new variable “RangeGroup”. You can use case_when() function.
df2 <- df %>% 
  mutate(RangeGroup = case_when(CrimeRate < 250 ~ "CrimeRate < 250",
                          250 <= CrimeRate & CrimeRate <= 500 ~ "250 <= CrimeRate <=500",
                          CrimeRate > 500 ~ "CrimeRate > 500"))
view(df2)

# Create two color vectors
n <- length(unique(df2$Year))
col1=colorspace::diverge_hcl(n)
col2=c("green","blue","red")

# 5. Plot a histogram of the variable “CrimateRate” and fill with the variable “Year”. Please use the first color vector col1 for this graph.

df2 %>% 
  ggplot(aes(x=CrimeRate, color=as.factor(Year), fill=as.factor(Year))) +
  geom_histogram(position = "dodge", alpha=0.5, bins=10) +
  scale_color_manual(values=col1) +
  scale_fill_manual(values=col1) +
  labs(title="Crime Rate Histogram Plot #1", x="Crime rate per 100,000 people", y="Count") +
  guides(col=guide_legend("Year"), fill=guide_legend("Year")) +
  theme_classic()

# 6. Plot a histogram of the variable “CrimeRate” and fill with the variable “RangeGroup”, which you created in Step3. Please use second color vector col2 for this graph.
df2 %>% 
  ggplot(aes(x=CrimeRate, color=as.factor(RangeGroup), fill=as.factor(RangeGroup))) +
  geom_histogram(position = "dodge", alpha=0.5, bins=10) +
  scale_color_manual(values=col2) +
  scale_fill_manual(values=col2) +
  labs(title="Crime Rate Histogram Plot #2", x="Crime rate per 100,000 people", y="Count") +
  guides(col=guide_legend("RangeGroup"), fill=guide_legend("RangeGroup")) +
  theme_classic()






