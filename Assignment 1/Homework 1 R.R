#A
airquality #shows the airquality dataset
?airquality #shows the help page for the Airquality dataset
str(airquality) #shows the structure of airquality
head(airquality) #shows the first 6 rows of the airquality dataset
summary(airquality) #shows basic descriptive statistics of the dataset

#B
new_airquality=airquality #created a new dataset named new_airquality
degF_to_degC=5/9 #new object for F to C conversion
offset=32 #new offset
temp=new_airquality$Temp #created new object for temp, which was from the dataset
tempC=(temp-offset)*degF_to_degC #creates a new object for tempC, which is the old temp converted to C
new_airquality$TempC=tempC #creates a new column in the new_airquality dataset for TempC
head(new_airquality) 
date_index=seq(
  from=as.Date("1973-05-01"),
  to=as.Date("1973-09-30"),
  by= "day"
)#This generated a sequence of calendar dates from May 1, 1973 to September 30, 1973
new_airquality$Date=date_index #This adds it to the new_airquality dataset
head(new_airquality)


#C
new_airquality$MonthF=factor(
  new_airquality$Month,
  levels=5:9, #this specifies which number to assign which month 5-9
  labels=c("May", "Jun", "Jul", "Aug", "Sep"), #this tells which month gets which number
  ordered=TRUE #this makes it an ordered factor
)
head(new_airquality)
table(new_airquality$MonthF) #this creates a one-way frequency table that shows the number of days in each month

temp25=new_airquality$TempC>25 #this creates a logical variable for temperatures that are greater than 25
table(new_airquality$MonthF, temp25)#this creates a two-way frequency table that includes the new temp25 logic

#D
new_airquality[10:15, c("Ozone", "Temp", "Wind")] #the 10:15 selects the rows 10 through 15
#while the next section allows for those 3 columns to be selected only
drop=c(30:120, 130:145) #this creates an object to drop the selected rows
new_airquality[-drop,] #this uses negative indexing to drop the specified rows
temp30wind8=new_airquality[new_airquality$TempC>=30 & new_airquality$Wind<8,]
#filters rows where TempC >=30 and where Wind <8
temp30wind8
solarRmissing=new_airquality[new_airquality$MonthF=="Aug" & is.na(new_airquality$Solar.R),]
#this filters rows where the month is Aug and the value fo Solar.R is NA
solarRmissing

#E
mean(new_airquality$Ozone)
median(new_airquality$Ozone)
sd(new_airquality$Ozone)
#all three of these come back with NA because some of the value within them are NA.
mean(new_airquality$Ozone, na.rm=TRUE)
median(new_airquality$Ozone, na.rm=TRUE)
sd(new_airquality$Ozone, na.rm=TRUE)
#removing the NAs from the equation makes it possible to calculate the values.
aq_noNA=na.omit(new_airquality) #this omits any values in new_airquality that are NA
nrow(aq_noNA) #this calculates how many rows are left

#F
ozone_75=quantile(new_airquality$Ozone, .75, na.rm=TRUE) #This creates the 75th percentile for Ozone.
high_ozone=subset(new_airquality, Ozone>=ozone_75) #This creates a subset for the top 25% of Ozone
high_ozone
new_airquality=transform(
  new_airquality,
  Ozone_z=(Ozone-mean(Ozone, na.rm =TRUE))/sd(Ozone, na.rm=TRUE)
)
#This adds a new column while also subtracting the mean while ignoring NAs, then divides by the SD
#This creates a new column containing Z-scores 
head(new_airquality[, c("Ozone", "Ozone_z")])
summary(new_airquality$Ozone_z)

#G

par(mfrow=c(1,2)) #This sets the parameters for plotting windows into a grid with 1 row and 2 columns

plot(
  aq_noNA$TempC, #this is the x-axis
  aq_noNA$Ozone, #this is the y-axis
  pch=15, #this is the plotting symbol
  col="green",
  xlab="Temperature (C)",
  ylab= "Ozone",
  main="Ozone vs Tempurature (C)"
)
  abline(lm(Ozone~TempC, data=aq_noNA), col="red", lwd=2) #This adds a fitted regression line
  
boxplot(Ozone ~ MonthF, data = aq_noNA,
          xlab = "Month", ylab = "Ozone (ppb)",
          main = "Monthly Ozone Levels")

