library(dplyr)
library(ggplot2)
setwd("C:/users/chris/documents/r course/exploratory analysis/week4assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles_scc <- SCC %>%
  filter(grepl("Vehicles", EI.Sector)) %>%
  select(SCC) 

NEI_vehicles <- NEI[NEI$SCC %in% vehicles_scc$SCC,] %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(Net_Emissions=sum(Emissions))


png("Plot5.png",width=480,height=480)

plot(NEI_vehicles$year, NEI_vehicles$Net_Emissions, type = "o",
     xlab = "Year",
     ylab = "Net Emissions (tons)",
     main = "Net PM2.5 Emissions from Vehicles in Baltimore (1999-2008)",
     lwd=4,
     col="#333388")
lines(col = "black")
dev.off()

