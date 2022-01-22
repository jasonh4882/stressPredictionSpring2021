# Stress Prediction Using Machine Learning Models

## Description

This project's goal was to use data collected from a survey during COVID-19 to predict the stress level *(from 0 to 16 with 16 being the highest stress)* of an individual. This was done as a part of a Kaggle competition that can be found [here](https://www.kaggle.com/c/stress-prediction/overview/description).

As a part of the competition, 4 files were provided: a sample submission CSV, test data CSV, train data CSV, and an excel sheet containing sata descriptions. Using the training data *(which had the correct stress levels provided)* a model/models were made, using the answers from the survey as inputs and the stress level as the output. 

### Competition Results

In total, 14 submissions were made *(all loacted in the "Submissions" folder)*. Detailed descriptions of all submissions can be found as a part of [HampshireSubmissionSummaryAndCode.pdf](/HampshireSubmissionSummaryAndCode.pdf). A short description of each submission would be as follows:

1. **GLM**: Only 7 fields are initially used to predict stress built with GLM training.
    - *Private Score*: 3.40561 
    - *Public Score* : 3.41682
1. **Mean GLM**: Submission formulated with NAs replaced with mean built with GLM training.
    - *Private Score*: 2.80558
    - *Public Score* : 2.75938
1. **RF**: Prediction built with random forest training from a homework assignment.
    - *Private Score*: 2.80059
    - *Public Score* : 2.76337
1. **GLM**: Prediction built with GLM training from a homework assignment.
    - *Private Score*: 2.83371
    - *Public Score* : 2.78772
1. **Mean RF**: Used replacement of NAs with mean and using a random forest model
    - *Private Score*: **2.78472**
    - *Public Score* : 2.75678
1. **Med GBM**: Used median replacement of NA values and GBM model.
    - *Private Score*: 2.81158
    - *Public Score* : 2.76683
1. **Filtered GLM**: Filtered out about half the columns that raised the test data RMSE.
    - *Private Score*: 2.80645
    - *Public Score* : 2.76223
1. **Filtered RF**: Filtered out 40 features and used random forest model.
    - *Private Score*: 2.79996
    - *Public Score* : 2.77345
1. **Med GLM**: GLM model made using the median for replacement.
    - *Private Score*: 2.81896
    - *Public Score* : 2.77043
1. **Med RF**: Random forest model using median for na replacement.
    - *Private Score*: 2.80328
    - *Public Score* : 2.75537
1. **Filtered GLM 2**: GLM using only to top 15 predicted RMSE.
    - *Private Score*: 2.80962
    - *Public Score* : 2.76935
1. **Filtered RF 2**: Random forest using only to top 15 predicted RMSE.
    - *Private Score*: 2.87077
    - *Public Score* : 2.82653
1. **RF/GLM**:  An ensemble of the 3 best predictions so far.
    - *Private Score*: 2.78536
    - *Public Score* : **2.74304**
1. **Med RF/Mean RF**: A weighted ensemble model of median and mean replacement random forest. A ~9.5% weight applied to median replacement over mean replacement.
    - *Private Score*: 2.78753
    - *Public Score* : 2.74891
    
Submission 5(Mean RF) did the best on the private leaderboard while submission 13(RF/GLM) did the best on the public leaderboard. For clarification, Kaggle has two leaderboards. The public one can be seen at any time while the private one can only be seen after the competition is over. The private leaderboard also only allows two submissitions to be counted. The leaderboards are each based on only part of the whole dataset. This allows for feedback on the approximate preformance of a model without revealing the data that will actually be tested against. This discourages manual edits of a submission and other inproper submission methods.
    
#### Comparitive Performance ####

Compared to the other submissions made by all teams, the best model submitted by Jason Hampshire:
- **Public Leaderboard**: RMSE of **2.74304** did **3rd** best on the public board and the best of all undergraduate student submissions, only being beaten by Ph.D. students [Jun Zhuang](https://www.kaggle.com/eplebani) and [Emanuele Plebani](https://www.kaggle.com/junzhuang) *(team name 'PatchMatch')* with scores of **2.74244** and **2.73678** respectivley. This placed the submission on the **94th percentile**

*Complete public leaderboard CSV can be found [here](stress-prediction-publicleaderboard.csv)*

- **Private Leaderboard**: RMSE of **2.78536** did **6th** best on the private board, falling back 3 positions from that of the public board. Submissions by [Andrew Stanhope](https://www.kaggle.com/andrewstanhope), [Mark Gottermeier](https://www.kaggle.com/markgottermeier), and [Ujjaval Patel](https://www.kaggle.com/ujpatel) moved up the leaderboards, with 
[Jun Zhuang](https://www.kaggle.com/junzhuang) and [Emanuele Plebani](https://www.kaggle.com/eplebani) submissions continuing be be superior as well. While the private did not do as well as the public, the submission still fell on the **88th percentile** of all submissions.

The top 10 private RSME scores were the following:

1. **PatMatch** *(Emanuele Plebani)*
    - *RSME*: 2.77484
1. **Andrew Stanhope**
    - *RSME*: 2.77657
1. **Jun Zhuang**
    - *RSME*: 2.78077
1. **Mark Gottermeier**
    - *RSME*: 2.78326
1. **Ujjaval Patel**
    - *RSME*: 2.78371
1. ***Jason Hampshire***
    - *RSME*: 2.78536
1. **Isaac Murillo**
    - *RSME*: 2.78586
1. **Shuyi Fang**
    - *RSME*: 2.78642
1. **Sabrina Detzel**
    - *RSME*: 2.78905
1. **Priyanka Surapaneni**
    - *RSME*: 2.78938

*Complete private leaderboard can be found [here](https://www.kaggle.com/c/stress-prediction/leaderboard)*

***NOTE***: *Kaggle requires Teams to select only 2 models to be submitted to the private leaderboard. While Submission 5 had a lower RMSE than stated here, that submision was not chosen as one to be submitted to the private leaderboard; the best what was selected was Submission 14. With this being said, even if the score for Submission 5 were to be used, the leaderboard position would not shift, as the next lowest score was still below that of Submission 5*    
    
## Software

R Studio was used for all of the model and submission creation.

## Installation

1. Download and install [R Studio](https://www.rstudio.com/).
1. Open *competition.Rproj* in R Studio.
1. In the top-right pane, open *importantScripts.R* and *importantScripts2.R* into the script view.
1. On the top-left pane, open *.RDataNoMeanLists.RData* and *.RDataNoMedLists.RData* files into the workspace This should load in all models and tables used for the generation of all submissions.


## Roadmap

The sole purpose of this project was for the Kaggle competition. 
Now that the competition is over, there is no reason to continue work on this project.

## Authors & Acknowledgments

- All code models and scripts were written and generated by Jason Hampshire.
- Thanks to George Mohler for hosting the competition as a part of IUPUI's CSCI 48900 class in Spring of 2021.

## Project Status

This project is **Completed** and will see no further work.