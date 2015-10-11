q <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)
qdate <- as.Date(q$Date, format = "%d/%m/%Y")
x <- strptime(q[,2], format = "%H:%M:%S")
qtime <- paste(x$hour, x$min, x$sec)
q[,2] <- qtime
q[,1] <- qdate
q1 <- q[q$Date=="2007-02-01",]
q2 <- q[q$Date=="2007-02-02",]
qnew <- rbind(q1,q2)
#loaded dataset of the required dates in 'qnew'
hist(qnew$Global_active_power, col="red",main = "Global Active Power",xlab = "Global Active Power (Kilowatts)")
plot(qnew$Date,qnew$Sub_metering_1)
lines(qnew$Sub_metering_2,col="blue")
lines(qnew$Sub_metering_3,col="red")
