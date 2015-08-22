# data_product_example


Work for the Coursera course [developing data products](https://www.coursera.org/course/devdataprod) (22 August 2015)


## Introduction

In 2013 I did complete the Johns Hopkins/Coursera course:[Data Analysis](https://www.coursera.org/course/dataanalysis).  
As a assignment of this course I did fit a linear regression model that predicts the interest rate charged by the [lending club](https://en.wikipedia.org/wiki/Lending_Club).  

For more information about the lending club and the fitted regression model see the [report](http://issuu.com/vilkoos/docs/analysis1a).

## Data products

My 2013 results now are available to everyone in the form of two data products:  

- a [shiny app](https://vilkoos.shinyapps.io/predict_lc_interest) which you can use my regression model to calculate the interest rate the lending club would charge you.
(for the same app with the required *but annoying* documentation [click here](https://vilkoos.shinyapps.io/predict_lending_club_interest_rate) )
- a five slide HTML5 [pitch presentation](http://rpubs.com/vilkoos/dataprod) produced using R presenter.

## Files in this directory

- readme.md: . . . . . . . . .  . . . . .this.file
- ui.R: . . . . . . . . . . . . . . . . . . . .the user interface definition of the Shiny app.
- server.R:. . . . . . . . . . . . . . . . .the server file of the Shiny app.
- loans.csv: . . . . . . . . . . . .. . . . data used by server.R
- make_lending_club_data.r: . . the R script to produce loans.csv (fully reproducible)
- index.Rpres  . . . . . . . . . . . . . . the source file for the R presentation
- index.html . . . . . . . .. . . . . . . . the generated HTML5 file
   