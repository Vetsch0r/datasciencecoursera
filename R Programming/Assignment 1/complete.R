complete <- function(directory, id = 1:332) {
  load_data <- function() { 
    files <- dir(directory, pattern = '\\.csv', full.names = TRUE)
    tables <- lapply(files, read.csv)
    do.call(rbind, tables)
  }
  data <- load_data()
  getRow <- function(id){
    sub <- subset(data,data$ID==id)
    list <- c(id, nrow(sub[complete.cases(sub),]))
  }
  matrix <- as.data.frame(do.call(rbind, lapply(id, getRow)))
  colnames(matrix) <- c("id", "nobs")
  matrix
}

