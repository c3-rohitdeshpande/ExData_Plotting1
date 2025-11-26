## plot2.R
## Creates plot2.png: line plot of Global Active Power vs. time

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

# Create datetime variable
sub$Datetime <- strptime(
  paste(sub$Date, sub$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# Open PNG device
png("plot2.png", width = 480, height = 480)

# Plot
plot(
  sub$Datetime,
  sub$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

# Close device
dev.off()
