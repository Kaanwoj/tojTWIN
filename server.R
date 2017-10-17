source("simulate.R")

server <- shinyServer(function(input, output, session) {
  
  
  ######################################
  ### Simulation (out of Shiny Twin) ###
  ######################################
  
  # Fix variance on second stage
  sigma <- reactive({
    input$mu / 5
  })
  
  # Input for SOAs
  output$soa_input <- renderUI({
      default.soa <- "0,50,100,200"   # here {}??
    textInput("soa.in","Stimulus onset asynchronies (SOAs, comma delimited)",
              default.soa)
  })
  
  
  # Get SOAs from input
  soa <- eventReactive(input$sim_button, {
    validate(need(
      tryCatch(soa <- sort(as.numeric(unlist(strsplit(input$soa.in, ",")))),
               error=function(e){}, warning=function(w){}),
      "SOA input can not be used. Make sure its only comma-separated numbers."))
    soa
  })
  
  # Simulate data
  dataset <- eventReactive(input$sim_button, {
      list(data = simulate.rtp(soa=soa(), proc.A=input$proc.A,
                               proc.V=input$proc.V, mu=input$mu,
                               sigma=sigma(), omega=input$sim.omega,
                               delta=input$sim.delta, N=input$N),
           trueValues = c(proc.A=input$proc.A, proc.V=input$proc.V,
                          mu=input$mu, omega=input$sim.omega,
                          delta=input$sim.delta)
      )
  })
  
  # Show data in a table
  output$simtable <- renderTable({
    head(dataset()$data, input$nrowShow)
  })
  
  # Plot data
  output$simplot <- renderPlot({
      par(mfrow=c(1,2))
      boxplot(dataset()$data[ , grep("aud", colnames(dataset()$data))],
              ylab="reaction time (ms)", xlab="stimulus-onset asynchrony (soa)",
              main="auditory target", xaxt="n")
      axis(1, at=1:length(soa()), labels=soa())
      boxplot(dataset()$data[ , grep("vis", colnames(dataset()$data))],
              ylab="reaction time (ms)", xlab="stimulus-onset asynchrony (soa)",
              main="visual target", xaxt="n")
      axis(1, at=1:length(soa()), labels=soa())
  })
  
  # Download the Simulation output
  
  # downloadHandler() takes two arguments, both functions.
  # The content function is passed a filename as an argument, and
  #   it should write out data to that filename.
  output$downloadData <- downloadHandler(
    
    # This function returns a string which tells the client
    # browser what name to use when saving the file.
    filename = function() {
      paste("dat-", Sys.Date(), ".csv", sep="")
    },
    
    # This function should write data to a file given to it by
    # the argument 'file'.
    content = function(file) {
      write.table(dataset()$data, file, quote = FALSE, sep = ";",
                  row.names = FALSE)
    }
  )
  
########## Simulation Collapse Window #########################
  
  observeEvent(input$p1Button, ({
    updateCollapse(session, "RT_Collapse", open = "Plot and Table")
  }))
  
  
  
})
