# Libraries needed
# install.packages("anytime")

library("anytime")

# Read the csv firle
# This dataset has NaN values and should be cleaned up.

# Set your working directory
setwd("~/Desktop/bitcoin-historical-data")

# This is about 3.603.136 rows
MyData <- read.csv(file="bitstampUSD_1-min_data_2012-01-01_to_2018-11-11.csv", header=TRUE, sep=",")

# Just complete cases, 1.214.182 will be dropped from dataset
# [ reached getOption("max.print") -- omitted 1214182 rows ]

MyData <- MyData [complete.cases(MyData),]

# Convert UNIX epoch to Date object
# You can use: df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%Y%m%d %H%M%S") or
# Convert timestamp to YMD using anytime function

# Now that data is on place and clened up you are ready to go.

MyData$Timestamp <- anytime(MyData$Timestamp)


# This must be done to inquire the dataset by date.
MyData$Timestamp <- as.Date(MyData$Timestamp)

# Write CSV in R
write.csv(MyData, file = "bitstampUSD_1-min_data_2012-01-01_to_2018-11-11-clean.csv")

# You can load the clean dataset from here
# MyData <- read.csv(file="bitstampUSD_1-min_data_2012-01-01_to_2018-11-11-clean.csv", header=TRUE, sep=",")

# Split using R Core 
# It could be easier to manipulate data by year
# subset(MyData, format(as.Date(Timestamp),"%Y")==2005)

MyData2011 <- with(MyData, MyData[(Timestamp >= "2011-01-01" & Timestamp < "2012-01-01"), ])
MyData2012 <- with(MyData, MyData[(Timestamp >= "2012-01-01" & Timestamp < "2013-01-01"), ])
MyData2013 <- with(MyData, MyData[(Timestamp >= "2013-01-01" & Timestamp < "2014-01-01"), ])
MyData2014 <- with(MyData, MyData[(Timestamp >= "2014-01-01" & Timestamp < "2015-01-01"), ])
MyData2015 <- with(MyData, MyData[(Timestamp >= "2015-01-01" & Timestamp < "2016-01-01"), ])
MyData2016 <- with(MyData, MyData[(Timestamp >= "2016-01-01" & Timestamp < "2017-01-01"), ])
MyData2017 <- with(MyData, MyData[(Timestamp >= "2017-01-01" & Timestamp < "2018-01-01"), ])
MyData2018 <- with(MyData, MyData[(Timestamp >= "2018-01-01" & Timestamp < "2019-01-01"), ])

#
# Writing CSV files per year
#

write.csv(MyData2011, file = "MyData2011.csv")
write.csv(MyData2012, file = "MyData2012.csv")
write.csv(MyData2013, file = "MyData2013.csv")
write.csv(MyData2014, file = "MyData2014.csv")
write.csv(MyData2015, file = "MyData2015.csv")
write.csv(MyData2016, file = "MyData2016.csv")
write.csv(MyData2017, file = "MyData2017.csv")
write.csv(MyData2018, file = "MyData2018.csv")

