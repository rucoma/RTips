##########################
# Created by: rucoma     #
# Date:       2017-11-30 #
##########################

library(tidyverse)
library(data.table)
# Always run this before library(xlsx)
options( java.parameters = "-Xmx4g" ) #4g indicates amount of RAM dedicated
library(xlsx)

## Get the last/first row from a grouped data frame / data.table -

# Data.table approach
datos[order(idUnico, fecha)][, lapply(.SD, tail, 1), by = idUnico]

# Another way using data.table
dtClean <- dt[, tail(.SD, 1), by = c('var1', 'var2', 'var3')]

# tidyverse approach (using a function to reuse)
lastRowGroup <- function(df, fieldId, fieldDate) {
  library(tidyverse)
  df <- df %>%
    group_by_(fieldId) %>%
    arrange_(fieldId, fieldDate) %>%
    do(tail(., 1))
  return(df)
}

## Substitute to ifelse() -> dplyr::case_when() -----------------
case_when((str_sub(string = Telefono, start = 1, end = 2) != '34') | (nchar(Telefono) < 9) ~ paste0('34', Telefono), 
          TRUE ~Telefono)

## Creating labelled intervals ----------------------------------
cut(df$var,
    breaks = c(-Inf, 50000, 500000, 1000000, Inf),
    labels = c("<50MWh", "Entre 50MWh y 500MWh", "Entre 500MWh y 1GWh", "Mas 1GWh"))

## Get tne name of a variable as string -------------------------
name <- deparse(substitute(p48Final))

## Change the name of the variable based in some criteria -------
assign(name, df)

## Load some files to the environment ---------------------------
lapply(objects, load, .GlobalEnv)

## Sum columns according some criteria --------------------------
colSum <- c("col1", "col2", "col3")
df$varSum <- rowSums(df[, colSum, with = F], na.rm = T)

## Modify multiple columns at once elegantly using data.table ---
colFecha <- colnames(TP)[grep(pattern = 'fecha', x = colnames(TP))]
TP <- 
  TP[, (colFecha) := lapply(.SD, as.Date, format = '%Y-%m-%d'), .SDcols = colFecha]

## Join tables with dplyr using multiple columns ----------------
z <- left_join(a, b, by = c('col1x' = 'col1y', 'col2x' = 'col2y'))

## Compute the mode ---------------------------------------------
library(modeest)
mlv(df, method = "mfv")
