
library(shiny)

### Define server logic required to show interest rate prediction ############
shinyServer(function(input, output) {

  ### Generate the interest rate prediction #################################
  output$ratePrediction <- renderPrint({
      if (input$showDocumentation){
         cat("**DOCUMENTATION**\n\n")
         cat("The lending club is an organization which allows ") 
         cat("members to directly invest in and borrow from each other to avoid the cost ")  
         cat("and complexity of the banking system.\n") 
         cat("Both sides can win: better rates to borrowers and better returns to investors.")
         cat("\n\n")
         cat("In 2013 the author of this app did fit a linear regression model that can predict ")
         cat("the interest rate the lending club will demand.\n")
         cat("74% of the variance of the rate can be explained by three variables:\n")
         cat("-the FICO score of the borrower -a measure for credit worthiness-\n")
         cat("-the length of the loan, e.g 36 or 60 months\n")
         cat("-the amount to be loaned\n\n")
         cat("With this app everyone can use my regression model to predict which rate ")
         cat("the lending club will charge him or her.\n")
         cat("You can also change the loan length and amount to see what effect that has.\n\n")
         cat("To use the app follow the instructions given on the left.")
         cat("\n\nTo see the app \n-Uncheck the show documentation box and \n-click on submit")
      } else {
         # --- calculate interest rate -----------------------------------------
         rate <- round(67.46 - 0.08754*input$FICO + 0.1378*input$Len + 0.0001375*input$AR, 2)
         if (rate < 5) rate <- 5 # miniumum rate is 5
         # --- build + display the output text ---------------------------------
         cat("\n==================================\n")
         cat("FICO score. . . . :", input$FICO,"points \n")
         cat("Loan length . . . :",input$Len,"months \n")
         cat("Amount requested. :",input$AR,"dollars \n")
         cat("==================================\n\n")
         cat(">>> Predicted interest:", rate, "% \n\n\n\n")
      }
  })
  
  
  #### get the data to plot ##################################################
  dat <- read.csv2("loans.csv",sep=",", dec=".", colClasses="numeric" )
  
  
  ### generate the scaterplot ################################################
      
    output$newPlot <- renderPlot({
    if (!input$showDocumentation){
      #--- set vars for specific plot type ------------------------------------
      if (input$graphType == "fico") {
          xvec <- dat$FICO
          ltxt <- "FICO score"
          vert <- input$FICO
      }
      else if (input$graphType == "len" ) { 
          xvec <- dat$LEN
          ltxt <- "Loan length in months"
          vert <- input$Len
      }
      else { 
          xvec <- dat$AR
          ltxt <- "Loan amount"
          vert <- input$AR
      }
      # --- plot 2500 observation as blue circles ----------------------------
      plot( xvec, dat$IR,
            type = "p",
            col  = "blue",
            ylim = c(0,30),
            if (input$graphType == "len" ) xlim = c(0,60),
            xlab = ltxt,
            ylab = "interest rate",
            col.main = "gray",
            main = "Compare your interest rate with 2500 others \n you are at the crossing of the red lines"
          )
      # --- calculate interest rate -----------------------------------------
      rate <- round(67.46 - 0.08754*input$FICO + 0.1378*input$Len + 0.0001375*input$AR, 2)
      if (rate < 5) rate <- 5 # miniumum rate is 5
      # --- plot your position at crossing of two lines ---------------------
      abline( h = rate, 
             lty = 1, 
             lwd = 1, 
             col = "red")
      abline( v = vert, 
             lty = 1, 
             lwd = 1, 
             col = "red")
      
      } # end of if (!input$showDocumentation)
 
     })

  ###########################################################################
})

