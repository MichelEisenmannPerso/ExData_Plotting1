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
png(filename="plot1.png")

#
hist(ready$Global_active_power,col="red", 
		xlab="Global Active Power (kilowatts)",
		main="Global Active Power")


dev.off()


