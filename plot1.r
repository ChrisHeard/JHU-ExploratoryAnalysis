library(dplyr)
setwd("C:/users/chris/documents/r course/exploratory analysis/week4assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

an <- NEI %>%
  group_by(year) %>%
  summarise(Net_Emissions=sum(Emissions))

png("Plot1.png",width=480,height=480)

plot(an, type = "o", main = "Net PM2.5 Emissions by Year", xlab = "Year", 
     ylab = "PM2.5 Emissions", pch = 15, lty = 2, col = "#000099")

dev.off()