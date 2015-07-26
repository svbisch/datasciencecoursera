library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# define »motor vehicle sources« as having the terms »mobile«, »on-road« and »veh« in the »EI.Sector« variable
motor_veh_sources <- SCC[grep("mobile.*on\\-road.*veh", SCC$EI.Sector, ignore.case=TRUE), "SCC"]
# filter motor vehicle sources and by Baltimore City or Los Angeles County, 
# groub by year and county, calculate totals
# substitute human-readable county names for fips codes
q6 <- filter(NEI, SCC %in% motor_veh_sources, fips %in% c("24510","06037")) %>%
    group_by(year, fips) %>% 
    summarise(pm25_tot=sum(Emissions, na.rm=TRUE)) %>%
    mutate(county=ifelse(fips=="24510", "Baltimore City", "Los Angeles"))

# since we want to show relative change, we need to obtain the baseline value for
# each county separately (i.e. from 1999) and calculate the change in emission
# relative to that. So the value from 1999 is indexed as being 100%. Greater
# emissions in the following years get assigned a value > 100%, lesser emissions
# get < 100%. Do this for each county separately.

# filter Los Angeles County, sort by year and get reference value from 1999
la <- q6 %>% filter(fips=="06037") %>% arrange(year)
laref <- la$pm25_tot[1]

# filter Baltimore City, sort by year and get reference value from 1999
bc <- q6 %>% filter(fips=="24510") %>% arrange(year)
bcref <- bc$pm25_tot[1]

# now calculate percentage change relative to reference separately for each county
q7 <- q6 %>% mutate(relchange=ifelse(fips=="24510",
                                     pm25_tot/bcref*100, 
                                     pm25_tot/laref*100))

# map year and relative change to the axes, plot line and point layer, make facets for county 
p7 <- ggplot(q7, aes(year,relchange)) + 
    geom_point() +
    geom_line() + 
    facet_wrap(~county) +
    labs(title="Relative Change in Motor Vehicles Emission") +
    labs(y=expression("Relative Change in " * PM[2.5] * " Emission (1999=100)")) 
ggsave("plot6.png")
