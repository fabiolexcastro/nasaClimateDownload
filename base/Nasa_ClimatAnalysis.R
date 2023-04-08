##########################################################
###    Analyze NASA climate data for crop modelling    ###


library(raster)
library(ncdf4)
library(ggplot2)

pt      <- read.table("D:/OneDrive - CGIAR/4_Data/Climate/NASA/StudyArea_Coord2.txt",sep = ";",header = TRUE)
pt$ID   <- 1:length(pt[,1])
clim    <- read.table("E:/23_PhD/3_Data/Climate/NASA_FutureProjections/ClimateGridFiles/ID_1107.txt", sep = ";", header = TRUE)

clim$Date   <- as.Date(clim$Date)
ggplot(clim, aes(x=clim$Date, y=clim$Tmax)) + geom_line()

dates   <- as.Date(clim$Date)
indices <- format(dates,format="%m")
indices <- as.numeric(indices)
clim$month <- indices

clim.month    <- aggregate(clim[clim$Year==2010,7], by=list(clim[clim$Year==2010,]$month),FUN=sum)
names(clim.month) <- c("Month","Prec")
plot(clim.month$Month,clim.month$Prec,type="l")



pt.rp <- pt
for(i in 1:length(pt.rp[,1])){
  if(pt.rp[i,]$Long > 180){
    pt.rp[i,]$Long <- pt.rp[i,]$Long - 360 
  } else {
    pt.rp[i,]$Long <- pt.rp[i,]$Long
  }
}

library(rgdal)
gha <- readOGR("D:/OneDrive - CGIAR/4_Data/Admin/Ghana","gadm36_GHA_0")
civ <- readOGR("D:/OneDrive - CGIAR/4_Data/Admin/Cote_d_Ivoire","gadm36_CIV_0")
nga <- readOGR("D:/OneDrive - CGIAR/4_Data/Admin/Nigeria","gadm36_NGA_0")
cmr <- readOGR("D:/OneDrive - CGIAR/4_Data/Admin/Cameroon","gadm36_CMR_0")

wa <- bind(gha,civ,nga,cmr)

plot(wa)
points(pt.rp$Long,pt.rp$Lat)
points(pt.rp[pt.rp$ID==672,]$Long,clim[pt.rp$ID==672,]$Lat,col="blue")

head(pt.rp[pt.rp$Lat<6.5 & pt.rp$Lat>6 & pt.rp$Long> -2 & pt.rp$Long< -1.8,])
