##########################################################
###    Prepare NASA climate data for crop modelling    ###


library(raster)
library(terra)
library(ncdf4)


####################################################################################
###                   West Africa                                               ####
####################################################################################


### Create climate data files used for input to crop model
### Climate data: https://www.nccs.nasa.gov/services/data-collections/land-based-products/nex-gddp-cmip6

start_time <- Sys.time()
precList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/BCC-CSM2-MR/Prec",pattern = ".nc", full.names = TRUE)
tminList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/BCC-CSM2-MR/Tmin",pattern = ".nc", full.names = TRUE) 
tmaxList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/BCC-CSM2-MR/Tmax",pattern = ".nc", full.names = TRUE) 
sradList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/BCC-CSM2-MR/Srad",pattern = ".nc", full.names = TRUE) 
humList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/BCC-CSM2-MR/Humidity",pattern = ".nc", full.names = TRUE) 
windList   <- list.files(path = "C:/Users/rahne/Desktop/NASA/BCC-CSM2-MR/Wind",pattern = ".nc", full.names = TRUE) 
pt      <- read.table("C:/Users/rahne/Desktop/NASA/StudyArea_Coord2.txt",sep = ";",header = TRUE)

for(k in 1:length(precList)){
  
  prec    <- stack(precList[k])
  prec.m  <- terra::extract(prec,pt)
  dates   <- names(prec)
  dates   <- as.Date(dates, format = "X%Y.%m.%d")
  colnames(prec.m) <- NULL
  year    <- substr(dates[1],1,4)
  
  tmin    <- stack(tminList[k])
  tmin.m  <- terra::extract(tmin,pt)
  colnames(tmin.m) <- NULL
  
  tmax    <- stack(tmaxList[k])
  tmax.m  <- terra::extract(tmax,pt)
  colnames(tmax.m) <- NULL
  
  srad    <- stack(sradList[k])
  srad.m  <- terra::extract(srad,pt)
  colnames(srad.m) <- NULL
  
  hum    <- stack(humList[k])
  hum.m  <- terra::extract(hum,pt)
  colnames(hum.m) <- NULL
  
  wind    <- stack(windList[k])
  wind.m  <- terra::extract(wind,pt)
  colnames(wind.m) <- NULL
  
  
  ## Add other climate variables here...
  
  if(file.exists("C:/Users/rahne/Desktop/NASA/ClimateGridFiles/BCC-CSM2-MR/historical/ID_1.txt")){
    print(paste0(year,": append", "   ",Sys.time()))
    for(n in 1:length(prec.m[,1])){
      temp  <- data.frame(ID=n, Long=pt[n,1], Lat=pt[n,2],Year = year, Doy=1:length(prec.m[n,]), Date=dates, Prec=prec.m[n,]*86400, Tmin=tmin.m[n,]-273.15, Tmax=tmax.m[n,]-273.15,
                          srad=srad.m[n,], hum=hum.m[n,], wind=wind.m[n,])
      write.table(temp,paste0("C:/Users/rahne/Desktop/NASA/ClimateGridFiles/BCC-CSM2-MR/historical/","ID_",n,".txt"),append = TRUE, row.names = FALSE, col.names = FALSE, sep = ";")
    }
  } else {
    print(paste0(year,": new", "   ",Sys.time()))
    for(i in 1:length(prec.m[,1])){
      temp  <- data.frame(ID=i, Long=pt[i,1], Lat=pt[i,2], Year = year, Doy=1:length(prec.m[i,]), Date=dates, Prec=prec.m[i,]*86400, Tmin=tmin.m[i,]-273.15, Tmax=tmax.m[i,]-273.15,
                          srad=srad.m[i,], hum=hum.m[i,], wind=wind.m[i,])
      write.table(temp,paste0("C:/Users/rahne/Desktop/NASA/ClimateGridFiles/BCC-CSM2-MR/historical/","ID_",i,".txt"),row.names = FALSE, sep = ";")
    }
  }
}
end_time <- Sys.time()
end_time - start_time







####################################################################################
###                       Vietnam                                               ####
####################################################################################


### Create climate data files used for input to crop model
### Climate data: https://www.nccs.nasa.gov/services/data-collections/land-based-products/nex-gddp-cmip6

