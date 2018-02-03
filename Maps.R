##########################
# Created by: rucoma     #
# Date:       2010-02-03 #
##########################

## Library ggmap
library(ggmap)

house <- geocode(location = 'Madrid')

map <- get_map(location = as.numeric(house),
               color = 'color',
               maptype = 'roadmap',
               scale = 2,
               zoom = 16)

graph <- ggmap(map) + 
  geom_point(aes(x = lon, 
                 y = lat),
             data = house,
             col = 'red',
             size= 4)

## Library leaflet
library(leaflet)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map