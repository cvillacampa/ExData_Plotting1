library(lubridate)

#Reads the entire dataset
data<-read.csv2("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, dec = ".", nrows=2075259)

#Transforms the dates and hours using lubridate
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)


#Subsets for the two dates "2007-02-01" and "2007-02-02"
data_feb<-subset(data,data$Date>=ymd("2007-02-01") & data$Date<=ymd("2007-02-02"))

#Configures the exit file
png("plot1.png")

hist(data_feb$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")


#Saves png
dev.off()