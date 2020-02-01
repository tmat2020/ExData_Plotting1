

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

#Make graph for plot2
png("plot2.png", width=480, height=480)
plot(limited_df$Time, limited_df$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
