# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Identify vehicle-related SCC codes
vehicle_scc <- SCC[grepl("Vehicle", SCC$EI.Sector, ignore.case = TRUE), "SCC"]

# Subset Baltimore vehicle emissions
baltimore_veh <- NEI[NEI$fips == "24510" & NEI$SCC %in% vehicle_scc, ]

# Aggregate by year
baltimore_veh_total <- aggregate(Emissions ~ year, baltimore_veh, sum)

# Create PNG
png("plot5.png", width=800, height=600)
barplot(
  baltimore_veh_total$Emissions,
  names.arg = baltimore_veh_total$year,
  col = "red",
  main = "Motor Vehicle PM2.5 Emissions in Baltimore City",
  xlab = "Year",
  ylab = "Emissions (tons)"
)
dev.off()
