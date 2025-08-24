# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Identify coal-related SCC codes
coal_scc <- SCC[grepl("Coal", SCC$Short.Name, ignore.case = TRUE), "SCC"]

# Filter NEI for coal
coal_data <- NEI[NEI$SCC %in% coal_scc, ]

# Aggregate by year
coal_total <- aggregate(Emissions ~ year, coal_data, sum)

# Create PNG
png("plot4.png", width=800, height=600)
barplot(
  coal_total$Emissions,
  names.arg = coal_total$year,
  col = "gray",
  main = "Coal Combustion-Related PM2.5 Emissions in U.S.",
  xlab = "Year",
  ylab = "Emissions (tons)"
)
dev.off()
