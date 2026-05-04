#Question 1#
# These values are given#
xbar= 29
sigma = 4.5
n = 27

SE = sigma/sqrt(n) #Standard Error#

#95% Confidence Interval#

z_95 = qnorm(0.975)

ME_95 = z_95 * SE #Margin of Error#

#90% confidence Interval#
z_90 = qnorm(0.95)

ME_90 = z_90 * SE #Margin of Error for 90%#

#QUESTION 2#
question2data = c(85, 92, 76, 110, 95, 68, 74, 83, 79, 101, 72, 64, 77, 82, 88, 94, 120, 70, 75, 80)

xbar = mean(question2data)
sigma = 12
n = 20
SE_A = sigma/sqrt(n) #Standard Error for Part A#
ME_A = qnorm(0.975) * SE_A #Margin of Error for Part A#

sigmaB = sd(question2data) #Standard Deviation for Part B#
SE_B = sigmaB/sqrt(n) #Standard Error for Part B#
ME_B = 2.093 * SE_B #Margin of Error for Part B#


#QUESTION 3#
n = 1500
proportion = .42

SE = sqrt(proportion * (1- proportion)/n) #Standard Error#
ME = qnorm(0.995) * SE #Standard Error#

#QUESTION 4#
databefore = c(32, 28, 30, 25, 27, 29, 31, 26, 33, 24, 35, 28)
dataafter = c(41, 35, 38, 33, 31, 36, 40, 30, 42, 29, 43, 34)
difference = dataafter - databefore

mean = mean(difference)
sd = sd(difference)
n = 12
SE = sd/sqrt(n) #Standard Error#
ME = 2.718 * SE #Margin of Error#

#QUESTION 5#
## Data ---------------------------------------------------------------
x <- c(42,38,45,36,40,47,39,44,41,37,
       43,48,35,46,39,42,50,41,38,45,
       37,44,40,49,36,43,41,47,39,42,
       38,46,37,45,40,44,41,48,36,43,
       39,47,35,46,42,44,38,45,40,43)
## Settings -----------------------------------------------------------
set.seed(7100) # reproducible
B <- 10000 # number of bootstrap resamples
n <- length(x) # 50
alpha <- 0.05
## Bootstrap via for-loop ---------------------------------------------
boot_means <- c()
for (b in 1:B) {
  idx <- sample(1:n, size = n, replace = TRUE) # resample indices
  boot_means[b] <- mean(x[idx]) # store bootstrap mean
}
## 95% percentile bootstrap CI ---------------------------------------
quantile (boot_means, probs = c(0.025, 0.975))


