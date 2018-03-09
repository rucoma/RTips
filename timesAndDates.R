##########################
# Created by: rucoma     #
# Date:       2017-11-30 #
##########################

library(lubridate)
library(zoo)

# Convert to date excel dates (numbers) ---------------------------------------
dt[, (colDate) := lapply(.SD, as.Date, origin = '1899-12-30'), .SDcols = colDate]
