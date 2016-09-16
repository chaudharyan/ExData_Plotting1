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

# Set x and y axis data
    x<-f$DateTime
    y<-f$Sub_metering_1

# Plot x and y labels but does not produce any points or line
    plot(x,y, type="n",xlab="", ylab="Energu sub metering")
        
    # Plot three diferent lines series in the above blank graph    
        points(f$DateTime, f$Sub_metering_1, col="black", type="l")
        points(f$DateTime, f$Sub_metering_2, col="red", type="l")
        points(f$DateTime, f$Sub_metering_3, col="blue", type="l")
        
    #Add legend 
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))


# Set Margins for the graph
par(mar=c(6,6,2,2))

 
# Save the graph as a png file in the working directory
    dev.copy(png, file="plot3.png", width=480, height=480,units="px")
    dev.off()



