
library(doBy)

attach(GDPEDU)

#elimiated the non matching observation
GDPEDU <- na.omit(GDPEDU)
GDPEDU[!complete.cases(GDPEDU),]

#ordering the data set by GDP to tell the 13th from the top
GDPEDU<-orderBy(~GDP,data=GDPEDU)
LongName[13]

#2a the 13th country on the list is St. Kitts and Nevis"

write.csv(GDPEDU,"GDPEDU.csv")



#  b. What are the average GDP rankings for the "High income: OECD" and "High income: nonOECD" groups?
#attach(GDPEDU)

GDPEDU[, mean(GDPEDU$Rank, na.rm = TRUE), by = GDPEDU$IncomeGroup]

GDPR <-GDPEDU[, mean(Rank, na.rm = TRUE), by = IncomeGroup]
names(GDPR) <- c("Income Group", "Average GDP")
GDPR

write.csv(GDPR,"test.csv")
HTML(GDPR,"AverageGDPofIncomeGroups.html")
HTMLEndFile("AverageGDPofIncomeGroups.html")


#High income: nonOECD Mean = 91.91304
#High income: OECD Mean =   32.96667

#  c. Plot the GDP for all of the countries. Use ggplot2 to
#color your plot by Income Group.


library(ggplot2)
myplot <-    data.frame(IncomeGroup,Economy,stringsAsFactors = FALSE)
attach(myplot)


#g = ggplot(myplot,aes(IncomeGroup, fill= IncomeGroup))
g = ggplot(myplot,aes(IncomeGroup))
g = g + geom_bar(aes(fill= IncomeGroup))
g = g+ggtitle("Organsation for Economic Cooperation and Development\n (OECD) 2012 GDP\n Country Count by GDP Income Group")
g= g+labs(x="GDP Income Group", y="Number of Countries")
g= g+theme(axis.title.x  = element_text(size=8))
g
getwd()
setwd("..")
setwd("Analysis")

getwd()

pdf("Plots.pdf")
g
dev.off()


#  d. Cut the GDP ranking into 5 separate quantile groups.
library(stats)
library(data.table)
library(R2HTML)

qx <- quantile(GDPEDU$Rank, probs= seq(0, 1, 0.20), na.rm = TRUE)
GDPEDU$qGDP <- as.character(cut(GDPEDU$Rank, qx, include.lowest = FALSE))

str(GDPEDU$qGDP)
head.(GDPEDU$qGDP)
summary(GDPEDU$qGDP)





Qd <- GDPEDU[IncomeGroup=="Lower middle income", .N ,by=c("IncomeGroup", "qGDP")]

Qd #  e. Make a table versus Income.Group.


HTML(Qd, "IncomeGroupsinHighest38.html")
HTMLEndFile("IncomeGroupsinHighest38.html")
getwd()


#  f  How many countries are Lower middle income
#       but among the 38 nations with highest GDP?

#####16 members of the lower middle income group were in the highest 38

# The project calls for countrycode and income group


dir()

View(read.csv("GDPRaw.csv"))
