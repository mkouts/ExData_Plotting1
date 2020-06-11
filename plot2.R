library("data.table")

#Read data and subset data for specified dates
powerData <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)


# Make a POSIXct date 
powerData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates 
powerData <- powerData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = powerData[, dateTime]
     , y = powerData[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()