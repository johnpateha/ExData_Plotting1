plot3 <- function () {
        # Set filename
        filename = "household_power_consumption.txt"

        # load data, clean NA and "?", left only specific dates 
        DT <- subset(na.omit(read.table(file= filename, sep=";", na.strings="?", 
                                        header=TRUE)), 
                     Date=="1/2/2007" | Date=="2/2/2007")
        # convert date and time to R-format
        DT$Time <- strptime(paste(DT$Date, DT$Time),"%d/%m/%Y %H:%M:%S")
        DT$Date <- as.Date(strptime(DT$Date,"%d/%m/%Y"))
        
        
        #plot 3, copy to png file
        par(mfrow = c(1,1), mar=c(3,5,2,2))
        with(DT, plot(Time, Sub_metering_1, col = "black", xlab="",
                      ylab = "Energy sub metering",  type = 'n'))
        
        with(DT, lines(Time, Sub_metering_1,col = "black"))
        with(DT, lines(Time, Sub_metering_2,col = "red"))
        with(DT, lines(Time, Sub_metering_3,col = "blue"))
        legend("topright", lwd=1 , col = c("black", "red", "blue") , cex=0.8,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.copy(png, "plot3.png")
        dev.off()
        
     
        "Plot created, see WD!"
}