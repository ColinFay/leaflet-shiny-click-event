library(shiny)
library(leaflet)
nc = sf::st_read(system.file("shape/nc.shp", package="sf"))

ui <- function(request){
    tagList(
        tags$script(src = "ext/script.js"),
        selectInput("color", "color", c("blue", "red", "green")),
        leafletOutput("map")
    )
}

server <- function(
    input,
    output,
    session
){
    addResourcePath("ext", "ext")

    output$map <- renderLeaflet({
        session$sendCustomMessage("bindleaflet", "map")
        leaflet(nc) %>%
            addPolygons(color = input$color)
    })

}

shinyApp(ui, server)
