library(tidyverse)
library(tmap)
library(geojsonio)
library(plotly)
library(rgdal)
library(broom)
library(mapview)
library(crosstalk)
library(sf)
library(sp)
library(spdep)
library(car)
library(fs)
library(janitor)
library(ggpubr)
library(dplyr)
library(forcats)
library(corrr)
library(maptools)
library(rgdal)
library(plyr)
library(tidyverse)

#2010
ward<-read.csv("data/Crime rate/crime_10.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2011
ward<-read.csv("data/Crime rate/crime_11.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2012
ward<-read.csv("data/Crime rate/crime_12.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2013
ward<-read.csv("data/Crime rate/crime_13.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2014
ward<-read.csv("data/Crime rate/crime_14.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2015
ward<-read.csv("data/Crime rate/crime_15.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2016
ward<-read.csv("data/Crime rate/crime_16.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2017
ward<-read.csv("data/Crime rate/crime_17.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2018
ward<-read.csv("data/Crime rate/crime_18.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2019
ward<-read.csv("data/Crime rate/crime_19.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")

#2020
ward<-read.csv("data/Crime rate/crime_20.csv")
ward_n<-data.frame(table(ward$Ward))
names(ward_n)<-c("ward","count")