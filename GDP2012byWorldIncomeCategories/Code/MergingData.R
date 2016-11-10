#This portion of the code is to merge the data
setwd( "C:/Users/Angel Mail 1/Desktop/albert/SMU data science/Course Work/Doing Data Science/CaseStudy/DoingDataScienceCaseStudyOne/analysis")
getwd()


setwd("Data")
#merge
#doBy::orderBy(GDP,GDPEDU)

#CHECKING VARIABLES AND CHECKING FOR MISSING DATA

str(GDPSUB)
summary(GDPSUB)
GDPSUB[!complete.cases(GDPSUB),]


str(EDUSUB)
summary(EDUSUB)
EDUSUB[!complete.cases(EDUSUB),]


GDPEDU<- merge(GDPSUB,EDUSUB,by.x = "CountryCode",
               by.y = "CountryCode",all.x = TRUE,all.y = FALSE)

str(GDPEDU)

summary(GDPEDU)
GDPEDU[!complete.cases(GDPEDU),]



#Answer 1 189 of EDU matched the 190 GDP "South Sudan" did not match


attach(GDPEDU)
summary(GDPEDU)
str(GDPEDU)
head(Rank)
tail(Rank)



getwd()
setwd("Data")
write.csv(GDPEDU,"GDPEDU.csv")

#  The merged dataset is ready for analysis
