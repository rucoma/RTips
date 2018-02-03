##########################
# Created by: rucoma     #
# Date:       2017-11-30 #
##########################

library(ggplot2)
library(plotly)
library(rbokeh)
library(igraph)
library(dygraphs)

## Using data frame variables as arguments in custom function
testplot <- function(meansdf, xvar, yvar, fillvar) {
  ggplot(meansdf,
         aes_string(x = xvar, 
                    y= yvar, 
                    color = fillvar)) +
    geom_point(alpha = 0.2) +
    geom_smooth(method = 'loess',
                se = F) +
    facet_wrap(~ Species)
}

testplot(meansdf = iris, xvar = 'Sepal.Length', yvar = 'Petal.Length', fillvar = 'Species')

## A lot of options for customizing ggplot charts theme
tema <- theme(
  axis.title = element_text(family = 'IBM Plex Mono', colour = 'red', face = 'bold', size = 8),
  axis.text.x = element_text(family = 'IBM Plex Mono', colour = 'blue', angle = 90),
  axis.text.y = element_text(family = 'IBM Plex Mono', colour = 'blue'),
  axis.ticks = element_blank(),
  axis.line = element_line(colour = 'green', size = .5, linetype = 'longdash'),
  legend.background = element_rect(fill = 'red', colour = 'blue', linetype = 'solid', size = 1),
  legend.key = element_rect(fill = 'white', colour = 'brown'),
  legend.position = 'bottom',
  legend.text = element_text(family = 'Consolas', face = 'italic'),
  legend.title = element_text(size = 12, face = 'bold'),
  panel.background = element_rect(fill = 'ghostwhite'),
  panel.grid = element_line(colour = 'red', size = 0.5, linetype = 'longdash'),
  plot.background = element_rect(fill = 'white', colour = 'green'),
  plot.title = element_text(colour = 'red', size = 16),
  plot.subtitle = element_text(colour = 'pink', size = 12),
  plot.caption = element_text(colour = 'black', size = 8, face = 'italic'),
  panel.grid.minor.x = element_line(linetype = 'dotted', size = 0.25),
  panel.grid.minor.y = element_line(linetype = 'dotted', size = 0.25),
  strip.background = element_rect(fill = 'orange'),
  strip.text = element_text(family = 'Arial', face = 'bold', colour = 'red')
)

## Charting with bokeh
p <- figure() %>%
  ly_points(Sepal.Length, Sepal.Width, data = iris,
            color = Species, glyph = Species,
            hover = list(Sepal.Length, Sepal.Width))
p

# Charting with igraph
demo(package="igraph")
demo(package="igraph", topic = 'cohesive')

# Charting with dygraphs
lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths) %>% dyRangeSelector()
