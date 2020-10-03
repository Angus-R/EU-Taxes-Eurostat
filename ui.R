#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)

# Define UI for application that draws a histogram
shinyUI(
    ui <- fluidPage(
      titlePanel(title = div(img(height = 75, width = 75, src = "logo.png", "Overview of Taxes in EU countries"))),   
      ###### 
      sidebarLayout(
        sidebarPanel(
          sliderInput("table_n", "Select Table", 41, min = 1, max = 82),
          sliderInput("year", "Select Year", 2018, min = 2006, max = 2018, sep = ""),
          selectInput("pais", "Select Country", choices = c("Austria", "Belgium", "Bulgaria","Croatia", "Cyprus","Czechia", "Denmark", 
                                                            "Estonia","Finland","Greece","France","Germany","Hungary","Iceland",
                                                            "Ireland","Italy", "Latvia","Lithuania","Luxembourg","Malta","Netherlands"
                                                            ,"Norway","Poland","Portugal","Romania", "Slovenia","Slovakia","Spain"
                                                            ,"Sweden","United Kingdom"), selected = "United Kingdom"),
          selectInput("paisDT", "Select Country(DT)", choices = c("Austria", "Belgium", "Bulgaria","Croatia", "Cyprus","Czechia", "Denmark", 
                                                                  "Estonia","Finland","Greece","France","Germany","Hungary","Iceland",
                                                                  "Ireland","Italy", "Latvia","Lithuania","Luxembourg","Malta","Netherlands"
                                                                  ,"Norway","Poland","Portugal","Romania", "Slovenia","Slovakia","Spain"
                                                                  ,"Sweden","United Kingdom"), selected = "United Kingdom")###, width = 6
          ),
        #### textInput("name", "Your name?"),
        
        
          mainPanel(
  tabsetPanel(
    tabPanel("Specific Tax", plotOutput("c_plot")),          
    tabPanel("Country", tableOutput("co_tab")),
    tabPanel("Country:DT", DT::DTOutput("DT_tab")),
    tabPanel("Read Me", textOutput("in_fo"))
    )### , width = 12 
  )
      )
)
)


