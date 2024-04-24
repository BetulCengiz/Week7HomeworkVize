# Veritabanından veri çekme fonksiyonu
#' @param
#' @return Veritabanı bağlantısı nesnesi.
#' @export
get_youtube_data <- function() {
  library(RSQLite)
  library(dplyr)

  # Veritabanı bağlantısını kur
  con <- connect_to_database("Vize_Q2_190401029_Cengiz_Betul.sqlite")

  # Verileri veritabanından seç ve veri çerçevesine kaydet
  youtube <- dbReadTable(con, "youtube")

  # Veritabanı bağlantısını kapat
  dbDisconnect(con)

  # Veri çerçevesini döndür
  return(youtube)
}
