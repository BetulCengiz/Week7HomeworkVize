#' Veritabanı bağlantısını kurar ve bağlantı nesnesini döndürür
#'
#' @param dbPath Veritabanı dosyasının yolunu belirtir.
#' @return Veritabanı bağlantısı nesnesi.
#' @export
connect_to_database <- function(dbPath) {
  library(RSQLite)
  con <- dbConnect(RSQLite::SQLite(), dbname = dbPath)
  con
}
