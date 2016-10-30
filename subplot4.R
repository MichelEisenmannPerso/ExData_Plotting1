
# 2x2 plots
par(mfrow=c(2,2))

#
plot(ready$FullTime,ready$Global_active_power,
	ylab="Global Active Power", xlab="",
	type="l")

plot(ready$FullTime,ready$Voltage,
	ylab="Voltage", xlab="datetime",
	type="l")

#
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
		col=c("black", "red", "blue"),
	bty="n")

#
plot(ready$FullTime,ready$Global_reactive_power,
	xlab="datetime", type="l")


