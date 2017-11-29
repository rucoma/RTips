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