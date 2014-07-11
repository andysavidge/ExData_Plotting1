dfnames <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                      header=TRUE, sep=";", nrows=1)  # get header names
df <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
              header=TRUE, sep=";", skip=66636, nrows=(69517-66637))  # get only needed 2 days of data
colnames(df) <- colnames(dfnames)  # copy header names to the 2 days of data
dt <- paste(df$Date, df$Time)  # put date & time together to use strptime function to store dates&times
dt2 <- strptime(dt, "%d/%m/%Y %H:%M:%S")
df$dt <- dt2
y3range <- c(0, max(df$Sub_metering_1))
png(filename = "plot3.png",
    width=480, height=480, units="px", pointsize=12,
    bg="white", res=NA)
plot(df$Sub_metering_1, type="l", col='Black', ylim=y3range, 
     ylab="Energy sub metering", xaxt='n', xlab='')
par(new=T)
plot(df$Sub_metering_2, type='l', col='Red', ylim=y3range, 
     xlab='', ylab='', axes=F)
par(new=T)
plot(df$Sub_metering_3, type='l', col='Blue', ylim=y3range, 
     xlab='', ylab='', axes=F)
legend('topright', lwd=1, col=c('black','red','blue'), 
       legend=c("Sub_metering_1",'Sub_metering_2','Sub_metering_3'))
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()
