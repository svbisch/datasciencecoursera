library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

# filter Baltimore City, group by year, calculate sum of emissions from all sources
q3 <- filter(NEI, fips=="24510") %>%
    group_by(year, type) %>% 
    summarise(pm25_tot=sum(Emissions, na.rm=TRUE))

# map year and total emssion to the axes, plot points layer, add linear regression layer, 
# make facets by type of source
p3 <- ggplot(q3, aes(year, pm25_tot)) +
    geom_point() +
    geom_smooth(method="lm", se=FALSE) +
    facet_wrap(~type) +
    labs(y=expression("Amount of " * PM[2.5] * " in tons")) +
    labs(title=expression("Baltimore City " * PM[2.5] * " Emission by type of source")) 
ggsave("plot3.png")