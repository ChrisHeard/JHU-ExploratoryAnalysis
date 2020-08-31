library(dplyr)
library(ggplot2)
setwd("C:/users/chris/documents/r course/exploratory analysis/week4assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_scc <- SCC %>%
  filter(grepl("Coal", EI.Sector)) %>%
  select(SCC) 
  
NEI_coal <- NEI[NEI$SCC %in% coal_scc$SCC,] %>%
  group_by(year) %>%
  summarise(Net_Emissions=sum(Emissions))


png("Plot4.png",width=480,height=480)

plot(NEI_coal$year, NEI_coal$Net_Emissions, type = "o",
     xlab = "Year",
     ylab = "Net Emissions (tons)",
     main = "Net PM2.5 Emissions from Coal in USA (1999-2008)",
     lwd=4,
     col="#333388")
lines(x = XCoords,y=YCoords,col = "black")
dev.off()

