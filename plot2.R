dfnames=read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
df=read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
              header=TRUE,sep=";",skip=66636,nrows=(69517-66637))
colnames(df)=colnames(dfnames)
dt=paste(df$Date,df$Time)
dt2=strptime(dt,"%d/%m/%Y %H:%M:%S")
df$dt=dt2
## plot 2
y2="Global Active Power (kilowatts)"
x2=c("Thu","Fri","Sat")
py2=df$Global_active_power
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA)
plot(py2,type="l", ylab=y2, xaxt='n',xlab='')
axis(1, at=c(0,1440,2880), labels=x2)
dev.off()
