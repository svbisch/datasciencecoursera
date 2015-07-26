library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")

# group by year, calculate sum of emissions, transform from tons to megatons
q1 <- group_by(NEI, year) %>% 
    summarise(pm25_tot=sum(Emissions, na.rm=TRUE)) %>% 
    mutate(pm25_tot_megatons=pm25_tot/10^6)

png(filename="plot1.png", width=800, height=600, units="px", bg="white")
with(q1, 
     plot(year, pm25_tot_megatons, 
          ylab=expression("Amount of " * PM[2.5] * " emitted in megatons"), 
          main=expression("Total " * PM[2.5] * " Emission"), 
          ylim=c(0, ceiling(max(pm25_tot_megatons)))
          )
     )
abline(lm(pm25_tot_megatons~year, q1), col="red")
dev.off()
