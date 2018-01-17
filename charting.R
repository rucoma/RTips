##########################
# Created by: rucoma     #
# Date:       2017-11-30 #
##########################

library(ggplot2)
library(plotly)

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
