# loading the data

loadIt <- function() {
	df <- read.table("household_power_consumption.txt",
				header=TRUE,
				sep=";",
				na.strings=c("?"))
	return (df)
}

# interesting subset

subsetIt <- function( set ) {
	sub <- subset(set,Date=="1/2/2007" | Date == "2/2/2007")
	return (sub)
}

# converting columns (Date and Time)

convertIt <- function ( set ) {
 	# adding time column
	set["FullTime"] <- paste(set$Date,set$Time)
	# converting to R time
	set$FullTime <- strptime(set$FullTime, "%d/%m/%Y %H:%M:%S")
	# column is a date in R sense
	set$Date <- as.Date(set$Date , "%d/%m/%Y")
	return (set)
}

# loading data
df <- loadIt()
sub <- subsetIt(df)
rm(df)

# converting to date and adding full time column
ready <- convertIt(sub)
rm(sub)

#
png(filename="plot3.png")

plot(ready$FullTime,ready$Sub_metering_1, type="n",
	xlab= "", ylab="Energy sub metering")

lines(ready$FullTime,ready$Sub_metering_1,
	col="black",
	type="l", xlab="", ylab="")
lines(ready$FullTime,ready$Sub_metering_2,
	col="red",
	type="l", xlab="", ylab="")
lines(ready$FullTime,ready$Sub_metering_3,
	col="blue",
	type="l", xlab="", ylab="")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		lty=c(1,1,1), 
		col=c("black", "red", "blue"))


dev.off()

