
library(shiny)

### Define UI to calculate lending club interest rate ######################
shinyUI(pageWithSidebar(
    
    ### Application title ##################################################
    headerPanel("Predict your lending club interest rate"),
    
    
    ### specify input parameters (your FICO, loan length + loan amount) ####
    sidebarPanel(
        checkboxInput("showDocumentation", "Show documentation", TRUE),
        # --- print how to use instructions ------------------
        p("===================="),
        p("To predict your interest rate, specify:"),  
        p("- your FICO score"),
        p("- the loan length"),
        p("- the loan amount"),
        p("- the desired graph"),
        p("Then click on submit."),
        p("===================="),
        # --- slider input to specify FICO value -------------
        sliderInput("FICO", 
                    "your FICO points score", 
                    min = 640,
                    max = 830, 
                    value = 700),
        # ---- slider input to specify loan length -----------
        sliderInput("Len", 
                    "your loan length in months", 
                    min = 6,
                    max = 60, 
                    value = 36),
        # --- inputbox to specify loan amount ----------------
        numericInput("AR", 
                     "amount requested in dollars", 
                     max   = 35000,
                     min   =  1000,
                     value = 20000),
        # --- select type of graph --------------------------
        selectInput("graphType", 
                    "which  graph you want to see . . . . interest rate by:",
                    list("FICO"        = "fico", 
                         "Loan length" = "len", 
                         "Loan Amount" = "ar")),
        # --- submit button to generate new output -----------
        submitButton('Submit')
    ),
    
    
    ### report the calculated rate + show your position in graph ###########
    mainPanel(
        # --- display text of result report -----------------------------
        verbatimTextOutput("ratePrediction"),
        # --- display disclaimer ----------------------------------------
        h3("Disclaimer"),
        p("The prediction is based on 2013 data"),
        # --- display the plot with your position -----------------------
        plotOutput("newPlot")
    )
    
   ########################################################################
))
