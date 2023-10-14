

install.packages("vcd")

library("vcd")
library("psych")
library("data.table")
library("tidyverse")


# Categorical Agreement -----------------------------

susceptibilities <- as.table(rbind(
  c(4, 1), c(0,5)
  ))

categories <- c("S", "R")

dimnames(susceptibilities) <- list(Method_1 = categories, Method_2 = categories)

susceptibilities

#         Method_2
# Method_1 S R
#        S 4 1
#        R 0 5

res.k <- Kappa(susceptibilities)

res.k

confint(res.k)

#            value    ASE     z  Pr(>|z|)
# Unweighted   0.8 0.1859 4.303 1.683e-05
# Weighted     0.8 0.1859 4.303 1.683e-05

# Kappa              lwr upr
#   Unweighted 0.4356364   1
#   Weighted   0.4356364   1


# 0.8 C.I. (0.4356364 - 1)

# Essential Agreement -----------------------------

Method_1 <- data.frame(c(2 , 4 , 8 , 16 , 0.5 , 0.25 , 2 , 4 , 8 , 1))
names(Method_1)[1] <- "Method_1"
Method_2 <- data.frame(c(2 , 16 , 4 , 8, 2 , 1 , 2 , 4 , 4 , 4))
names(Method_2)[1] <- "Method_2"

Methods <- bind_cols(Method_1, Method_2)

ICC(Methods)

# Call: ICC(x = Methods)
# 
# Intraclass correlation coefficients 
#                          type  ICC   F df1 df2    p lower bound upper bound
# Single_raters_absolute   ICC1 0.40 2.3   9  10 0.10       -0.23        0.81
# Single_random_raters     ICC2 0.40 2.3   9   9 0.11       -0.24        0.81
# Single_fixed_raters      ICC3 0.40 2.3   9   9 0.11       -0.26        0.81
# Average_raters_absolute ICC1k 0.57 2.3   9  10 0.10       -0.61        0.89
# Average_random_raters   ICC2k 0.57 2.3   9   9 0.11       -0.63        0.89
# Average_fixed_raters    ICC3k 0.57 2.3   9   9 0.11       -0.71        0.89
# 
#  Number of subjects = 10     Number of Judges =  2
# See the help file for a discussion of the other 4 McGraw and Wong estimates,


# 0.6 C.I. (-0.6 to 0.9)
