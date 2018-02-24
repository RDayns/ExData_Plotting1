#Read dataset into R
fulldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, 
                     check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Subset data
data <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))


#Convert Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


#Plot and save in PNG format
png(file="plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
