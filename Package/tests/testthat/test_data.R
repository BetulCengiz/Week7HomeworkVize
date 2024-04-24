#Test1
library(testthat)

test_that("connect_to_database fonksiyonunun doğru çalıştığı doğrulandı", {
  # Test için geçici bir veritabanı dosyası oluştur
  temp_db <- tempfile()

  # Veritabanına bağlan
  con <- connect_to_database(temp_db)

  # Bağlantının doğru olup olmadığını kontrol et
  expect_true(inherits(con, "SQLiteConnection"))

  # Veritabanı bağlantısını kapat
  dbDisconnect(con)
})


#Test2

library(readr)

test_that("filteredData fonksiyonunun doğru çalıştığı doğrulandı", {
  # Test için örnek bir veri çerçevesi oluşturalım
  test_data <- data.frame(
    Country = c("United States", "United Kingdom", "Canada"),
    Value = c(10, 20, 30)
  )

  # Test için örnek bir dosya yolunu belirleyelim
  temp_file <- tempfile()

  # filteredData fonksiyonunu çağırarak işlemi gerçekleştirelim
  result <- filteredData(test_data)

  # Dosyanın oluşturulup oluşturulmadığını kontrol edelim
  expect_true(file.exists("filtered_data.csv"))

  # Dosyanın doğru bir şekilde oluşturulup oluşturulmadığını kontrol edelim
  expect_equal(read.csv("filtered_data.csv"), filter(test_data, Country == "United States"))

  # Dosyayı sildikten sonra işlevin döndürdüğü sonucu kontrol edelim
  unlink("filtered_data.csv")
  expect_equal(result, filter(test_data, Country == "United States"))
})



