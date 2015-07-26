library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")

# filter Baltimore City, group by year, calculate sum of emissions from all sources
q2 <- filter(NEI, fips=="24510") %>%
    group_by(year) %>% 
    summarise(pm25_tot=sum(Emissions,na.rm=TRUE))

png(filename="plot2.png", width=800, height=600, units="px", bg="white")
with(q2, 
     plot(year, pm25_tot, 
          main=expression("Baltimore City " * PM[2.5] * " Emission"),
          ylab=expression("Amount of " * PM[2.5] * " emitted in tons"), 
          ylim=c(0, ceiling(max(pm25_tot)))))
# add linear regression line to display trend
abline(lm(pm25_tot~year, q2),col="red")
dev.off()
