library(shiny)
library(shinyBS)

ui <- fluidPage(
  titlePanel("TWIN: Temporal Order Judgment"),

  navlistPanel(
    tabPanel("Introduction", value= "Introduction",
             p("This App is an extension to the existing App:",
             a(icon("github"),"TWIN-Model of Multisensory Integration",
               href ="https://github.com/Kaanwoj/shinyTWIN"),
              p("and includes 
               Temporal Order Judgments to the model (using the Redundant Target Paradigm.)"))),
    source(file.path("ui", "ui_Theory.R"), local = TRUE)$value,
    
    source(file.path("ui", "ui_Simulation.R"), local = TRUE)$value,
   
    source(file.path("ui", "ui_Estimation.R"), local = TRUE)$value
  )
)
