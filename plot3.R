library(data.table)
mainDir <- "~/R/DS Coursera/Exploratory Data Analysis/Wk1"
setwd(mainDir)
data11<-read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),sep = ";",header = TRUE, na.strings = "?")
data11$Date<-as.Date(data11$Date,format = "%d/%m/%Y")
data11$Time<-as.ITime(data11$Time,format = "%H:%M:%S")
data11 <- data11[data11$Date >= "2007-2-1" & data11$Date <= "2007-2-2", ]
data11$datetime<-as.POSIXct(paste(data11$Date, data11$Time), format="%Y-%m-%d %H:%M:%S")
png("plot3.png",width=480,height=480,units="px")
with(data11,plot(datetime,Sub_metering_1, col="black",type="l",main = "",xlab = "", ylab = "Global Active Power (kilowatts)"))
with(data11,lines(datetime,Sub_metering_2,col="red",type="l"))
with(data11,lines(datetime,Sub_metering_3,col="blue",type="l"))
legend("topright",pch="-",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()