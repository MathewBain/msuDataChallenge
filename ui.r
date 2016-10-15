library(shiny)
library(rsconnect)
library(highcharter)
library(stats)
library(leaflet)
library(shinythemes)

# Define UI for dataset viewer application
shinyUI(navbarPage(id="main", title="MSU Bike Data Challenge",
    fluid=T,
    position="static-top",
    selected="tabMap",
    inverse=T, #For dark top
    collapsible = T,
    theme=shinytheme("cerulean"),
    tags$head(
        tags$link(rel= "stylesheet", type="text/css", href = "styles.css")
    ),
    
    ########### Leed ################
    tabPanel(title = "Bike Map", value="tabMap", icon=icon("bicycle"),
        div(class="outer",
            leafletOutput("mainMap", width="100%", height="100%"),
            absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                draggable = T, top =100, left = 20, right = "auto", bottom = "auto",
                width = 330, height = "auto",
                h2("MSU Bike Data Challenge")
            )
        )
    ),
    tabPanel("Data Explorer")
))
