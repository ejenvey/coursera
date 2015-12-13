#Course Project 1 for Exploratory Data Analysis: Plot 1
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

#Convert the Global Active Power to a numeric variable (for plotting)
power_filter$Global_active_power <- as.numeric(paste(power_filter$Global_active_power))

#Open a PNG graphics device
png(filename="plot1.png", width=480, height=480)

#Re-plot the histogram onto the PNG
hist(power_filter$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

#Close the PNG device
dev.off()