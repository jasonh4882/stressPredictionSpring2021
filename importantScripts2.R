library(keras)
library(imager)
mnist <- dataset_mnist()
x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y
# look at first image and label
plot(as.cimg(t(x_train[1,,])))
y_train[1]
# reshape images to 1d vectors (for dense neural net)
x_train <- array_reshape(x_train, c(nrow(x_train), 784))
x_test <- array_reshape(x_test, c(nrow(x_test), 784))
# rescale to 0 to 1 (or could whiten)
x_train <- x_train / 255
x_test <- x_test / 255
# keras expects classes to be one hot encoded (last layer size is 10)
y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)
# create the model
model <- keras_model_sequential()
model %>%
layer_dense(units = 256, activation = 'relu', input_shape = c(784)) %>%
layer_dropout(rate = 0.4) %>%
layer_dense(units = 128, activation = 'relu') %>%
layer_dropout(rate = 0.3) %>%
layer_dense(units = 10, activation = 'softmax')
# inspect the model
summary(model)
# compile model and specify optimization
model %>% compile(
loss = 'categorical_crossentropy',
optimizer = optimizer_adam(),
metrics = c('accuracy')
)
# fit model
history <- model %>% fit(
x_train, y_train,
epochs = 30, batch_size = 128,
validation_split = 0.2
)
# view error
plot(history)
# can predict on new data
model %>% predict_classes(x_test)
install.packages(keras)
install.packages("keras")
install.packages("imager")
mnist <- dataset_mnist()
x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y
# look at first image and label
plot(as.cimg(t(x_train[1,,])))
y_train[1]
# reshape images to 1d vectors (for dense neural net)
x_train <- array_reshape(x_train, c(nrow(x_train), 784))
x_test <- array_reshape(x_test, c(nrow(x_test), 784))
# rescale to 0 to 1 (or could whiten)
x_train <- x_train / 255
x_test <- x_test / 255
# keras expects classes to be one hot encoded (last layer size is 10)
y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)
# create the model
model <- keras_model_sequential()
model %>%
layer_dense(units = 256, activation = 'relu', input_shape = c(784)) %>%
layer_dropout(rate = 0.4) %>%
layer_dense(units = 128, activation = 'relu') %>%
layer_dropout(rate = 0.3) %>%
layer_dense(units = 10, activation = 'softmax')
# inspect the model
summary(model)
# compile model and specify optimization
model %>% compile(
loss = 'categorical_crossentropy',
optimizer = optimizer_adam(),
metrics = c('accuracy')
)
# fit model
history <- model %>% fit(
x_train, y_train,
epochs = 30, batch_size = 128,
validation_split = 0.2
)
# view error
plot(history)
# can predict on new data
model %>% predict_classes(x_test)
library(keras)
library(imager)
mnist <- dataset_mnist()
x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y
mnist <- dataset_mnist()
x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y
mnist <- dataset_mnist()
x_train <- trainRaw %>% select(-pstr)
y_train <- trainRaw %>% select(pstr)
plot(as.cimg(t(x_train[1,,])))
plot(as.cimg(t(x_train[1,])))
x_test <- testRaw
y_test <- 0
x_train <- array_reshape(x_train, c(nrow(x_train), 8352))
x_test <- array_reshape(x_test, c(nrow(x_test), 8352))
8352
x_train <- array_reshape(x_train, c(nrow(x_train), 784))
x_test <- array_reshape(x_test, c(nrow(x_test), 784))
x_train <- as.numeric(x_train)
x_train <- as.vector(x_train)
x_train <- array_reshape(x_train, c(nrow(x_train)))
x_test <- array_reshape(x_test, c(nrow(x_test)))
install.packages("reshape2")
library(reshape2)
library(reshape2)
x_train  <- melt( x_train , na.rm= TRUE )
print(x_train )
