library(data.table)
mainDir <- "~/R/DS Coursera/Exploratory Data Analysis/Wk1"
setwd(mainDir)
data11<-read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),sep = ";",header = TRUE, na.strings = "?")
data11$Date<-as.Date(data11$Date,format = "%d/%m/%Y")
data11$Time<-as.ITime(data11$Time,format = "%H:%M:%S")
data11 <- data11[data11$Date >= "2007-2-1" & data11$Date <= "2007-2-2", ]
png("plot1.png",width=480,height=480,units="px")
with(data11,hist(Global_active_power,col="orange red",main = "Global Advice Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.off()
