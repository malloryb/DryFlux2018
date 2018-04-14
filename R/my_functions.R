Aggregate_monthly <- function(x) {


  out <- Aggregate_monthly(x)
}



lapply(daylist, function(x){
  t <- read.csv(x, skip=6)

  out <- function(t)
    write.csv(out, "path/to/output", sep="\t", quote=F, row.names=F, col.names=T)

})

#Functon from my previous code
Formatday <- function(x) {
  x$Date <- format(strptime(x$yday, format="%j"), format="%m-%d")
  x$Date <-paste(x$year, x$Date, sep = "_")
  print(str(x))
}
