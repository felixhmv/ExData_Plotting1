#We start by loading the data set
#You'll need to extract the zip file and move the txt to your working directory
HPC <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE, 
                  na.strings=c("?"),
                  stringsAsFactors = FALSE)

#Correct the date and time functions so that they get appropriately plotted
HPC$Time <- as.POSIXct(paste(HPC$Date,HPC$Time),format = "%d/%m/%Y %H:%M:%S")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")

#Subset for the specific dates required by the assignment
SubsetHPC <- subset(HPC, HPC$Date == as.Date("2007/02/01") | HPC$Date == as.Date("2007/02/02"))


#Invoke the creation of png file
png(file = "plot4.png", width = 480, height = 480, units = "px")

#Create a 2x2 grid for the individual charts
par(mfrow = c(2,2))

#Create an empty plot chart that matches the assignment
#then add the applicable lines, repeat this four times
plot(SubsetHPC$Time,SubsetHPC$Global_active_power,type = "n", xlab="",ylab= "Global Active Power (kilowatts)")
lines(SubsetHPC$Time, SubsetHPC$Global_active_power)

plot(SubsetHPC$Time,SubsetHPC$Voltage,type = "n", xlab="datetime",ylab= "Voltage")
lines(SubsetHPC$Time, SubsetHPC$Voltage)

plot(SubsetHPC$Time, SubsetHPC$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(SubsetHPC$Time, SubsetHPC$Sub_metering_1, col = "Black")
lines(SubsetHPC$Time, SubsetHPC$Sub_metering_2, col = "Red")
lines(SubsetHPC$Time, SubsetHPC$Sub_metering_3, col = "Blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("Black","Red","Blue"), cex = 0.95, bty = "n")

plot(SubsetHPC$Time,SubsetHPC$Global_reactive_power,type = "n", xlab="datetime",ylab= "Global_reactive_power")
lines(SubsetHPC$Time, SubsetHPC$Global_reactive_power)

dev.off()