#read in the data from the table in the working directory
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#remove lines of data with missing data
data2<-na.omit(data)

#select only data from Feb 1 and 2 of 2007
data3<-data2[((data2$Date=="1/2/2007")|(data2$Date=="2/2/2007")),]

#open a png file, make the histogram and close the file
png("plot1.png",width=480,height=480)
hist(data3$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()