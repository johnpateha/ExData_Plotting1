plot4 <- function () {
        # Set filename
        filename = "household_power_consumption.txt"

        # load data, clean NA and "?", left only specific dates 
        DT <- subset(na.omit(read.table(file= filename, sep=";", na.strings="?", 
                                        header=TRUE)), 
                     Date=="1/2/2007" | Date=="2/2/2007")
        # convert date and time to R-format
        DT$Time <- strptime(paste(DT$Date, DT$Time),"%d/%m/%Y %H:%M:%S")
        DT$Date <- as.Date(strptime(DT$Date,"%d/%m/%Y"))
        
        
        #plot 4
        par(mfrow = c(2,2), mar=c(5,5,2,2))
        
        #plot 4.1
        with(DT, plot(Time, Global_active_power, col = "black", xlab="",
                      ylab = "Global Active Power", type = 'n'))
        with(DT, lines(Time, Global_active_power,col = "black"))
        
        #plot 4.2
        with(DT, plot(Time, Voltage, col = "black", xlab="datetime",
                      ylab = "Voltage", type = 'n'))
        with(DT, lines(Time, Voltage,col = "black"))
        
        #plot 4.3
        with(DT, plot(Time, Sub_metering_1, col = "black", xlab="",
                      ylab = "Energy sub metering",  type = 'n'))
        
        with(DT, lines(Time, Sub_metering_1,col = "black"))
        with(DT, lines(Time, Sub_metering_2,col = "red"))
        with(DT, lines(Time, Sub_metering_3,col = "blue"))
        legend("topright", lwd=1 , col = c("black", "red", "blue") , cex=0.4, 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        #plot 4.4
        with(DT, plot(Time, Global_reactive_power, col = "black", xlab="datetime",
                      ylab = "Global_reactive_power", type = 'n'))
        with(DT, lines(Time, Global_reactive_power,col = "black"))
        
        # copy to png file
        dev.copy(png, "plot4.png")
        dev.off()
        
        "Plot created, see WD!"
}