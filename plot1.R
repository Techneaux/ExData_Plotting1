#download data
temp_data <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp_data)
data <- read.table(unz(temp_data, "household_power_consumption.txt"), header=TRUE,na.strings="?",sep=";")
unlink(temp_data)

#only plot two days worth
data_sub <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

png(filename = "plot1.png",
    width = 480, height = 480)
hist(data_sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
