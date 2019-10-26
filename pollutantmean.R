setwd("/Users/alexzanon/Documents/R Programming - Coursera/R Programming")
#diretorio que contem a pasta specdata dentro

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
#inicia a funcao com o pollutant sulfate pre informado e passando o id iniciando
#primeiro ao ultimo arquivo
  
  # faz um grep procurando o diretorio specdata, se encontrar seta ele como
  # diretorio que contem os arquivos utilizados na funcao
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  # inicia um vetor para guardar os pollutants
  mean_vector <- c()
  # pega todos os arquivos do diretorio
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  # percorre cada uns dos arquivos solicitados na chamada da funcao
  for(i in id) {
    # carrega os dados de determinado arquivo conforme o separador informado
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    head(current_file)
    pollutant
    # retira os nulos (NA)
    na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
    mean_vector <- c(mean_vector, na_removed)
  }
  result <- mean(mean_vector)
  # como resultado imprime o valor setando 3 casas decimais
  return(round(result, 3)) 
}