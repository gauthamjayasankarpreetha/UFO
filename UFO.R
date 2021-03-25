
#1 Created a new Project UFO  and Replaced empty spaces with NA
ufo_data <- read.csv("ufo.csv",na.strings=c("","NA"))

#2 Structure of 15 rows and Confirmed 89071 rows in it 
ufo_data[1:15,]


n_row <- nrow(ufo_data)
n_row

#3 DateTime Field has been converted Date variable
converted_date <- as.Date(ufo_data$date.posted, "%m/%d/%y")
converted_date
str(converted_date)

#4 Updated UFO data frame with new Data Structure
ufo_data$date.posted <-converted_date
str(ufo_data)
ufo_data[1:15,]

#5 Modified with updated variable names
names(ufo_data)

names(ufo_data)[6] <-"DurationSeconds"
names(ufo_data)[7] <-"DurationHoursMin"
names(ufo_data)[9] <-"DatePosted"

names(ufo_data)
ufo_data


#6 Recorded the variable and Its numerical Variable Show as new Structure in the data frame 

ufo_data$latitude <- as.numeric(ufo_data$latitude) 

str(ufo_data)

#7 Founded 1) How many records have no missing data content? 2)How many variables have all data variables missing? 

install.packages("mice")
library(mice)
md.pattern(ufo_data)

# List rows with missing values 
missingValues <- sum(is.na(ufo_data))
missingValues


# List rows that do not have missing values
install.packages("VIM")
library(VIM)
missing_values <- aggr(ufo_data, prop = FALSE, numbers = TRUE)

#8 After Sorting out UFO data frame by shape and then by city content has been stored into new data frame and Displayed 15 rows of data in this new data frame
ufo_data <- ufo_data[c("datetime", "shape","city", "state", "country", "DurationSeconds" , "DurationHrsMins","comments","DatePosted","latitude","longitude" )]
ufo_data
names((ufo_data))
sorted_ufo_data <- ufo_data[c("datetime","country","shape","city")]
sorted_ufo_data
head(sorted_ufo_data,15)