start_time <- Sys.time()
precList   <- list.files(path = "E:/Climate/Nasa/CNRM-CM6-1/Prec",pattern = ".nc", full.names = TRUE)
tminList   <- list.files(path = "E:/Climate/Nasa/CNRM-CM6-1/Tmin",pattern = ".nc", full.names = TRUE) 
tmaxList   <- list.files(path = "E:/Climate/Nasa/CNRM-CM6-1/Tmax",pattern = ".nc", full.names = TRUE) 
# sradList   <- list.files(path = "E:/Climate/Nasa/ACCESS-CM2/Srad",pattern = ".nc", full.names = TRUE) 
# humList   <- list.files(path = "E:/Climate/Nasa/ACCESS-CM2/Humidity",pattern = ".nc", full.names = TRUE) 
# windList   <- list.files(path = "E:/Climate/Nasa/ACCESS-CM2/Wind",pattern = ".nc", full.names = TRUE) 
pt      <- read.table("E:/Climate/Nasa/VN_StudyArea_Coord.txt",sep = ";",header = TRUE)

for(k in 1:length(precList)){
  
  prec    <- stack(precList[k])
  prec.m  <- terra::extract(prec,pt)
  dates   <- names(prec)
  dates   <- as.Date(dates, format = "X%Y.%m.%d")
  colnames(prec.m) <- NULL
  year    <- substr(dates[1],1,4)
  
  tmin    <- stack(tminList[k])
  tmin.m  <- terra::extract(tmin,pt)
  colnames(tmin.m) <- NULL
  
  tmax    <- stack(tmaxList[k])
  tmax.m  <- terra::extract(tmax,pt)
  colnames(tmax.m) <- NULL
  
  # srad    <- stack(sradList[k])
  # srad.m  <- terra::extract(srad,pt)
  # colnames(srad.m) <- NULL
  # 
  # hum    <- stack(humList[k])
  # hum.m  <- terra::extract(hum,pt)
  # colnames(hum.m) <- NULL
  # 
  # wind    <- stack(windList[k])
  # wind.m  <- terra::extract(wind,pt)
  # colnames(wind.m) <- NULL
  
  
  ## Add other climate variables here...
  
  if(file.exists("E:/Climate/Nasa/ClimateGridFiles/Vietnam/CNRM-CM6-1/historical/ID_1.txt")){
    print(paste0(year,": append", "   ",Sys.time()))
    for(n in 1:length(prec.m[,1])){
      # temp  <- data.frame(ID=n, Long=pt[n,1], Lat=pt[n,2],Year = year, Doy=1:length(prec.m[n,]), Date=dates, Prec=prec.m[n,]*86400, Tmin=tmin.m[n,]-273.15, Tmax=tmax.m[n,]-273.15,
      #                     srad=srad.m[n,], hum=hum.m[n,], wind=wind.m[n,])
      temp  <- data.frame(ID=n, Long=pt[n,1], Lat=pt[n,2],Year = year, Doy=1:length(prec.m[n,]), Date=dates, Prec=prec.m[n,]*86400, Tmin=tmin.m[n,]-273.15, Tmax=tmax.m[n,]-273.15)
      write.table(temp,paste0("E:/Climate/Nasa/ClimateGridFiles/Vietnam/CNRM-CM6-1/historical/","ID_",n,".txt"),append = TRUE, row.names = FALSE, col.names = FALSE, sep = ";")
    }
  } else {
    print(paste0(year,": new", "   ",Sys.time()))
    for(i in 1:length(prec.m[,1])){
      # temp  <- data.frame(ID=i, Long=pt[i,1], Lat=pt[i,2], Year = year, Doy=1:length(prec.m[i,]), Date=dates, Prec=prec.m[i,]*86400, Tmin=tmin.m[i,]-273.15, Tmax=tmax.m[i,]-273.15,
      #                     srad=srad.m[i,], hum=hum.m[i,], wind=wind.m[i,])
      temp  <- data.frame(ID=i, Long=pt[i,1], Lat=pt[i,2], Year = year, Doy=1:length(prec.m[i,]), Date=dates, Prec=prec.m[i,]*86400, Tmin=tmin.m[i,]-273.15, Tmax=tmax.m[i,]-273.15)
      write.table(temp,paste0("E:/Climate/Nasa/ClimateGridFiles/Vietnam/CNRM-CM6-1/historical/","ID_",i,".txt"),row.names = FALSE, sep = ";")
    }
  }
}
end_time <- Sys.time()
end_time - start_time


