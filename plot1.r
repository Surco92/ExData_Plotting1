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
hist(subs.data$Global_active_power,col="red",breaks=12,main="Global Active Power",xlab="Global Active Power (killowats)")
dev.copy(png,file=plot1.png)
dev.off()









