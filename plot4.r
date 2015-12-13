#Course Project 1 for Exploratory Data Analysis: Plot 4
#Author: Eric Jenvey

#Read in the file
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Convert the Date variable to a Date data type
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Read the data frame into the dplyr package data frame
power_df <- tbl_df(power)

#Filter down to only the two indicated days
power_filter <- filter(power_df,Date=="2007-02-01" | Date=="2007-02-02")

#For memory, remove the two intermediate data frames
rm(power)
rm(power_df)

#convert the time variable to a time data type
power_filter$Time <- times(power_filter$Time)

#combine both the Date and the Time into a new DateTime variable
power_filter$Datetime <- strptime(paste(as.character(power_filter$Date),
                                        as.character(power_filter$Time)),
                                  format = "%Y-%m-%d %H:%M:%S")

#convert all sub_metering_x variables to numerics
power_filter$Sub_metering_1 <- as.numeric(paste(power_filter$Sub_metering_1))
power_filter$Sub_metering_2 <- as.numeric(paste(power_filter$Sub_metering_2))
power_filter$Sub_metering_3 <- as.numeric(paste(power_filter$Sub_metering_3))

#convert Voltage and Global_reactive_power to a numeric
power_filter$Global_reactive_power <- as.numeric(paste(power_filter$Global_reactive_power))
power_filter$Voltage <- as.numeric(paste(power_filter$Voltage))

#open a PNG graphics device
png(filename="plot4.png", width=480, height=480)

#set to a 2x2 plot using par mfrow
par(mfrow=c(2,2))

#Plot the graph from plot2
plot(power_filter$Datetime,power_filter$Global_active_power,type="l", 
     xlab="",ylab="Global Active Power (kilowatts)")

#Plot voltage
plot(power_filter$Datetime,power_filter$Voltage,type="l",xlab="datetime", ylab="Voltage")

#Plot the graph from plot 3
plot(power_filter$Datetime,power_filter$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

#use par new=T to add lines for sub_metering_2 and sub_metering_3
par(new=T)
lines(power_filter$Datetime, power_filter$Sub_metering_2, col="red")
lines(power_filter$Datetime, power_filter$Sub_metering_3, col="blue")

#add a legend
legend("topright",col=c("black","red","blue"), legend=
         c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, cex=0.5)

par(new=F)

#plot global_reactive_power
plot(power_filter$Datetime,power_filter$Global_reactive_power,type="l", 
     xlab="Datetime",ylab="Global_reactive_power")

#Close the graphics device
dev.off()

