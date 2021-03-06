# plot1.R

print(paste(".PNG files will be written to", getwd()))

allpower <- read.csv("c:/Data/household_power_consumption.txt", header=TRUE, sep=";")

# alternatively, load data from dropbox by uncommenting and running four lines below
# install.packages("repmis")
# require(repmis)
# DataURL = "https://www.dropbox.com/s/khby83wivw60wef/household_power_consumption.txt?dl=0"
# allpower <- repmis::source_data(DataURL, sep = ";", header = TRUE)

dt <- paste(allpower$Date, allpower$Time)
allpower$datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

power <- allpower[!is.na(allpower$datetime) & allpower$datetime >= as.POSIXlt("2007-02-01") & 
                    allpower$datetime < as.POSIXlt("2007-02-03"),]

power$Global_active_power[power$Global_active_power=="?"] <- NA
power$Global_active_power <- as.numeric(power$Global_active_power)

power$Global_reactive_power[power$Global_reactive_power=="?"] <- NA
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)

power$Voltage[power$Voltage=="?"] <- NA
power$Voltage <- as.numeric(power$Voltage)

power$Voltage[power$Voltage=="?"] <- NA
power$Voltage <- as.numeric(power$Voltage)

power$Sub_metering_1[power$Sub_metering_1 =="?"] <- NA
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)

power$Sub_metering_2[power$Sub_metering_2 =="?"] <- NA
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)

power$Sub_metering_3[power$Sub_metering_3 =="?"] <- NA
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

# plot 1

png("plot1.png", width=480, height=480, units="px")
hist(power$Global_active_power, col="red", 
        xlab="Global Active Power (kilowatts)", 
        main="Global Active Power")
dev.off()

