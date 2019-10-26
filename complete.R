setwd("/Users/alexzanon/Documents/R Programming - Coursera/R Programming")
#diretorio que contem a pasta specdata dentro

complete <- function(directory, id = 1:332) {
  #inicia a funcao com o pollutant sulfate pre informado e passando o id iniciando
  #primeiro ao ultimo arquivo
 
  # faz um grep procurando o diretorio specdata, se encontrar seta ele como
  # diretorio que contem os arquivos utilizados na funcao
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  # pega o tamanho do vetor
  id_len <- length(id)
  complete_data <- rep(0, id_len)
  # pega todos os arquivos do diretorio
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  # percorre cada uns dos arquivos solicitados na chamada da funcao
  j <- 1 
  for (i in id) {
    # carrega os dados de determinado arquivo conforme o separador informado
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    complete_data[j] <- sum(complete.cases(current_file))
    j <- j + 1
  }
  result <- data.frame(id = id, nobs = complete_data)
  return(result)
} 
