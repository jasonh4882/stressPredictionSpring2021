library(gbm)
library(randomForest)
library(Metrics)
test <- read.csv(file="trainPt1.csv")
training <- read.csv(file="trainPt2.csv")
testAve = 0
trainAve = 0
temp1 <- 0
temp2 <- 0
for(i in 1:81){
  +     temp1 <- test %>% filter(!is.na(test[,i]))
  +     temp2 <- temp1[,i]
  +     testAve[i] <- mean(temp2)
  + }
for(i in 1:82){
  +     temp1 <- training %>% filter(!is.na(training[,i]))
  +     temp2 <- temp1[,i]
  +     trainAve[i] <- mean(temp2)
  + }
for(i in 1:82){
  +     training[,i] <- replace_na(training[,i], trainAve[i])
  + }
for(i in 1:81){
  +     test[,i] <- replace_na(test[,i], testAve[i])
  + }
modGLM <- glm(pstr ~. ,data = training)
predGLM <- predict.glm(modGLM, test)

modGBM <- gbm(formula = pstr ~ .,distribution = "gaussian", data = training %>% select(-SEX, -higheduc))
predGBM <- predict.gbm(modGBM, test)

modRF <- randomForest(pstr ~ ., training)
predRF <- predict(modRF, test)

real <- read.csv(file = "trainPt1(true).csv")
real <- real$pstr

rmseGLM <- rmse(real, predGLM)
rmseGBM <- rmse(real, predGBM)
rmseRF <- rmse(real, predRF)

compTestAve = 0
for(i in 1:81){
  +     temp1 <- compTest %>% filter(!is.na(compTest[,i]))
  +     temp2 <- temp1[,i]
  +     compTestAve[i] <- mean(temp2)
  + }
for(i in 1:81){
  +     compTest[,i] <- replace_na(compTest[,i], compTestAve[i]) 
  + }

predCompGLM <- predict.glm(modGLM, compTest)
predCompGBM <- predict.gbm(modGBM, compTest)
predCompRF <- predict(modRF, compTest)

attemptGLM <- data.frame(predCompGLM)
attemptGBM <- data.frame(predCompGBM)
attemptRF <- data.frame(predCompRF)

write.csv(attemptGLM,"HampahireSubmissionGLM.csv")
write.csv(attemptGBM,"HampahireSubmissionGBM.csv")
write.csv(attemptRF,"HampahireSubmissionRF.csv")