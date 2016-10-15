############ server.R #############
##All options and processing that are cheap and can be done each time app launches goes here, otherwise put in global.R
library(shiny)
library(rsconnect)
library(highcharter)
library(devtools)
library(googlesheets)
library(rgdal)
library(leaflet)
library(htmltools)

# Set thousands seperator in highcharts graph
#hcoptslang <- getOption("highcharter.lang")
#hcoptslang$thousandsSep <- ","
#options(highcharter.lang = hcoptslang)

######## START Shiny Server ###################
shinyServer(function(input, output, session) {
    
    ##########################
    # DEBUG OUTPUTS; Remove before deployment
    #Radio button to decide input
    output$debug <- renderPrint({
        paste(input$meow)
    })
    
    ########### Leed Map ################
    output$mainMap <- renderLeaflet({
        leaflet() %>%
            addProviderTiles("Esri.WorldTopoMap",
                options = providerTileOptions(noWrap = TRUE)
            )
            # addMarkers(data=leedBuildings,
            #     ~Lon, ~Lat,
            #     popup = ~paste0("<h3>", Building, " : ", LeedCert, "</h3>",
            #         "<p> Info </p>",
            #         '<a target="_blank" href="http://www.usgbc.org/leed"><p>Leed Certification Info</a>',
            #         " - ", '<a target="_blank" href="', ProjectLink, '">Project Info</p></a>')
            # )
    })
    
    
    #End of App
})
