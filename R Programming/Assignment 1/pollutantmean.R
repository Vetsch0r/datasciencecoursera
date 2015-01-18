pollutantmean <- function(directory, pollutant, id = 1:332) {
  load_data <- function() { 
    files <- dir(directory, pattern = '\\.csv', full.names = TRUE)
    tables <- lapply(files, read.csv)
    do.call(rbind, tables)
  }
  data <- load_data()
  rev_data <- subset(data, data$ID%in%id)
  colMeans(rev_data[pollutant],na.rm = TRUE)
}
