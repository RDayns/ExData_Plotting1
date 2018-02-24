#Read dataset into R
fulldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, 
                     check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Subset data
data <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))

#Convert Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
Datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(Datetime)

#Plot and save in PNG format
png(file="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(data, {
    plot(Global_active_power~datetime, type="l", ylab="Global Active Power", xlab="")
    plot(Voltage~datetime, type="l", ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
})
dev.off()
