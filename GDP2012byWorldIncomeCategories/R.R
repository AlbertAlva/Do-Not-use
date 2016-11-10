library(ggplot2)

myplot <-    data.table(IncomeGroup,Economy,stringsAsFactors = FALSE)

attach(myplot)


#g = ggplot(myplot,aes(IncomeGroup, fill= IncomeGroup))
g = ggplot(myplot,aes(IncomeGroup))
g = g + geom_bar(aes(fill= IncomeGroup))
g = g+ggtitle("Organsation for Economic Cooperation and Development\n (OECD) 2012 GDP\n Country Count by GDP Income Group")
g = g+theme(axis.text.x  = element_text(size=5))
g = g+labs(x="GDP Income Group", y="Number of Countries")
g
pdf(g,"Plots.pdf")
dev.off()
GDPSUB[!complete.cases(GDPSUB),]
