<<<<<<< HEAD
##########################
# Created by: rucoma     #
# Date:       2017-11-30 #
##########################

library(tidyverse)
library(data.table)

## Get the last/first row from a grouped data frame / data.table
# Data.table approach
datos[order(idUnico, fecha)][, lapply(.SD,tail,1), by = idUnico]
#tidyverse approach (using a function to reuse)
=======
##########################
# Created by: rucoma     #
# Date:       2017-11-30 #
##########################

library(tidyverse)
library(data.table)

## Get the last/first row from a grouped data frame / data.table

# Data.table approach
datos[order(idUnico, fecha)][, lapply(.SD,tail,1), by = idUnico]

#tidyverse approach (using a function to reuse)
lastRowGroup <- function(df, fieldId, fieldDate) {
  library(tidyverse)
  df <- df %>%
    group_by_(fieldId) %>%
    arrange_(fieldId, fieldDate) %>%
    do(tail(., 1))
  return(df)
}

>>>>>>> bebc8fca585fa1935cef656e03d8cde3108fb079
