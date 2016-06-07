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

#Create an empty plot chart that matches the assignment dimensions
#then add the lines function to creat the lines

png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(SubsetHPC$Time, SubsetHPC$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(SubsetHPC$Time, SubsetHPC$Sub_metering_1, col = "Black")
lines(SubsetHPC$Time, SubsetHPC$Sub_metering_2, col = "Red")
lines(SubsetHPC$Time, SubsetHPC$Sub_metering_3, col = "Blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("Black","Red","Blue"))
dev.off()