dfnames <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                      header=TRUE, sep=";", nrows=1)  # get header names
df <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
              header=TRUE, sep=";", skip=66636, nrows=(69517-66637))  # get only needed 2 days of data
colnames(df) <- colnames(dfnames)  # copy header names to the 2 days of data
dt <- paste(df$Date,df$Time)  # put date & time together to use strptime function to store dates&times
dt2 <- strptime(dt,"%d/%m/%Y %H:%M:%S")
df$dt <- dt2
png(filename="plot1.png", width=480, height=480, units="px", pointsize=11,
    bg="white", res=NA)
px1=df$Global_active_power
hist(df$Global_active_power, breaks=15, main="Global Active Power", 
     xlab='n', xlim=c(0,10), col="red", xaxt='n', yaxt='n')
mtext("Global Active Power (kilowatts)                     ", side=1, line=3) 
axis(side=1, at=seq(0,6,2), labels=seq(0,6,2))
axis(side=2, at=seq(0,1200,200), labels=seq(0,1200,200))
dev.off()

