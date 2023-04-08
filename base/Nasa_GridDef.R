##########################################################
###    Prepare NASA climate data for crop modelling    ###

### Pre-processing steps

library(raster)
library(ncdf4)

####################################################################################
###                   West Africa                                               ####
####################################################################################

### Step 1: Select grid points for case study area - This only needs to be done once

prec <- stack("D:/OneDrive - CGIAR/4_Data/Climate/NASA/pr_day_IPSL-CM6A-LR_historical_r1i1p1f1_gr_2014.nc")
nc      <- nc_open("D:/OneDrive - CGIAR/4_Data/Climate/NASA/pr_day_IPSL-CM6A-LR_historical_r1i1p1f1_gr_2014.nc")
LonIdx <- c(which( nc$dim$lon$vals > 350) , which( nc$dim$lon$vals < 16.2) ) ## CIV to CMR
LatIdx <- which( nc$dim$lat$vals > 0 & nc$dim$lat$vals < 10)
lon <- nc$dim$lon$val[LonIdx]
lat <- nc$dim$lat$val[LatIdx]
pt <- cbind( rep(lon,length(lat)), rep(lat, each=length(lon)))

prec.m <- raster::extract(prec,pt)

pt <- as.data.frame(pt)
prec.m <- as.data.frame(prec.m)
pt <- cbind(pt,prec.m)
pt <- na.omit(pt)
pt <- pt[,1:2]
colnames(pt) <- c("Long","Lat")
#write.table(pt,"D:/OneDrive - CGIAR/4_Data/Climate/NASA/StudyArea_Coord2.txt", sep = ";",row.names = FALSE)


### Step 2: Plot Grid to ensure good coverage

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
points(clim$Long,clim$Lat,col="blue")





####################################################################################
###                        Vietnam                                               ####
####################################################################################

### Step 1: Select grid points for case study area - This only needs to be done once

prec <- stack("E:/Climate/Nasa/ACCESS-CM2/Prec/pr_day_ACCESS-CM2_historical_r1i1p1f2_gn_1980.nc")
nc      <- nc_open("E:/Climate/Nasa/ACCESS-CM2/Prec/pr_day_ACCESS-CM2_historical_r1i1p1f2_gn_1980.nc")
#LonIdx <- c(which( nc$dim$lon$vals > 106) , which( nc$dim$lon$vals < 109) )
LonIdx <- which( nc$dim$lon$vals > 106 & nc$dim$lon$vals < 110)
LatIdx <- which( nc$dim$lat$vals > 10 & nc$dim$lat$vals < 16)
lon <- nc$dim$lon$val[LonIdx]
lat <- nc$dim$lat$val[LatIdx]
pt <- cbind( rep(lon,length(lat)), rep(lat, each=length(lon)))

prec.m <- raster::extract(prec,pt)

pt <- as.data.frame(pt)
prec.m <- as.data.frame(prec.m)
pt <- cbind(pt,prec.m)
pt <- na.omit(pt)
pt <- pt[,1:2]
colnames(pt) <- c("Long","Lat")
#write.table(pt,"E:/Climate/Nasa/VN_StudyArea_Coord.txt", sep = ";",row.names = FALSE)


### Step 2: Plot Grid to ensure good coverage

pt.rp <- pt
for(i in 1:length(pt.rp[,1])){
  if(pt.rp[i,]$Long > 180){
    pt.rp[i,]$Long <- pt.rp[i,]$Long - 360 
  } else {
    pt.rp[i,]$Long <- pt.rp[i,]$Long
  }
}

library(rgdal)
vn <- readOGR("D:/OneDrive - CGIAR/4_Data/Admin/Vietnam","gadm36_VNM_0")

plot(vn)
points(pt.rp$Long,pt.rp$Lat)
points(clim$Long,clim$Lat,col="blue")
