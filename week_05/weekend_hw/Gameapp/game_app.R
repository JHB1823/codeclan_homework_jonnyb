library(CodeClanData)
library(tidyverse)
library(shiny)
source('~/codeclan_homework_jonnyb/week_05/weekend hw/global.R')

ui <- fluidPage(
    theme = shinythemes::shinytheme("superhero"),
    titlePanel("Game data"),
    sidebarLayout(
        sidebarPanel(
            radioButtons("platform",
                         "Which platform would you like",
                         choices = unique(publisher_selected$platform)
            ),
            selectInput("publisher",
                        "Which Publisher?",
                        choices = unique(publisher_selected$publisher)
            )
        ),
        mainPanel(
            plotOutput("publisher_plot"),
            
        )
    )
)
server <- function(input, output) {
    output$publisher_plot <- renderPlot({
        publisher_selected %>%
            filter(publisher == input$publisher) %>%
            filter(platform == input$platform) %>%
            ggplot()+
            aes(x = year_of_release, y = sales, fill = publisher)+
            geom_col()
    })
}
shinyApp(ui = ui, server = server)
