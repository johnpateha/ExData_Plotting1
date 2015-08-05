plot2 <- function () {
        # Set filename
        filename = "household_power_consumption.txt"

        # load data, clean NA and "?", left only specific dates 
        DT <- subset(na.omit(read.table(file= filename, sep=";", na.strings="?", 
                                        header=TRUE)), 
                     Date=="1/2/2007" | Date=="2/2/2007")
        # convert date and time to R-format
        DT$Time <- strptime(paste(DT$Date, DT$Time),"%d/%m/%Y %H:%M:%S")
        DT$Date <- as.Date(strptime(DT$Date,"%d/%m/%Y"))
        
        
        #plot 2, copy to png file
        
        par(mfrow = c(1,1), mar=c(3,5,2,2))
        with(DT, plot(Time, Global_active_power, col = "black", xlab="",
                      ylab = "Global Active Power (kilowatts)", type = 'n'))
        with(DT, lines(Time, Global_active_power,col = "black"))
        dev.copy(png, "plot2.png")
        dev.off()
       
        "Plot created, see WD!"
}