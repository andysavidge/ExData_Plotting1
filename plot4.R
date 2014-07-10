dfnames=read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
df=read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
              header=TRUE,sep=";",skip=66636,nrows=(69517-66637))
colnames(df)=colnames(dfnames)
dt=paste(df$Date,df$Time)
dt2=strptime(dt,"%d/%m/%Y %H:%M:%S")
df$dt=dt2
#
## plot4
png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white",  res = NA)
par(mfrow=c(2,2))
#
## row 1 col 1 plot for plot4
plot(df$Global_active_power,type="l", ylab="Global Active Power", xaxt='n',xlab='')
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
#
## row 1 col 2 plot for plot4
plot(df$Voltage,type='l',ylab="Voltage",xaxt='n',xlab='datetime')
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
#
## row 2 col 1 plot for plot4
y3range=c(0,max(df$Sub_metering_1))
plot(df$Sub_metering_1,type="l",col='Black',ylim=y3range, ylab="Energy sub metering", xaxt='n',xlab='')
par(new=T)
plot(df$Sub_metering_2,type='l',col='Red',ylim=y3range,xlab='',ylab='',axes=F)
par(new=T)
plot(df$Sub_metering_3,type='l',col='Blue',ylim=y3range,xlab='',ylab='',axes=F)
legend('topright',bty='n',lwd=1,col=c('black','red','blue'),legend=c("Sub_metering_1",'Sub_metering_2','Sub_metering_3'))
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
#
## row 2 col 2 plot for plot4
plot(df$Global_reactive_power,type='l',ylab="Global_reactive_power",xaxt='n',yaxt='n',xlab='datetime')
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0.0,0.1,0.2,0.3,0.4,0.5))
dev.off()

