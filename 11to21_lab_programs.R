11


setwd("C:/Users/ACER/Downloads")
data <- read.csv("students_copy.csv")
print("Contents of the CSV file:")
print(data)

12


data("airquality")

result <- aggregate(cbind(Ozone, Solar.R, Wind, Temp) ~ Month,
                    data = airquality,
                    FUN = mean,
                    na.rm = TRUE)

print("Monthly average values:")
print(result)

13

rm(list = ls())
a <- c(1, 2, 3)
b <- c(4, 5, 6) 
c <- c(7, 8, 9)
d <- rbind(a, b, c)
print("Combined arrays (row-wise):")
print(d)  

14

data("ChickWeight")
head(ChickWeight)
sorted <- ChickWeight[order(ChickWeight$weight), ]
print(sorted)
aggregate(weight ~ Diet, ChickWeight, mean)

15

data("iris")
dim(iris)
summary(iris)
sapply(iris[,1:4], sd)
quantile(iris$Sepal.Length)
aggregate(. ~ Species, iris, mean)


16

data("USArrests")
summary(USArrests)
which.max(USArrests$Rape)
max(USArrests$Murder)
min(USArrests$Murder)
cor(USArrests)
hist(USArrests$Murder)


17

data("Titanic")
t <- as.data.frame(Titanic)
barplot(table(t$Class, t$Survived), main="Survival vs Class", beside=TRUE)
barplot(table(t$Sex, t$Survived), main="Survival vs Gender", beside=TRUE)


18


x <- c(10, 20, 30, 40, 50)
y <- c(5, 15, 25, 35, 45)
par(mfrow = c(2, 3))
boxplot(x, main="Boxplot", col="lightblue")
hist(x, main="Histogram", col="lightgreen")
barplot(x, main="Bar Plot", col="orange", names.arg=c("A","B","C","D","E"))
plot(x, type="l", main="Line Chart", col="blue")
plot(x, y, main="Scatter Plot", col="red")



19


Spend <- c(10, 20, 30, 40, 50)
Sales <- c(15, 25, 35, 45, 55)
model <- lm(Sales ~ Spend)
predict(model, data.frame(Spend = 60))


20


data("ChickWeight")
m <- lm(weight ~ Time + Diet, data = ChickWeight)
p <- predict(m)
mean((ChickWeight$weight - p)^2)




21


data("iris")
iris <- subset(iris, Species %in% c("setosa", "versicolor"))
m <- glm(Species ~ Petal.Length + Petal.Width, data=iris, family=binomial)
p <- ifelse(predict(m, type="response") > 0.5, "versicolor", "setosa")
table(p, iris$Species)