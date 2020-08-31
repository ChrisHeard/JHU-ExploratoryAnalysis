library(dplyr)
library(ggplot2)
setwd("C:/users/chris/documents/r course/exploratory analysis/week4assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

an_bal_type <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%

  summarise(Net_Emissions=sum(Emissions))

png("Plot3.png",width=1000,height=1000)

ggplot(an_bal_type,aes(x=year,y=Net_Emissions,color=type)) + 
  facet_wrap(.~type) +
  geom_line(size=2)+
  geom_point(size=3,color="#000000")+
  geom_point()+ 
  geom_smooth(method="lm",se=FALSE,color="steelblue",size=2,linetype="dashed")+
  theme_light(base_size = 12)+
  labs(x="Year", y="PM2.5 Emissions (tons)") + 
  ggtitle("Baltimore City PM2.5 Emissions by Year and Type")

dev.off()