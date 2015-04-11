hpc_data=read.csv("household_power_consumption.txt",sep=";",na.strings="?")

hpc_data$Date=as.Date(hpc_data$Date,format="%d/%m/%Y")
hpc_data_sub=subset(hpc_data,subset=(Date>="2007-02-01" & Date<="2007-02-02"))

hpc_data_sub$datetime=paste(hpc_data_sub$Date,hpc_data_sub$Time)
hpc_data_sub$datetime=strptime(hpc_data_sub$datetime,format="%Y-%m-%d %H:%M:%S")
hpc_data_sub$Global_active_power=as.numeric(hpc_data_sub$Global_active_power)

hist(hpc_data_sub$Global_active_power,main="Global Active Power",xlab="Global active power (kilowatts)",ylab="Frequency",col="red")

dev.copy(png,"plot1.png",height=480,width=480)
dev.off()

