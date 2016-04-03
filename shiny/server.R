#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

#BMI calculation based on Height and Weight
calculateBMI <- function(Weight, Height) 
  Weight * 703 / (Height ^2);

#BMI classes
bmiClass = c("Obese Class III", "Obese Class II", "Obese Class I", "Over Weight", "Normal Weight", "Mildly Underweight", "Severely Underweight")
bmiIndex = c(40, 35, 30, 25, 18.5, 16, 15)
bmiList = data.frame(bmiIndex, bmiClass)

#BMI class predictor 
calculateBMIClass <- function(bmi){  
  if (bmi > 40) { bmiClass = "Obese Class III";}
  else if (bmi > 35) { bmiClass = "Obese Class II";}
  else if (bmi > 30) { bmiClass = "Obese Class I";}
  else if (bmi > 25) { bmiClass = "Over Weight";}
  else if (bmi > 18.5) { bmiClass = "Normal Weight";}
  else if (bmi > 16) { bmiClass = "Mildly Underweight";}
  else {bmiClass = "Severely Underweight";}
  bmiClass;
}     

#Calculate body fat according to the formula from 
#http://halls.md/body-fat-percentage-formula/
calculateBodyFat <- function(bmi, age, sex) {
  if (sex == 'M'){
    sexMultiplier = 1
  }
  else {
    sexMultiplier = 0
  }
  if (age > 7){
    bodyFat <- (1.20 * bmi) + (0.23 * age ) - (10.8 * sexMultiplier) - 5.4;
  }
  else{
    bodyFat <- (1.51 * bmi) - (0.70 * age ) - (3.6 * sexMultiplier) + 1.4;
  }
  bodyFat;
}


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  #get bmi value in reactive manner
  bmi <- reactive(calculateBMI(input$Weight, input$Height))
  output$bmivalue <- renderPrint(bmi()) 
  output$bmiClass <- renderPrint(calculateBMIClass(bmi()))
  output$bodyFat <- renderPrint(calculateBodyFat(bmi(), input$Age, input$Gender))
  
  output$distPlot <- renderPlot({
    
    #hist(x=data.frame(bmiList)$bmiIndex, col='darkgray')
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})
