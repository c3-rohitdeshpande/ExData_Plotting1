## plot1.R
## Creates plot1.png: histogram of Global Active Power

# Read data
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Subset to dates 1/2/2007 and 2/2/2007
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Open PNG device
png("plot1.png", width = 480, height = 480)

# Plot
hist(
  sub$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

# Close device
dev.off()
