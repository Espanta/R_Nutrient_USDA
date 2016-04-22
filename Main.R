# Exploratory analysis of US Dept of Agriculture Data related to 7000 different nutrients downloaded from 
# http://ndb.nal.usda.gov/

# Lets read data from csv
path <- file.path("data","USDA.csv")
USDA <- read.csv(path)

# Lets take a look at data
names(USDA)
head(USDA)
tail(USDA)
summary(USDA)

# Lets have a glimpse of data
library(dplyr)
glimpse(USDA)# 7058 rows, 16 features

# Plot distribution of nutrients and their sugar level
hist(USDA$Sugar, xlab="Sugar Amount (g)", ylab="Number of Nutrients",main="Nutrients and their Sugar Amount")

# Lets find the sweetest nutrient
fields <- c("Description","Sugar")
USDA[which.max(USDA$Sugar),fields]
USDA[which.min(USDA$Sugar),fields]

# Lets find the fattiest nutrient
USDA[which.max(USDA$TotalFat),]
hist(USDA$TotalFat)

# list of top 100 sweet nutrients
s<-USDA %>% 
  select(Description,Sugar,TotalFat,SaturatedFat) %>% 
  arrange(desc(Sugar)) %>% 
  slice(1:100)

#Butters family
