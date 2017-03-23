library(RCurl)
library(XML)

url <- "http://157.249.32.242/archive/"

#Funksjon som skraper en tilfeldig directory. 
#Returnerer liste som character 

get.dir <- function(x) {
  dir <- getURL(x)
  dir <- readHTMLTable(dir)
  dir <- as.data.frame(dir)
  liste <- as.character(dir[,2])
  liste <- na.omit(liste)
  liste <- liste[-1]
  return(liste)
  }

#Nedlastingsfunksjon. Gir navn etter plass i trestruktur.
download <- function(i){
  img <- ferdig.liste[i]
  navn <- unlist(strsplit(img, "/"))
  navn <- paste0(navn[6], "-", navn[7])
  navn <- paste0("files/",navn)
  download.file(img, navn, mode="wb")
}

#Sy sammen liste med neste nivå
get.liste <- function(i) {
  files <- get.dir(liste[i])
  liste2 <- paste0(liste[i],files)
  return(liste2)
} 

#Sett sammen nivå 1 og 2 av stiene
mappe1 <- get.dir(url)
antall <- length(mappe1)
url2s <- paste0(url, mappe1)

#Pluss på nivå 3
liste <- unlist(lapply(1:antall, function(x) {get.liste(x)}))
lengde <- length(liste)

#Pluss på filene
ferdig.liste <- unlist(lapply(1:lengde, function(x) {get.liste(x)}))
ant_filer <- length(ferdig.liste)

#Last ned
lapply(1:ant_filer, function(x) {download(x)})
