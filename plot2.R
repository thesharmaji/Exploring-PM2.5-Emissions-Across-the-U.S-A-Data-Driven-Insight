# Load data
NEI <- readRDS("summarySCC_PM25.rds")

# Subset Baltimore
baltimore <- NEI[NEI$fips == "24510", ]


# Aggregate by year
baltimore_total <- aggregate(Emissions ~ year, baltimore, sum)

# Create PNG
png("plot2.png", width=800, height=600)
barplot(
  baltimore_total$Emissions,
  names.arg = baltimore_total$year,
  col = "orange",
  main = "PM2.5 Emissions in Baltimore City (1999–2008)",
  xlab = "Year",
  ylab = "Total Emissions (tons)"
)
dev.off()
