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
  return(EXP)
}

plot1<-function()
{
  
  hist(EXP$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)" ,ylab="Frequency", col="red")
  
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
}

plt2<-function()
{
  #source(LoadData.R)
  
  EXP<-load_data()
  
  plot(EXP$Time, EXP$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
}