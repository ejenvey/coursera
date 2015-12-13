#Course Project 1 for Exploratory Data Analysis: Plot 2
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

#Open a PNG graphics device
png(filename="plot2.png", width=480, height=480)

#Plot the scatterplot
plot(power_filter$Datetime,power_filter$Global_active_power,type="l", 
     xlab="",ylab="Global Active Power (kilowatts)")

#Close the PNG device
dev.off()