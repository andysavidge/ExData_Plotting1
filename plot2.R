dfnames <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                      header=TRUE, sep=";", nrows=1)  # get header names
df <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
              header=TRUE, sep=";", skip=66636, nrows=(69517-66637))  # get only needed 2 days of data
colnames(df) <- colnames(dfnames)  # copy header names to the 2 days of data
dt <- paste(df$Date, df$Time)  # put date & time together to use strptime function to store dates&times
dt2 <- strptime(dt, "%d/%m/%Y %H:%M:%S")
df$dt <- dt2
png(filename = "plot2.png", width=480, height=480, units="px", pointsize=12, 
    bg="white", res=NA)
plot(df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", 
     xaxt='n', xlab='')
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()

