plot1 <- function () {
        # Set filename
        filename = "household_power_consumption.txt"

        # load data, clean NA and "?", left only specific dates 
        DT <- subset(na.omit(read.table(file= filename, sep=";", na.strings="?", 
                                        header=TRUE)), 
                     Date=="1/2/2007" | Date=="2/2/2007")
        # convert date and time to R-format
        DT$Time <- strptime(paste(DT$Date, DT$Time),"%d/%m/%Y %H:%M:%S")
        DT$Date <- as.Date(strptime(DT$Date,"%d/%m/%Y"))
        
           
        #plot 1, copy to png file 
        par(mfrow = c(1,1), mar=c(5,5,3,2))
        with(DT, hist(Global_active_power,col="red", main="Global Active Power", 
                      xlab="Global Active Power (kilowatts)"))
        dev.copy(png, "plot1.png")
        dev.off()

        "Plot created, see WD!"
}