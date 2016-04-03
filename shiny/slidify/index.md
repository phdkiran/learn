---
title       : 'Body Mass Index  Calculation App'
subtitle    : 'With Body Fat'
author      : 'Kiran Ramineni'
job         : 'Eternal Learner'
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap, mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## BMI Calculation

BMI means Body Mass Index. 
The BMI shows the relation between a person's height and weight, and can be used to indicate whether the person has a normal weight or if he/she is underweight or overweight. 

BMI = (weight in pounds) * 703 / (bodyheight in inches)^2

BMI calculations are based on: <http://www.calcbmi.com/>

--- .class #slide2

## Body Fat Calculation

Body Fat is correlated to Body Fat according to <http://www.ncbi.nlm.nih.gov/pubmed/2043597>
Important factors are age and gender to determine the Body Fat

We can use this formula from <http://halls.md/body-fat-percentage-formula/>

Child Body Fat % = (1.51 * BMI) – (0.70 * Age) – (3.6 * gender) + 1.4

Adult Body Fat % = (1.20 * BMI) + (0.23 * Age) – (10.8 * gender) – 5.4

using gender male= 1, female= 0.


--- #slide3

Putting BMI and Body Fat calculations together in one Shiny app here:
Use the sliders to select parameters and see the values change dynamically

<https://phdkiran.shinyapps.io/BodyMassIndex/>

Screenshot here:
![Width] (screen.png)

--- 
Source Code hosted here:
<https://github.com/phdkiran/learn/tree/gh-pages/shiny>



