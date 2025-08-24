library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")

# Subset Baltimore
baltimore <- NEI[NEI$fips == "24510", ]

# Create PNG
png("plot3.png", width=800, height=600)
ggplot(baltimore, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_wrap(~type, scales="free_y") +
  labs(
    title="PM2.5 Emissions by Source Type in Baltimore City",
    x="Year",
    y="Emissions (tons)"
  ) +
  theme_minimal()
dev.off()
