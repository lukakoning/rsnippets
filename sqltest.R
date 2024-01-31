library(sqldf)
library(DBI)
library(dplyr)
library(dbplyr)
 
# real DB connect
if (FALSE) {
  
  con <- dbConnect(
    drv = RMariaDB::MariaDB(),
    dbname = "sakila",
    host = "relational.fit.cvut.cz",
    port = 3306,
    username = "guest",
    password = "" # Use askForPassword() (rstudioapi) / keyring
  )
  
  dbListTables(con)
  
  dbDisconnect(con)
  
}

# fake DB connect (in-memory)
if (TRUE) {
  
  # Establish connection with new in-memory database
  con <- dbConnect(drv = RSQLite::SQLite(), 
                   dbname = ":memory:")
  
  # Add table ('mtcars' example df) (alternative with dbplyr: copy_to(con, mtcars))
  dbWriteTable(conn = con, 
               name = "mtcars", 
               value = mtcars)
  
  # Send regular SQL query and retrieve result
  result_DB <- dbSendQuery(con, "SELECT mpg,cyl FROM mtcars WHERE cyl=6;") 
  fetch <- dbFetch(result_DB)
  dbClearResult(result_DB)
  
  # Use dbplyr to retrieve and manipulate table
  # mtcarsdb <- tbl(con, "mtcars") # show_query(mtcarsdb)
  tbl(con, "mtcars") %>% distinct()
  
  # Close connection
  dbDisconnect(con)
  
}

