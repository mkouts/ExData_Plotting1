library("data.table")


#Read data and subset data for specified dates
powerData <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Convert Date Column to Date Type
powerData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filtering Dates 
powerData <- powerData[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(powerData[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
