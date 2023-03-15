#-----------------------
# Box-Muller transform
#-----------------------

# 1. generate uniform vectors
n = 10000
set.seed(2023)
u1 = runif(n)
u2 = runif(n)

# 2. define Box-Müller transform function
x1 = sqrt(-2*log(u1))*cos(2*pi*u2)
x2 = sqrt(-2*log(u1))*sin(2*pi*u2)
x = data.frame(x1, x2)

# 3. print first lines of dataset 
data = x
data[1:6,]
#          x1         x2
# 1  1.139567 -0.4752820
# 2 -1.449969  0.2893102
# 3 -1.791041  0.6499395
# 4 -1.255448  0.5252876
# 5  2.625178 -0.3092095
# 6  1.735641 -1.1015367

# 4. plotting

library(ggplot2)

p1<- ggplot(data, aes(x = x1)) + 
  geom_histogram(aes(y = ..density..),
                 colour = 1, fill = "white") +
  geom_density(lwd = 1, colour = "#a50101") + theme_minimal()

p2<- ggplot(data, aes(x = x2)) + 
  geom_histogram(aes(y = ..density..),
                 colour = 1, fill = "white") +
  geom_density(lwd = 1, colour = "#a50101") + theme_minimal()

p3<- ggplot(data, mapping = aes(x = x1, y = x2)) +
  geom_point(size = 0.6) + 
  geom_jitter(alpha = 0.75, size = 0.6) + theme_minimal()

library(gridExtra)

grid.arrange(arrangeGrob(p1, p2), 
             arrangeGrob(p3, ncol=1), 
             ncol=2, widths=c(1,1))

#----
# end
#----
