
#Installing and loading the libraries
#install.packages("recommenderlab", dependencies=TRUE)
#install.packages("Matrix")
library("recommenderlab")
library(caTools)

#movie rating data
book_data <- read.csv("E:\\Assignment\\10 )Recommanded System\\book.csv",header = TRUE)

#metadata about the variable
str(book_data)
View(book_data)
book_data <- book_data[,-1]
attach(book_data)

#rating distribution
hist(book_data$Book.Rating)

#the datatype should be realRatingMatrix inorder to build recommendation engine
book_data_matrix <- as(book_data, 'realRatingMatrix')

#Popularity based 

book_recomm_model1 <- Recommender(book_data_matrix, method="POPULAR")

#Predictions for two users 
recommended_items1 <- predict(book_recomm_model1, book_data_matrix[413:414], n=5)
as(recommended_items1, "list")


## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

book_recomm_model2 <- Recommender(book_data_matrix, method="UBCF")

#Predictions for two users 
recommended_items2 <- predict(book_recomm_model2, book_data_matrix[413:414], n=5)
as(recommended_items2, "list")
