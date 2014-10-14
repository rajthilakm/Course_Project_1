# Load dataset into R
load_data <- function() 
{
  filename <- "HPC.txt"
  EXP <- read.table(filename,header=TRUE,sep=";",na="?")
  
  
  # convert date and time variables to Date/Time class
  
  EXP$Time <- strptime(paste(EXP$Date, EXP$Time), "%d/%m/%Y %H:%M:%S")
  EXP$Date <- as.Date(EXP$Date, format="%d/%m/%Y")
  
  # only use data from the dates 2007-02-01 and 2007-02-02
  select_date <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  EXP <- subset(EXP, Date %in% select_date)
}


plot3<-function()
{
  exp<-load_data()
  
  plot( exp$Time ,exp$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(exp$Time,exp$Sub_metering_2, col='Red')
  lines(exp$Time,exp$Sub_metering_3, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
}
