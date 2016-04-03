#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Body Mass Index calculator and body fat predictor App"),
  h4("Please choose your weight and height to calculate your BMI"),
  h4("Please select Age and Gender to calculate Body Fat based on BMI"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("Weight",
                   "Weight in Lbs",
                   min = 10,
                   max = 500,
                   value = 150),
       sliderInput("Height",
                   "Height in Inches",
                   min = 10,
                   max = 90,
                   value = 70),
       sliderInput("Age",
                   "Age in Years",
                   min = 1,
                   max = 100,
                   value = 20),
       radioButtons("Gender", 
                    "Choose gender",
                    c("Male"="M", "Female"= "F"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4('Your BMI is :'),
      verbatimTextOutput("bmivalue"),
      h4('Your BMI class is  :'),
      verbatimTextOutput("bmiClass"),
      h4('Your Predicted Body Fat is :'),
      verbatimTextOutput("bodyFat"),
      
       plotOutput("distPlot")
    )
  )
))
