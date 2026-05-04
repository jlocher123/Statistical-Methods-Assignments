# HOMEWORK 3 #

#PROBLEM 1#

dbinom(20, size=150, prob=.05) #this find P (X = 20)#

pbinom(5, size=150, prob=.05) #this finds P (x <= 5)#

#PROBLEM 2#

dpois(9, lambda=5) #this finds P (x = 9)#

1 - ppois(4, lambda=5) #this finds P (x >= 5)#

#PROBLEM 3#

1 - pnorm(6, mean=5, sd=1.2) #This find P (x > 6)#

pnorm(7, mean=5, sd=1.2) - pnorm(4, mean=5, sd=1.2) #This finds P (4 < X < 7)#

qnorm(.90, mean=5, sd=1.2) #This finds the top 10% of battery lifetimes#