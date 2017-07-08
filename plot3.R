#read the data from a table in the working directory
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#remove lines with missing data
data2<-na.omit(data)

#select data from Feb 1 and 2 of 2007
data3<-data2[((data2$Date=="1/2/2007")|(data2$Date=="2/2/2007")),]

#combine the date and time columns and reformat as a date/time object
data3$datetime<-paste(data3$Date,data3$Time)
data3$datetime2<-strptime(data3$datetime,"%d/%m/%Y %H:%M:%S")

#create a png file with the desired plot and close the file
png("plot3.png",width=480,height=480)
plot(data3$datetime2,data3$Sub_metering_1,type="l",ylab="Energy sub metering")
lines(data3$datetime2,data3$Sub_metering_2,col="red")
lines(data3$datetime2,data3$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()