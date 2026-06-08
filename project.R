# Supervised ML Project - Iris Dataset

packages <- c("caret", "randomForest", "nnet")

for (p in packages) {
  if (!require(p, character.only = TRUE)) {
    install.packages(p)
    library(p, character.only = TRUE)
  }
}

data(iris)
set.seed(123)

index <- createDataPartition(iris$Species, p=0.7, list=FALSE)
train <- iris[index,]
test <- iris[-index,]

# Logistic Regression
log_model <- multinom(Species ~ ., data=train)
log_pred <- predict(log_model, test)

# Random Forest
rf_model <- randomForest(Species ~ ., data=train, ntree=100)
rf_pred <- predict(rf_model, test)

print(confusionMatrix(log_pred, test$Species))
print(confusionMatrix(rf_pred, test$Species))
