## plot3.R
## Creates plot3.png: line plot of Sub_metering 1–3 vs. time

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
png("plot3.png", width = 480, height = 480)

# Base plot: Sub_metering_1
plot(
  sub$Datetime,
  sub$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)

# Add Sub_metering_2 (red) and Sub_metering_3 (blue)
lines(sub$Datetime, sub$Sub_metering_2, col = "red")
lines(sub$Datetime, sub$Sub_metering_3, col = "blue")

# Legend
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1
)

# Close device
dev.off()
