library(shiny)

ui <- fluidPage(
  titlePanel("tojTWIN"),

  navlistPanel(
    tabPanel("Theory"),
    tabPanel("Simulation",
             h3("Simulation"),
             h4("Reaction Times"),
             h4("Temporal Order Judgments")),
    tabPanel("Estimation")
  )
)
