#We start by loading the data set
#You'll need to extract the zip file and move the txt to your working directory
HPC <- read.table("household_power_consumption.txt", 
                  sep = ";", 
                  header = TRUE, 
                  na.strings=c("?"),
                  stringsAsFactors = FALSE)

#Correct the date and time functions so that they get appropriately plotted
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC$Time <- strptime(HPC$Time, format = "%H:%M:%S")

#Subset for the specific dates required by the assignment
SubsetHPC <- subset(HPC, HPC$Date == as.Date("2007/02/01") | HPC$Date == as.Date("2007/02/02"))

#Create an historgram that matches the assignment graph, we use the cex function
#to reduce the font size on the x-axis
png(file = "plot1.png", width = 480, height = 480, units = "px")
with(SubsetHPC,  hist(Global_active_power, 
                xlab = "Global Active Power (kilowatts)", 
                col="Red", 
                main = "Global Active Power",
                cex.axis = 0.85))
#minor adjustment in margin
par(mar = c(4,4,2,2))
dev.off()