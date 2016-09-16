setwd("C:/Users/chaudharyan/Desktop/Exploratory Data- Coursera")


#Download the file and extract from the zipped file
    
    url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(url,destfile="Power Consumption.zip")
    unzip("./Power Consumption.zip")


# Read the unzip text file
    file<-read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# Close any previously opened Graph
    graphics.off()
    
# Extract only the rows with two dates below

    f<-subset(file,file$Date == "1/2/2007"|file$Date == "2/2/2007" )
 

# Convert the Date and Time variables to Date/Time 
    DT <-strptime(paste(f$Date, f$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
    f$DateTime<-DT

# Plot the histogram 
    x<-f$Global_active_power
    hist(x, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")


# Set Margins for the graph
    par(mar=c(6,6,2,2))
    
# Save the graph as a png file in the working directory  
    dev.copy(png, file="plot1.png", width=480, height=480,units="px")
    dev.off()



