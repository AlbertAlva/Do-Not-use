
###   this function for removing punctuation.
##x <- c(1,2,"?",3); ifelse(x=="?",NA,x)

setwd("C:/Users/Angel Mail 1/Desktop/albert/SMU data science/Course Work/Doing Data Science/CaseStudy/DoingDataScienceCaseStudyOne/analysis")

#This code chunk titled TidyData explains the steps to prepare the data for evaluation
#ASSIGNMENT
##Answer Questions
# 1.Merge the data based on the country shortcode.
#  How many of the IDs match?
#  2.Sort the data frame in ascending order by GDP (so United States is last).
#  a. What is the 13th country in the resulting data frame?
#  b. What are the average GDP rankings for the "High income: OECD" and "High income: nonOECD" groups?
#  c. Plot the GDP for all of the countries. Use ggplot2 to color your plot by Income Group.
#  d. Cut the GDP ranking into 5 separate quantile groups.
#  e. Make a table versus Income.Group.
#  f  How many countries are Lower middle income but among the 38 nations with highest GDP?

setwd("Data")

GDP.original <- data.frame(read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", header = TRUE))

str(GDP.original)
head(GDP.original)

#Two data set are to be written GDP and

#The GDP data was imported with no headers since it contained a header and space before the data
#the column headings were also on seperate lines and one without a label.  The data was imported
#without column labels and skipped the first 5 rows to strip off the header and labels.
#label V and the column number was temperarilly assigned to the columns
#Reimported the data.

ncol <- max(count.fields("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", sep = ",", skip = 5))
GDPRaw <- data.table(read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
         fill = TRUE, header = FALSE, col.names = paste0("V", seq_len(ncol)),skip = 5,
         nrows = 190, stringsAsFactors = FALSE, na.strings = FALSE ))

str(GDPRaw)
head(GDPRaw)
tail(GDPRaw)

GDPSUB <- subset(GDPRaw,select = c(1,2,4,5) )

#The names() function was used to name the columns

names(GDPSUB) <- c("CountryCode","Rank","Economy","GDP" )

setwd("Data")
dir()
head(GDPSUB)
str(GDPSUB)
setwd("..")

## the Contrycode,Economy and GDP vectors were imported as factors .
   #Using repmis as.character and as.numeric
  #to change the vector format

# the ifelse function replaces a value in a vector

library(foreign)
library(stringr)
library(plyr)
library(reshape2)

# The (GDPSUB$Economy) gsub("[^[:digit:]]","",data) removed the "," from
#the GDP field

GDPSUB$GDP <- as.numeric(gsub("[^[:digit:]]","", GDPSUB$GDP))


str(GDPSUB)

head(GDPSUB)
tail(GDPSUB)
summary(GDPSUB)
setwd("Data")
### All fields in the data set are tidy



## data set Tidy

## dataset two



EDUSUB <- subset(data.table(read.csv("eduRaw.csv",fill = TRUE,
                          header = TRUE, blank.lines.skip = TRUE,
                          stringsAsFactors = FALSE,strip.white = TRUE,
                          na.strings = TRUE)),select = c(2,3,4))

str(EDUSUB)
names(EDUSUB) <- c("CountryCode" , "LongName"  ,  "IncomeGroup") # getting rid of .

gsub(c(".",EDUSUB$LongName )

summary(EDUSUB)
View(EDUSUB)
str(EDUSUB)
str(GDPSUB)
View(GDPSUB)


# this data is tidy
summary(GDPSUB)
str(GDPSUB)
head(GDPSUB)
tail(GDPSUB)

summary(EDUSUB)
str(EDUSUB)
head(EDUSUB)
tail(EDUSUB)

## the two datasets are tidy
getwd()
setwd("Data")
write.csv(GDPSUB,"GDPSUB.csv")
write.csv(EDUSUB,"EDUSUB.csv")

setwd("..")


