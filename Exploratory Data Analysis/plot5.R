library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# define »motor vehicle sources« as having the terms »mobile«, »on-road« and »veh« in the »EI.Sector« variable
motor_veh_sources <- SCC[grep("mobile.*on\\-road.*veh", SCC$EI.Sector, ignore.case=TRUE), "SCC"]
# filter motor vehicle sources and Baltimore City, groub by year, calculate totals
q5 <- filter(NEI, SCC %in% motor_veh_sources, fips=="24510") %>%
    group_by(year) %>% 
    summarise(pm25_tot=sum(Emissions,na.rm=TRUE))

# map year and total emssion to the axes, plot points layer, add linear regression layer, 
p5 <- ggplot(q5, aes(year, pm25_tot)) +
    geom_point() +
    geom_smooth(method="lm", se=FALSE) +
    labs(y=expression("Amount of " * PM[2.5] * " in tons")) +
    labs(title="Motor Vehicles in Baltimore City")  +
    ylim(0, ceiling(1.1 * max(q5$pm25_tot)))
ggsave("plot5.png")
