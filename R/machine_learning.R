#This code is for the machine learning model generation and validation at all the flux sites.
#But first to get the most recent version of R:

if(!require(installr)) {
  install.packages("installr"); require(installr)} #load / install+load installr

updateR()

source("R/my_functions.R")


devtools::install_github('topepo/caret/pkg/caret', dependencies = c("Depends", "Imports", "Suggests"))
library(lubridate)
library(caret)
library(randomForest)
library(plyr)
library(dplyr)
library(reshape2)

#Load data
All_sites <- read.csv("C:/Users/rsstudent/Dropbox (Dissertation Dropbox)/Upscaling_All_Sites_3_3_2018.csv")
str(All_sites)
cutoff_index <- ddply(All_sites, .(site), summarize, cutoff=quantile(GPP, 0.75, na.rm=TRUE))
cutoff_index <- cutoff_index[-c(23),]
All_sites <- merge(All_sites, cutoff_index, by="site")
