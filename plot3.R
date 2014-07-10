dfnames=read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
df=read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
              header=TRUE,sep=";",skip=66636,nrows=(69517-66637))
colnames(df)=colnames(dfnames)
dt=paste(df$Date,df$Time)
dt2=strptime(dt,"%d/%m/%Y %H:%M:%S")
df$dt=dt2
py1=df$Sub_metering_1
py2=df$Sub_metering_2
py3=df$Sub_metering_3
y3="Energy sub metering"
x3=c("Thu","Fri","Sat")
p31="Sub_metering_1"
p32="Sub_metering_2"
p33="Sub_metering_3"
y3range=c(0,max(py1))
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA)
plot(py1,type="l",col='Black',ylim=y3range, ylab=y3, xaxt='n',xlab='')
par(new=T)
plot(py2,type='l',col='Red',ylim=y3range,xlab='',ylab='',axes=F)
par(new=T)
plot(py3,type='l',col='Blue',ylim=y3range,xlab='',ylab='',axes=F)
legend('topright',lwd=1,col=c('black','red','blue'),legend=c("Sub_metering_1",'Sub_metering_2','Sub_metering_3'))
axis(1, at=c(0,1440,2880), labels=x3)
dev.off()
##
