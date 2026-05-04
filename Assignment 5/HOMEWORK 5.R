#QUESTION 1#

#Given Values#
xbar = 7.2
mean = 7.5
sd = 1
n = 40

#test statistic# 
t = (xbar-mean)/(sd/sqrt(n))

#Critical Values#
CriticalValue05 = qt(0.05,df=n-1)
CriticalValue01 = qt(0.01, df=n-1)

#p-value#
pvalue = pt(-1.897, 39)

#Question 2#
pvalue = pt(2.35, 188, lower.tail=FALSE)

#Question 3#
online = c(72.9, 74.7, 64.3, 83.2, 66, 70.8, 77.5, 68.8)
flipped = c(74.7, 75.5, 82.8, 91.5, 80.2, 74.4, 82.7, 77)
traditional = c(84.8, 90.9, 81.3, 85, 80.6, 84.2, 86.3, 80.1)
scores = c(online, flipped, traditional)

method = factor(rep(c("oniline", "flipped", "traditional"), each=8))

anova = aov(scores~method)

summary(anova)

TukeyHSD(anova)
