library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Vehicle-related SCC
vehicle_scc <- SCC[grepl("Vehicle", SCC$EI.Sector, ignore.case = TRUE), "SCC"]

# Baltimore
baltimore_veh <- NEI[NEI$fips == "24510" & NEI$SCC %in% vehicle_scc, ]
baltimore_veh$city <- "Baltimore"

# Los Angeles
la_veh <- NEI[NEI$fips == "06037" & NEI$SCC %in% vehicle_scc, ]
la_veh$city <- "Los Angeles"

# Combine data
combined <- rbind(baltimore_veh, la_veh)

# Create PNG
png("plot6.png", width=800, height=600)
ggplot(combined, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(stat="identity", position="dodge") +
  labs(
    title="Motor Vehicle PM2.5 Emissions: Baltimore vs Los Angeles",
    x="Year",
    y="Emissions (tons)"
  ) +
  theme_minimal()
dev.off()
