#Question 1#

MethodA=c(68.0, 68.0, 68.0, 70.0, 72.0, 72.0, 72.5, 73.0, 74.0, 74.0, 75.0, 75.0, 75.0, 75.0, 76.0, 76.4)
MethodB=c(68.8, 68.9, 68.9, 69.6, 70.1, 70.4, 70.4, 70.4, 70.4, 70.5, 71.2, 72.0, 72.0, 72.0, 72.0, 73.6)
MethodC=c(70.2, 70.5, 70.5, 70.7, 70.8, 70.9, 71.0, 71.0, 71.0, 71.0, 71.0, 71.5, 71.5, 71.5, 71.5, 71.6)
MethodD=c(70.0, 70.0, 70.0, 70.0, 70.2, 70.5, 70.5, 70.7, 70.7, 70.7, 71.0, 71.1, 71.5, 71.6, 72.1, 72.3)
#This creates vectors for each of the different methods#

#Part A#
mean(MethodA)
mean(MethodB)
mean(MethodC)
mean(MethodD)
#This calculates the mean for each method#

#Part B#
median(MethodA)
median(MethodB)
median(MethodC)
median(MethodD)
#This calculates the median for each method#

#Part C#
quantile(MethodA, probs = c(0.25, 0.75))
quantile(MethodB, probs = c(0.25, 0.75))
quantile(MethodC, probs = c(0.25, 0.75))
quantile(MethodD, probs = c(0.25, 0.75))
#This calculates Q1 and Q3 for each method#

#Part D#
sd(MethodA)
sd(MethodB)
sd(MethodC)
sd(MethodD)
#This calculates the SD for each method#

#Part F#
boxplot(list(A=MethodA, B=MethodB, C=MethodC, D=MethodD))
#This creates a side-by-side box plot for each method#

