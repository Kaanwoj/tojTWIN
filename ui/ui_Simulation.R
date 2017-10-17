tabPanel("Simulation",
         h3("Reaction Times"),
         h4("1. Select the parameter values:"),
         fluidRow(
column(3,
       uiOutput("soa_input"),
         sliderInput("N","Number of trials:",
                     min = 1, max = 1000, value = 500)),
column(3,
       sliderInput("proc.A","for auditory stimulus
                   (\\(\\frac{1}{\\lambda_A}\\))",
                   min = 20, max = 150, value = 100),
       sliderInput("proc.V","Visual processing time
                   (\\(\\frac{1}{\\lambda_V}\\))",
                   min = 20, max = 150, value = 50)),
column(3,
       sliderInput("mu","\\(\\mu\\)",
                   min = 100, max = 500, value = 200),
       p("The standard deviation of the second stage processing time is
         fixed to \\(\\frac{\\mu}{5}\\).")),
column(3,
       sliderInput("sim.omega","Window width (\\(\\omega\\))",
                   min = 100, max = 300, value = 200),
       sliderInput("sim.delta","Amount of integration (\\(\\Delta\\))",
                   min = 20, max = 100, value = 50))
),
fluidRow(
  column(3,
         h4("2. Simulate data"),
         actionButton("sim_button", "Simulate!")),
  column(9,
         h4("3. (optional) To download your simulated data, press on the button
         below"),
         downloadButton('downloadData', 'Download (.csv)'))),
            bsCollapse(id = "RT_collapse", open = "Visualization",
                       bsCollapsePanel("Plot and Table",
                     tabPanel("Plot",
                        h5("Boxplots of reaction times for each SOA"),
                        plotOutput("simplot")),
                     tabPanel("Table",
                         h5("Table of reaction times for each SOA"),
                            numericInput("nrowShow","Number of rows displayed",
                            min=1, max=60, value=10),
                           tableOutput("simtable"))                   
)),
tags$hr(),
h3("Temporal Order Judgments"),
fluidRow(
  column(12,
         sliderInput("beta", "(\\(\\beta\\))",
                     min = 0, max = 1, value = 0.5))
  
))