start_time <- Sys.time()
precList   <- list.files(path = "E:/Climate/Nasa/BCC-CSM2-MR/Prec",pattern = ".nc", full.names = TRUE)
tminList   <- list.files(path = "E:/Climate/Nasa/BCC-CSM2-MR/Tmin",pattern = ".nc", full.names = TRUE) 
tmaxList   <- list.files(path = "E:/Climate/Nasa/BCC-CSM2-MR/Tmax",pattern = ".nc", full.names = TRUE) 
# sradList   <- list.files(path = "E:/Climate/Nasa/ACCESS-CM2/Srad",pattern = ".nc", full.names = TRUE) 
# humList   <- list.files(path = "E:/Climate/Nasa/ACCESS-CM2/Humidity",pattern = ".nc", full.names = TRUE) 
# windList   <- list.files(path = "E:/Climate/Nasa/ACCESS-CM2/Wind",pattern = ".nc", full.names = TRUE) 
pt      <- read.table("E:/Climate/Nasa/VN_StudyArea_Coord.txt",sep = ";",header = TRUE)

for(k in 1:length(precList)){
  
  prec    <- stack(precList[k])
  prec.m  <- terra::extract(prec,pt)
  dates   <- names(prec)
  dates   <- as.Date(dates, format = "X%Y.%m.%d")
  colnames(prec.m) <- NULL
  year    <- substr(dates[1],1,4)
  
  tmin    <- stack(tminList[k])
  tmin.m  <- terra::extract(tmin,pt)
  colnames(tmin.m) <- NULL
  
  tmax    <- stack(tmaxList[k])
  tmax.m  <- terra::extract(tmax,pt)
  colnames(tmax.m) <- NULL
  
  # srad    <- stack(sradList[k])
  # srad.m  <- terra::extract(srad,pt)
  # colnames(srad.m) <- NULL
  # 
  # hum    <- stack(humList[k])
  # hum.m  <- terra::extract(hum,pt)
  # colnames(hum.m) <- NULL
  # 
  # wind    <- stack(windList[k])
  # wind.m  <- terra::extract(wind,pt)
  # colnames(wind.m) <- NULL
  
  
  ## Add other climate variables here...
  
  if(file.exists("E:/Climate/Nasa/ClimateGridFiles/Vietnam/BCC-CSM2-MR/historical/ID_1.txt")){
    print(paste0(year,": append", "   ",Sys.time()))
    for(n in 1:length(prec.m[,1])){
      # temp  <- data.frame(ID=n, Long=pt[n,1], Lat=pt[n,2],Year = year, Doy=1:length(prec.m[n,]), Date=dates, Prec=prec.m[n,]*86400, Tmin=tmin.m[n,]-273.15, Tmax=tmax.m[n,]-273.15,
      #                     srad=srad.m[n,], hum=hum.m[n,], wind=wind.m[n,])
      temp  <- data.frame(ID=n, Long=pt[n,1], Lat=pt[n,2],Year = year, Doy=1:length(prec.m[n,]), Date=dates, Prec=prec.m[n,]*86400, Tmin=tmin.m[n,]-273.15, Tmax=tmax.m[n,]-273.15)
      write.table(temp,paste0("E:/Climate/Nasa/ClimateGridFiles/Vietnam/BCC-CSM2-MR/historical/","ID_",n,".txt"),append = TRUE, row.names = FALSE, col.names = FALSE, sep = ";")
    }
  } else {
    print(paste0(year,": new", "   ",Sys.time()))
    for(i in 1:length(prec.m[,1])){
      # temp  <- data.frame(ID=i, Long=pt[i,1], Lat=pt[i,2], Year = year, Doy=1:length(prec.m[i,]), Date=dates, Prec=prec.m[i,]*86400, Tmin=tmin.m[i,]-273.15, Tmax=tmax.m[i,]-273.15,
      #                     srad=srad.m[i,], hum=hum.m[i,], wind=wind.m[i,])
      temp  <- data.frame(ID=i, Long=pt[i,1], Lat=pt[i,2], Year = year, Doy=1:length(prec.m[i,]), Date=dates, Prec=prec.m[i,]*86400, Tmin=tmin.m[i,]-273.15, Tmax=tmax.m[i,]-273.15)
      write.table(temp,paste0("E:/Climate/Nasa/ClimateGridFiles/Vietnam/BCC-CSM2-MR/historical/","ID_",i,".txt"),row.names = FALSE, sep = ";")
    }
  }
}
end_time <- Sys.time()
end_time - start_time
