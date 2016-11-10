
setwd("C:/Users/Angel Mail 1/Desktop/albert/SMU data science/Course Work/Doing Data Science/CaseStudy/DoingDataScienceCaseStudyOne/DoingDataScienceCaseStudyOne/analysis")



## This code chuck is Data_Gathering.  The code reads two data sets comma delimited files from the internet.
# the file locations are:
#
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# the functions used were in the Basic package and the repmis package.



library(gdata)
library(tidyr)
library(repmis)

#The file was scanned to obtain the SHA-1 hash.

#This data set is the gross domestic product for 2012 by country in US Dollars

scan_https("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
#SHA-1 hash of file is 18dd2f9ca509a8ace7d8de3831a8f842124c533d

GDP.original <- data.frame(read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"))


str(GDP.original)
head(GDP.original)
tail(GDP.original)



# this was the first attempt at importing the data
# The data was imported using the read.csv function creating the dataframe GDP.Raw.

#The raw data was output to txt files.
setwd("Data")
write.table(EDU.Raw, "EDU.Raw.csv", sep = ",", col.names = TRUE, labels =true, header = TRUE)
setwd("..")

getwd()

scan_https("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")
#SHA-1 hash of file is 20be6ae8245b5a565a815c18a615a83c34745e5e

EDU.Raw <- data.frame(read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"))


 str(EDU.Raw)
head(EDU.Raw)
tail(EDU.Raw)

setwd("Data")
drop("EDU.Raw.CSV")
write.table(EDU.Raw, "EDU.Raw.csv", sep = ",", col.names = TRUE)
getwd()
setwd("..")
