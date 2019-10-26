setwd("/Users/alexzanon/Documents/R Programming - Coursera/R Programming")
#diretorio que contem a pasta specdata dentro

corr <- function(directory, threshold = 0) {
  #inicia a funcao com o pollutant sulfate pre informado e passando o id iniciando
  #primeiro ao ultimo arquivo
  
  # faz um grep procurando o diretorio specdata, se encontrar seta ele como
  # diretorio que contem os arquivos utilizados na funcao
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  # carrega tados dados na tabela
  complete_table <- complete("specdata", 1:332)
  nobs <- complete_table$nobs
  # procura todos os IDs validos
  ids <- complete_table$id[nobs > threshold]
  # pega o tamanho do vetor
  id_len <- length(ids)
  corr_vector <- rep(0, id_len)
  # pega todos os arquivos do diretorio
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  # percorre cada uns dos arquivos solicitados na chamada da funcao
  j <- 1
  for(i in ids) {
    # carrega os dados de determinado arquivo conforme o separador informado
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  result <- corr_vector
  return(result)   
}