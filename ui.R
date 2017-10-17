library(shiny)
library(shinyBS)

ui <- fluidPage(
  titlePanel("TWIN: Temporal Order Judgment"),

  navlistPanel(
    tabPanel(""),
    source(file.path("ui", "ui_Theory.R"), local = TRUE)$value,
    
    source(file.path("ui", "ui_Simulation.R"), local = TRUE)$value,
   
    source(file.path("ui", "ui_Estimation.R"), local = TRUE)$value
  )
)
