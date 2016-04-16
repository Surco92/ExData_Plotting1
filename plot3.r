### LOADING DATA
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv(unz(temp,"household_power_consumption.txt"),sep=";",na.strings="?") 
unlink(temp)
# loading data from HDD: data <- read.csv("D:/R/ExpAnalysis/household_power_consumption.txt", sep=";", na.strings="?")


### TIME TRANSFORMATION
summary(data)
timedate<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
new.data<-cbind(data,timedate)


### DATA SUBSET
subs.data1<-subset(new.data,as.Date(timedate,tz="")==as.Date("2007-02-01",tz=""))
subs.data2<-subset(new.data,as.Date(timedate,tz="")==as.Date("2007-02-02",tz="")) 
# as.Date() and strptime() have different default timezones
subs.data<-rbind(subs.data1,subs.data2)

### PLOT
plot(subs.data$Sub_metering_1~subs.data$timedate,type="l",main="", ylab="Energy sub metering", xlab="")
points(subs.data$Sub_metering_2~subs.data$timedate,type="l", col="red")
points(subs.data$Sub_metering_3~subs.data$timedate,type="l", col="blue")
legend("topright", names(subs.data[7:9]),col=c("black","red","blue"),lwd=1,lty=1)

### PNG
png(filename="plot3.png")
plot(subs.data$Sub_metering_1~subs.data$timedate,type="l",main="", ylab="Energy sub metering", xlab="")
points(subs.data$Sub_metering_2~subs.data$timedate,type="l", col="red")
points(subs.data$Sub_metering_3~subs.data$timedate,type="l", col="blue")
legend("topright", names(subs.data[7:9]),col=c("black","red","blue"),lwd=1,lty=1)
dev.off()