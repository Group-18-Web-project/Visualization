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

Chicago_map<- readOGR(here::here("data", 
                                 "Boundaries Wards",
                                 "geo_export_6f1ca57a-6a70-4094-b008-70eace180952.shp"))

Chicago_map1 <- fortify(Chicago_map) 
x <- Chicago_map@data 
xs <- data.frame(x,id=seq(0:49)-1) 
Chicago_map_data <- join(Chicago_map1, xs, type = "full")

ward<-read.csv("data/Crime rate 2016/2016 population.csv")

Chicago_data <- join(Chicago_map_data, ward, type="full",by="ward")
#calculate the centroids of all Wards in London
Chicago_data$Value<- cut(Chicago_data$total.change,breaks=c(-4377,-2193,0,2970,10333),labels=c('-4,376~-2,193','-2,192~0','1~2,970','2,971~10,333'),order=TRUE)
rhg_cols1 <- c("#db2d24","#fabb85","#c3cfc5","#4377b3") 

## get the ward center coordinate
#ddply() function in plyr,group by ward
midpos <- function(AD1){mean(range(AD1,na.rm=TRUE))} 
centres <- ddply(Chicago_data,.(ward),colwise(midpos,.(long,lat)))
centres1<-centres

centres1$lat[centres1$ward==41]<-centres1$lat[centres1$ward==41]-0.005
centres1$lat[centres1$ward==38]<-centres1$lat[centres1$ward==38]-0.005
centres1$long[centres1$ward==39]<-centres1$long[centres1$ward==39]+0.01
centres1$long[centres1$ward==35]<-centres1$long[centres1$ward==35]+0.01
centres1$long[centres1$ward==36]<-centres1$long[centres1$ward==36]-0.02
centres1$lat[centres1$ward==36]<-centres1$lat[centres1$ward==36]+0.01
centres1$long[centres1$ward==30]<-centres1$long[centres1$ward==30]-0.025
centres1$lat[centres1$ward==30]<-centres1$lat[centres1$ward==30]-0.005
centres1$long[centres1$ward==32]<-centres1$long[centres1$ward==32]+0.01
centres1$long[centres1$ward==29]<-centres1$long[centres1$ward==29]+0.01
centres1$long[centres1$ward==2]<-centres1$long[centres1$ward==2]-0.01
centres1$lat[centres1$ward==2]<-centres1$lat[centres1$ward==2]+0.005
centres1$lat[centres1$ward==27]<-centres1$lat[centres1$ward==27]-0.005
centres1$lat[centres1$ward==28]<-centres1$lat[centres1$ward==28]+0.01
centres1$long[centres1$ward==28]<-centres1$long[centres1$ward==28]-0.01
centres1$lat[centres1$ward==22]<-centres1$lat[centres1$ward==22]+0.01
centres1$lat[centres1$ward==12]<-centres1$lat[centres1$ward==12]-0.01
centres1$long[centres1$ward==14]<-centres1$long[centres1$ward==14]+0.01
centres1$lat[centres1$ward==13]<-centres1$lat[centres1$ward==13]+0.01
centres1$long[centres1$ward==13]<-centres1$long[centres1$ward==13]-0.02
centres1$lat[centres1$ward==20]<-centres1$lat[centres1$ward==20]-0.01
centres1$long[centres1$ward==16]<-centres1$long[centres1$ward==16]+0.02
centres1$long[centres1$ward==15]<-centres1$long[centres1$ward==15]-0.01
centres1$lat[centres1$ward==15]<-centres1$lat[centres1$ward==15]+0.02
centres1$long[centres1$ward==6]<-centres1$long[centres1$ward==6]+0.01
centres1$lat[centres1$ward==6]<-centres1$lat[centres1$ward==6]+0.01
centres1$long[centres1$ward==19]<-centres1$long[centres1$ward==19]+0.02
centres1$lat[centres1$ward==19]<-centres1$lat[centres1$ward==19]-0.01
centres1$lat[centres1$ward==10]<-centres1$lat[centres1$ward==10]-0.01
centres1$long[centres1$ward==5]<-centres1$long[centres1$ward==5]+0.005

ggplot() +
  geom_polygon(data=Chicago_data,aes(x=long,y=lat,group = group, fill = Value),colour="grey30",size=0.05) +
  geom_text(data=centres1,aes(x=long,y=lat,label=ward),size=2,col="black",fontface = "bold")+
  scale_fill_manual(values=rhg_cols1)+  
  guides(fill=guide_legend(title='Pop.Change 2010-16'))+
  coord_map("polyconic") +
  theme(                            
    panel.grid = element_blank(),
    panel.background = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank()
  )