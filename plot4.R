## plot4.R
## Creates plot4.png: 4-panel plot

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
png("plot4.png", width = 480, height = 480)

# 2x2 layout
par(mfrow = c(2, 2))

## Top-left: Global Active Power
plot(
  sub$Datetime,
  sub$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

## Top-right: Voltage
plot(
  sub$Datetime,
  sub$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage"
)

## Bottom-left: Energy sub metering
plot(
  sub$Datetime,
  sub$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(sub$Datetime, sub$Sub_metering_2, col = "red")
lines(sub$Datetime, sub$Sub_metering_3, col = "blue")
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

## Bottom-right: Global Reactive Power
plot(
  sub$Datetime,
  sub$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power"
)

# Close device
dev.off()
