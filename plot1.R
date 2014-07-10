dfnames=read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
df=read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",
              header=TRUE,sep=";",skip=66636,nrows=(69517-66637))
colnames(df)=colnames(dfnames)
dt=paste(df$Date,df$Time)
dt2=strptime(dt,"%d/%m/%Y %H:%M:%S")
df$dt=dt2
## plot 1
t1="Global Active Power"
y1="Frequency"
x1="Global Active Power (kilowatts)"
px1=df$Global_active_power
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA)
hist(df$Global_active_power,breaks=15,main=t1,xlab=x1,xlim=c(0,10),col="red",xaxt='n',yaxt='n')
axis(side=1, at=seq(0,6,2), labels=seq(0,6,2))
axis(side=2, at=seq(0,1200,200), labels=seq(0,1200,200))
dev.off()
