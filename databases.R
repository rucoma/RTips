##########################
# Created by: rucoma     #
# Date:       2017-11-30 #
##########################

library(DBI)
library(RPostgreSQL)
library(RMySQL)

## DB Setup --------------------------------------------------------------------
con <- dbConnect(RMySQL::MySQL(),
                 user = 'user',
                 password = 'pass',
                 host = '10.0.220.186',
                 dbname='dbname'
)

# List tables ------------------------------------------------------------------
tables <- dbListTables(conn = con)

# Query ------------------------------------------------------------------------
query <- dbGetQuery(conn = con,
                statement = 'SELECT *
                             FROM table')
# Disconnect database ----------------------------------------------------------
dbDisconnect(con)

## Create table from CSV file --------------------------------------------------
dbWriteTable(con,
             name = "TABLE_NAME",
             value = "FILE.CSV",
             row.names = F,
             header = T,
             sep = c("|"),
             overwrite = T)
