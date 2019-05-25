# Workbook 8

library(ggplot2)

data <- read.csv(file='marijuana-use-2016.csv',header=TRUE, sep=",")
recent <- data[data$Year == '2014-2016' & data$Marijuana.Use == 'Marijuana Use in the Past Year' & data$Variable == 'Marijuana Use'
               & data$Age.Range == '12-17', ]

ggplot(data=recent, aes(x=recent$Region, y= recent$Value)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs(title= "Percentage of 12-17 year olds who have smoked \n marijuana in the last year") + xlab("Region") + ylab("Percentage")


recent_older <- data[data$Year == '2014-2016' & data$Marijuana.Use == 'Marijuana Use in the Past Year' & data$Variable == 'Marijuana Use'
                     & data$Age.Range == 'Over 17', ]
ggplot(data=recent_older, aes(x=recent$Region, y= recent$Value)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs(title= "Percentage of people over 17 year olds who have smoked \n marijuana in the last year") + xlab("Region") + ylab("Percentage")
