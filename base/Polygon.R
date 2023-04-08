library(sp)
library(raster)
library(terra)
library(ncdf4)
library(exactextractr)
library(sf)


pt <- read.table("C:/Users/rahne/Desktop/NASA/StudyArea_Coord2.txt", sep = ";", header = TRUE)

pt.rp <- pt
for(i in 1:length(pt.rp[,1])){
  if(pt.rp[i,]$Long > 180){
    pt.rp[i,]$Long <- pt.rp[i,]$Long - 360 
  } else {
    pt.rp[i,]$Long <- pt.rp[i,]$Long
  }
}

ch <- chull(pt.rp)
ch.pt <- pt.rp[ch,]

p   <- Polygon(ch.pt)
ps  <- Polygons(list(p),1)
sps <- SpatialPolygons(list(ps)) 
plot(sps)

sps_sf <- st_as_sf(sps)



precList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/CNRM-ESM2-1/Prec",pattern = ".nc", full.names = TRUE)
tminList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/CNRM-ESM2-1/Tmin",pattern = ".nc", full.names = TRUE) 
tmaxList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/CNRM-ESM2-1/Tmax",pattern = ".nc", full.names = TRUE) 
sradList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/CNRM-ESM2-1/Srad",pattern = ".nc", full.names = TRUE) 
humList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/CNRM-ESM2-1/Humidity",pattern = ".nc", full.names = TRUE) 
windList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/CNRM-ESM2-1/Wind",pattern = ".nc", full.names = TRUE) 

start_time <- Sys.time()
prec    <- stack(precList[1])
prec.m  <- raster::extract(prec,pt)
end_time <- Sys.time()
end_time - start_time

start_time <- Sys.time()
prec    <- stack(precList[1])
prec.m  <- terra::extract(prec,pt)
end_time <- Sys.time()
end_time - start_time

start_time <- Sys.time()
prec    <- stack(precList[1])
prec.m  <- exact_extract(prec,sps_sf)
end_time <- Sys.time()
end_time - start_time

