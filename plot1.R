plot1<-function(){
        temp <- tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        entire_file <- read.csv2(unz(temp, "household_power_consumption.txt"),stringsAsFactors=FALSE )
        unlink(temp)
        entire_file<-transform(entire_file,Date=as.Date(Date,"%d/%m/%Y"))
        feb_data <- subset(entire_file, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
        png("~/Coursera/plot1.png", width = 480, height = 480)
        hist(as.numeric(feb_data$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
        dev.off()
}