#'
#' @param data
#' @export
dataTypes <-function(data){

  data_types <- sapply(data, typeof)
  print(data_types)
}

#'
#'
#' @export
  filteredData <- function(data) {
  library(dplyr)
  library(haven)

  # "United States" değerlerine sahip satırları seç
  filtered_data <- data %>%
    filter(Country == "United States")

  # Filtrelenmiş veriyi yeni bir R veri tablosuna yaz
  write_csv(filtered_data, "filtered_data.csv")

  # Filtrelenmiş veriyi geri döndür
  return(filtered_data)
}

  #' @param data
  #' @export
  replace_na_with_zero <- function(data) {
    data[is.na(data)] <- 0
    return(data)
  }


