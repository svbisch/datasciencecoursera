library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# define »coal combustion-related sources« as having the terms »comb« and »coal« in the »EI.Sector« variable
comb_coal_sources <- SCC[grep("comb.*coal", SCC$EI.Sector, ignore.case=TRUE), "SCC"]
# filter coal combustion-related sources, groub by year, calculate totals and transform from tons to kilotons
q4 <- filter(NEI, SCC %in% comb_coal_sources) %>%
    group_by(year) %>% 
    summarise(pm25_tot=sum(Emissions, na.rm=TRUE)) %>% 
    mutate(pm25_tot_kilotons=pm25_tot/10^3)

# map year and total emssion in kt to the axes, plot points layer, add linear regression layer, 
p4 <- ggplot(q4, aes(year, pm25_tot_kilotons)) +
    geom_point(size=3) +
    geom_smooth(method="lm", se=FALSE) +
    labs(y=expression("Amount of " * PM[2.5] * " in kilotons")) +
    labs(title=expression(PM[2.5] * " Emission from Coal Combustion-Related Sources Across the U.S.")) +
    ylim(0, ceiling(1.1 * max(q4$pm25_tot_kilotons)))
ggsave("plot4.png")



