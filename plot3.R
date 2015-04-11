hpc_data=read.csv("household_power_consumption.txt",sep=";",na.strings="?")

hpc_data$Date=as.Date(hpc_data$Date,format="%d/%m/%Y")
hpc_data_sub=subset(hpc_data,subset=(Date>="2007-02-01" & Date<="2007-02-02"))

hpc_data_sub$datetime=paste(hpc_data_sub$Date,hpc_data_sub$Time)
hpc_data_sub$datetime=strptime(hpc_data_sub$datetime,format="%Y-%m-%d %H:%M:%S")
hpc_data_sub$Global_active_power=as.numeric(hpc_data_sub$Global_active_power)

plot(hpc_data_sub$datetime,hpc_data_sub$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(hpc_data_sub$datetime,hpc_data_sub$Sub_metering_2,col="red")
lines(hpc_data_sub$datetime,hpc_data_sub$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1.7,col=c("black","red","blue"))

dev.copy(png,"plot3.png",height=480,width=480)
dev.off()

