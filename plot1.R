# Load data
NEI <- readRDS("summarySCC_PM25.rds")
# Aggregate total emissions by year
total_emissions <- aggregate(Emissions ~ year, NEI, sum)
# Create PNG

png("plot1.png", width=800, height=600)
barplot(
  total_emissions$Emissions,
  names.arg = total_emissions$year,
  col = "skyblue",
  main = "Total PM2.5 Emissions in the U.S. (1999–2008)",
  xlab = "Year",
  ylab = "Total Emissions (tons)"
)
dev.off()
