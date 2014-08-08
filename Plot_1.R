# Plot_1.R
# This code will create the plot_1 assignment
#This series of commands will get the column classes before the read command for the whole table
#and make sure they stay correct later
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

#Need to convert the date data to 2 digit month and day.  Currently is one digit and is causing the date function to be off.
#This code isn't currently doing what I want.  Will see if it is necessary for the plotting
y$Date_new <- as.Date(paste(paste("0",substr(y$Date,3,3),sep=""),paste("0",substr(y$Date,1,1),sep=""),substr(y$Date,5,8),sep="/"), "%m/%d/%Y")


#Save the plot
png('rplot1-1.png')

#This builds the histogram for plot 1
hist(y$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power")

# reset the device
dev.off()
