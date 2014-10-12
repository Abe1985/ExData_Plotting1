## read the table into R
x <- read.table("household_power_consumption.txt", header= TRUE, sep= ";", na.strings="?" )

##create a column that contains the combined Date and Time:
x$combine <- paste(x$Date,x$Time, sep=" ") ##merge Date and Time strings together
x$combine <- strptime(x$combine, format= "%d/%m/%Y %H:%M:%S") ##change them in to date foramt

x$Date2 <- as.Date(x$Date, format="%d/%m/%Y")

##create the subset that only contains the dates a and b
a <- as.Date("2007-02-01", format="%Y-%m-%d")
b <- as.Date("2007-02-02", format="%Y-%m-%d")
xs <- x[x$Date2 %in% c(a,b),]

##on order to release the workspace remove x
rm(x)

## create plot 1
hist(xs$Global_active_power, col= "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)")
par(mar=c(4,4,2,2))

## save the plot in a png file
dev.copy(png, file= "plot1.png", width= 480, height= 480)
dev.off()