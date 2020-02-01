

#Load data 
filename <- "household_power_consumption.txt"
filepath <- "./exdata_data_household_power_consumption/"
fileset <- paste(filepath,filename, sep="",collapse=NULL)
df <- read.table(fileset,header = TRUE, sep=";", dec=".", colClasses=c("character", "character", rep("numeric",7)),na="?")

#Change variables "Date" and "Time" into Date/Time class
df$Time <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")


#Retrieve the dates from 2007/02/01 to 2007/02/02
limited_df <- subset(df,df$Date=="2007-02-01" | df$Date =="2007-02-02")

#Make graph for plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# plot between timeline and "Global Active Power"
plot(limited_df$Time, limited_df$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")

# plot between timelinej and "Voltage"
plot(limited_df$Time, limited_df$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot between timeline and "Energy sub metering"
plot(limited_df$Time, limited_df$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
lines(limited_df$Time, limited_df$Sub_metering_2, type="l", col="red")
lines(limited_df$Time, limited_df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# plot between timeline and "Global Reactive Power"
plot(limited_df$Time, limited_df$Global_reactive_power, type="l", xlab="datetiem", ylab="Global reactive power")

dev.off()
