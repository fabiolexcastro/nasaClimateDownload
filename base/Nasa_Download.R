
### Climate data: https://www.nccs.nasa.gov/services/data-collections/land-based-products/nex-gddp-cmip6

"https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/ACCESS-CM2/historical/r1i1p1f1/rsds/rsds_day_ACCESS-CM2_historical_r1i1p1f1_gn_1980.nc"

## Precipitation
for(i in 1980:2014){
  print(i)
  'https://nex-gddp-cmip6.s3-us-west-2.amazonaws.com/NEX-GDDP-CMIP6/MIROC-ES2L/historical/r1i1p1f2/pr/pr_day_MIROC-ES2L_historical_r1i1p1f2_gn_1980.nc'
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MIROC-ES2L/historical/r1i1p1f2/pr/pr_day_MIROC-ES2L_historical_r1i1p1f3_gn_",i,".nc")
  # destfile <- paste0("C:/Users/rahne/Desktop/NASA/HadGEM3-GC31-LL/Prec/pr_day_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_",i,".nc")
  destfile <- paste0("Z:/VIETNAM_RAHN/data/nasa/MIROC-ES2L/Prec/pr_day_MIROC-ES2L_historical_r1i1p1f2_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}


## Tmin
for(i in 1980:2014){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/HadGEM3-GC31-LL/historical/r1i1p1f3/tasmin/tasmin_day_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_",i,".nc")
  destfile <- paste0("C:/Users/rahne/Desktop/NASA/HadGEM3-GC31-LL/Tmin/tasmin_day_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}


## Tmax
for(i in 1980:2014){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/HadGEM3-GC31-LL/historical/r1i1p1f3/tasmax/tasmax_day_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_",i,".nc")
  destfile <- paste0("C:/Users/rahne/Desktop/NASA/HadGEM3-GC31-LL/Tmax/tasmax_day_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}

"https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/historical/r1i1p1f2/rsds/rsds_day_GISS-E2-1-G_historical_r1i1p1f2_gn_1980.nc"
## Srad - shortwave
for(i in 1980:2014){
  url <- paste0("https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/historical/r1i1p1f2/rsds/rsds_day_GISS-E2-1-G_historical_r1i1p1f2_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/GISS-E2-1-G/Srad/rsds_day_GISS-E2-1-G_historical_r1i1p1f2_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}

"https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/historical/r1i1p1f2/sfcWind/sfcWind_day_GISS-E2-1-G_historical_r1i1p1f2_gn_1980.nc"

## Wind
for(i in 2014:2014){
  url <- paste0("https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/historical/r1i1p1f2/sfcWind/sfcWind_day_GISS-E2-1-G_historical_r1i1p1f2_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/GISS-E2-1-G/Wind/sfcWind_day_GISS-E2-1-G_historical_r1i1p1f2_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}

"https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/historical/r1i1p1f2/hurs/hurs_day_GISS-E2-1-G_historical_r1i1p1f2_gn_1980.nc"

## Humidity
for(i in 2010:2014){
  url <- paste0("https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/historical/r1i1p1f2/hurs/hurs_day_GISS-E2-1-G_historical_r1i1p1f2_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/GISS-E2-1-G/Humidity/hurs_day_GISS-E2-1-G_historical_r1i1p1f2_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}



### Future 


## Precipitation SSP 585
for(i in 2030:2060){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/HadGEM3-GC31-LL/historical/r1i1p1f3/pr/pr_day_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_",i,".nc")
  destfile <- paste0("C:/Users/rahne/Desktop/NASA/HadGEM3-GC31-LL/Prec/ssp585/pr_day_HadGEM3-GC31-LL_ssp585_r1i1p1f3_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}



## Tmin SSP 585
for(i in 2030:2060){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/HadGEM3-GC31-LL/historical/r1i1p1f3/pr/pr_day_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_",i,".nc")
  destfile <- paste0("C:/Users/rahne/Desktop/NASA/HadGEM3-GC31-LL/Tmin/ssp585/tasmin_day_HadGEM3-GC31-LL_ssp585_r1i1p1f3_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}


## Tmax SSP 585
for(i in 2030:2060){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/HadGEM3-GC31-LL/historical/r1i1p1f3/pr/pr_day_HadGEM3-GC31-LL_historical_r1i1p1f3_gn_",i,".nc")
  destfile <- paste0("C:/Users/rahne/Desktop/NASA/HadGEM3-GC31-LL/Tmax/ssp585/tasmax_day_HadGEM3-GC31-LL_ssp585_r1i1p1f3_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}


"https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/ssp585/r1i1p1f2/rsds/rsds_day_GISS-E2-1-G_ssp585_r1i1p1f2_gn_2030.nc"
## Srad - shortwave SSP 585
for(i in 2053:2060){
  url <- paste0("https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/ssp585/r1i1p1f2/rsds/rsds_day_GISS-E2-1-G_ssp585_r1i1p1f2_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/GISS-E2-1-G/Srad/ssp585/rsds_day_GISS-E2-1-G_ssp585_r1i1p1f2_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}


"https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/ssp585/r1i1p1f2/sfcWind/sfcWind_day_GISS-E2-1-G_ssp585_r1i1p1f2_gn_2030.nc"
## Wind SSP 585
for(i in 2030:2060){
  url <- paste0("https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/ssp585/r1i1p1f2/sfcWind/sfcWind_day_GISS-E2-1-G_ssp585_r1i1p1f2_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/GISS-E2-1-G/Wind/ssp585/sfcWind_day_GISS-E2-1-G_ssp585_r1i1p1f2_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}


"https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/ACCESS-CM2/ssp585/r1i1p1f1/hurs/hurs_day_ACCESS-CM2_ssp585_r1i1p1f1_gn_2080.nc"
## Humidity ssp 585
for(i in 2042:2060){
  url <- paste0("https://portal.nccs.nasa.gov/datashare/nexgddp_cmip6/GISS-E2-1-G/ssp585/r1i1p1f2/hurs/hurs_day_GISS-E2-1-G_ssp585_r1i1p1f2_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/GISS-E2-1-G/Humidity/ssp585/hurs_day_GISS-E2-1-G_ssp585_r1i1p1f2_gn_",i,".nc")
  download.file(url,destfile,mode = "wb")
}



