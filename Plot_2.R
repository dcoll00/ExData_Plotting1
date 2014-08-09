# Plot_2.R
# This code will create the plot_2 assignment
#This series of commands will get the column classes before the read command for the whole table
#and make sure they stay correct later
#Load appropriate libraries
library(chron)

tab5rows <- read.table("household_power_consumption.txt", header = TRUE,sep=";",as.is=TRUE, na.strings = "?",nrows = 5)
classes <- sapply(tab5rows, class)


# Read in the data.  I wanted to just read in the critical data, but can't find the code
# to do that and am running out of time.  This will have to do.
# Comments about read.table - the na.strings command will change all the "?" to NA's for me and leave the columns as numerics.
# the as.is=TRUE will keep character columns as character and not make them factors.
x <- read.table("household_power_consumption.txt", header=TRUE,sep=";", quote="",as.is=TRUE, na.strings = "?", colClasses = classes, strip.white=TRUE)

#This will move the related data to a separate table for use in plotting
#subset to get just data we need
y <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")

#Need to convert date to a date function and to a date and time function
y$Date_new <- as.Date(y$Date, "%d/%m/%Y")
y$Date_time <- chron(dates=y$Date,times=y$Time,format=c('d/m/Y','h:m:s'))

#Save the plot
png('rplot2.png', width = 480, height = 480)

#This builds the histogram for plot 2
plot(y$Date_time,y$Global_active_power,col="red",main="Global Active Power", ylab="Global Active Power (killowats)", xlab="", type="n")
lines(y$Date_time,y$Global_active_power,type="l")

# reset the device
dev.off()
