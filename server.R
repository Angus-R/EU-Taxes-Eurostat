#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)
library(tidyverse)
library(DT)


server <- function(input, output, session){
  
  year_in <- reactive({ as.name(paste0("Y", input$year))
    })
  
  
  
  
  output$c_plot <- renderPlot({
    
    yearc <- paste0("Y", input$year)
    col_plot <- df4 %>%
      filter (id == input$table_n) %>%  ##### Just add id
      mutate(M_Country = fct_reorder(U_Country, get(yearc))) 
    col_plot %>%
      ggplot(aes(M_Country, get(yearc))) +
      geom_col(fill = "skyblue") +
      geom_text(aes(label = get(yearc)))+ #### color = "#56ff49"
      labs(x = "Country", y = paste(input$year, " %"), title = col_plot$Comment_e, subtitle = "2006 - 2018", caption = "Data Source: Eurostat")+
      ##### xlim(min, max)+
      coord_flip()
  })
  
  
  output$co_tab <- renderTable({by_country()
  }
  )
  
  by_country <- function(){
    
    yearc <- as.name(paste0("Y", input$year))
    df4 %>%
      select(U_Country, yearc, Comment, id) %>%   
      filter(U_Country == input$pais) %>%
      #### Just insert country
      arrange(id)
    
  }
  
  
  output$DT_tab <- DT::renderDT({by_countryDT()
    
  })
  
  by_countryDT <- function(){
    yearc <- as.name(paste0("Y", input$year))
    df4 %>%
      filter(U_Country == input$paisDT) %>%
      select(U_Country, yearc, Comment, id) %>%
      #### Just insert country
      arrange(id)
  }
  
  output$in_fo <-  renderText({paste("This was a  personal R learning project. 
                                   It is based on multiple idiosyncratically formatted .xlsx files published on Eurostat. It was challenging and I learned a lot. I live at waywithwords.se and my name is Angus")})
  
}













