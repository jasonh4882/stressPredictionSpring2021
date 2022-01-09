library(gbm)
library(randomForest)
library(Metrics)

#format for calculating mean and median for data set
for(i in 1:81){
  +     temp1 <- testRaw %>% filter(!is.na(testRaw[,i]))
  +     testMean[i] <- mean(temp1[,i])
  +}

#format for replacing empty values in data set
trainNoNAMed <- trainRaw
for(i in 1:82){
  +     temp1 <- trainRaw[,i]
  +     trainNoNAMed[,i] <- temp1 %>% replace_na(trainMedian[i])
  + }

#format for creating models from data sets
trainPt1MeanModelGLM <- glm(pstr ~ ., data = trainPt1NoNAMean)
trainPt1MeanModelGBM <- gbm(pstr ~ ., data = trainPt1NoNAMean %>% select(-SEX, -higheduc))
trainPt1MeanModelRF <- randomForest(pstr ~ ., trainPt1NoNAMean)

#format for creating prediction vectors
trainPt2TestMeanGLMPrediction <- predict.glm(trainPt1MeanModelGLM, trainPt2TestNoNAMean)
trainPt2TestMeanGBMPrediction <- predict.gbm(trainPt1MeanModelGBM, trainPt2TestNoNAMean)
trainPt2TestMeanRFPrediction <- predict(trainPt1MeanModelRF, trainPt2TestNoNAMean)

#format for calculating random mean square error. lower is better
rmsePt2GLM <- rmse(trainPt2$pstr, trainPt2TestMeanGLMPrediction)
rmsePt2GBM <- rmse(trainPt2$pstr, trainPt2TestMeanGBMPrediction)
rmsePt2RF <- rmse(trainPt2$pstr, trainPt2TestMeanRFPrediction)

#format for converting character data sets to integers. will introduce empty values whereever it fails
for(i in 1:82){
  +     trainPt2NoNAMedInt[,i] <- as.integer(trainPt2NoNAMed[,i])
  + }

TrainPt1Testing <- 0
TrainPt1TestingMeanModel <- 0
TrainPt2TestingMeanPrediction <- 0
TrainPt1Testing <- trainPt1NoNAMean
TrainPt1Testing <- TrainPt1Testing %>% select(-SEX)
TrainPt1TestingMeanModel <- glm(pstr ~ .,data = TrainPt1Testing)
TrainPt2TestingMeanPrediction <- predict.glm(TrainPt1TestingMeanModel, trainPt2TestNoNAMean)
rmsePt2Testing <- rmse(trainPt2$pstr, TrainPt2TestingMeanPrediction)

#removing data that seems to increase the rmse
dataset  %>% select(-4, -6, -7, -10, -14, -15, -19, -20, -22, -24, -27, -28, -29, -35, -36, -42, -43, -44, -45, -47, -50, -53, -54, -55, -56, -57, -60, -62, -63, -64, -66, -67, -68, -69, -71, -72, -73, -74, -76, -79)

for(i in 1:4261){
  if(TrainSEX[i] == "M"){
    TrainPt1Testing[i,3] <- 0
  }
  if(TrainSEX[i] == "F"){
    TrainPt1Testing[i,3] <- 1
  }
}

for(i in 1:4261){
  if(TrainHigheduc [i] == "HS Diploma/GED"){
    TrainPt1Testing[i,4] <- 0
  }
  if(TrainHigheduc [i] == "Some College"){
    TrainPt1Testing[i,4] <- 1
  }
  if(TrainHigheduc [i] == "Bachelor"){
    TrainPt1Testing[i,4] <- 2
  }
  if(TrainHigheduc [i] == "Post Graduate Degree"){
    TrainPt1Testing[i,4] <- 3
  }
}