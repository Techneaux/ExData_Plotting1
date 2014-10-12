#download data
temp_data <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp_data)
data <- read.table(unz(temp_data, "household_power_consumption.txt"), header=TRUE,na.strings="?",sep=";")
unlink(temp_data)

#only plot two days worth
data_sub <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

#create a TimeDate column for plotting
data_sub$TD <- strptime(paste(data_sub$Date, data_sub$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

png(filename = "plot3.png",
    width = 480, height = 480)

plot(data_sub$TD,data_sub$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="")

        lines(data_sub$TD,data_sub$Sub_metering_2,col="Red")

        lines(data_sub$TD,data_sub$Sub_metering_3,col="Blue")

        legend("topright",lwd=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
