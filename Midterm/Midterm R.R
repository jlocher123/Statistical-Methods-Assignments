# QUESTION 1#
Penguins_data=read.csv("C:/Users/jloch/Downloads/Palmer_Penguins.csv") #This imports the file and saves it#

str(Penguins_data) #This examines the structure of the data set#

Penguins_data$species=as.factor(Penguins_data$species)
Penguins_data$island=as.factor(Penguins_data$island)
Penguins_data$sex=as.factor(Penguins_data$sex)
#These three commands convert all the categorical variables into factors#
 
summary(Penguins_data) #This provides a summary of the data set#

# QUESTION 2#
tbl_1=table(Penguins_data$species, Penguins_data$island) 
#This creates a two-way frequency table for species and island
tbl_1

tbl_2=table(Penguins_data$species, Penguins_data$sex, exclude=NULL )
#This creates a two-way frequency table for species and sex, excluding missing values#
tbl_2

barplot(tbl_1, beside = TRUE,
        xlab = "Species",
        ylab = "Count",
        main = "Penguin Species Distribution by Island",
        legend.text = TRUE, 
        args.legend = list(x = "topright", title = "Island"))
#This creates  a bargraph for tbl_1#

# QUESTION 3#
Penguins_data_num = Penguins_data[, sapply(Penguins_data, is.numeric)]
Penguins_data_num$rowid = NULL
#This saves only the numerical variables while removing rowid#
str(Penguins_data_num)

Penguins_data_num = na.omit(Penguins_data_num)
#this removes any rows with missing or incomplete data#

mean(Penguins_data_num$bill_length_mm)
sd(Penguins_data_num$bill_length_mm)
median(Penguins_data_num$bill_length_mm)
IQR(Penguins_data_num$bill_length_mm)
#Statistics for bill length#

mean(Penguins_data_num$bill_depth_mm)
sd(Penguins_data_num$bill_depth_mm)
median(Penguins_data_num$bill_depth_mm)
IQR(Penguins_data_num$bill_depth_mm)
#Statistics for bill depth#

mean(Penguins_data_num$flipper_length_mm)
sd(Penguins_data_num$flipper_length_mm)
median(Penguins_data_num$flipper_length_mm)
IQR(Penguins_data_num$flipper_length_mm)
#Statistics for flipper length#

hist(Penguins_data_num$body_mass_g,
     breaks = 8,
     probability = TRUE,
     main= "Density Histogram",
     xlab = "Body Mass",
     ylab = "Density")
#This creates a histogram#

lines(density(Penguins_data_num$body_mass_g),
      col = "red",
      lwd = 2)
#This creates a smooth density curve on top of the histogram#

#QUESTION 4# 
pairs(Penguins_data_num,
      pch = 19,
      cex = 0.2,
      upper.panel = NULL)
#this creates a scatter plot matrix of all numerical variables#

boxplot(body_mass_g ~ species,
        data = Penguins_data,
        xlab= "Species",
        ylab = "Body Mass",
        main = "Body Mass by Species")
#This creates 3 side by side box plots to compare body mass by species#

#QUESTION 5#
1-ppois(23, lambda = 12)
#This calculates P(Y>=24) since you can use the compliment rule and can calculate 1-P(Y<=23)#

#QUESTION 6#
chinstrap = subset(Penguins_data, species =="Chinstrap")
#this filters out only chinstrap penguins from the dataset#

mean(chinstrap$body_mass_g)
#this caculates the mean of the body mass of Chinstrap penguins#

round(mean(chinstrap$body_mass_g), 2)
#This rounds the answer to two decimal places#

n = nrow(chinstrap)
n
#This find the number for n of Chinstrap penguins in the data set#

325/sqrt(66)
#this is the standard error#

pnorm(3675, mean = 3744.7, sd = 40, lower.tail=FALSE)
#this calculates the P(x-bar >= 3675)#
