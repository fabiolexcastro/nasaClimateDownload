

## Historical Tmin
for(i in 1980:2010){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MPI-ESM1-2-LR/historical/r1i1p1f1/tasmin/tasmin_day_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/MPI-ESM1-2-LR/historical/tasmin_day_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_",i,".nc")
  download.file(url = url, destfile = destfile)
}

## Future Tmin
for(i in 2030:2060){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MPI-ESM1-2-LR/ssp585/r1i1p1f1/tasmin/tasmin_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/MPI-ESM1-2-LR/2030_2060/tasmin_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  download.file(url = url, destfile = destfile)
}

## Historical Tmax
for(i in 1980:2010){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MPI-ESM1-2-LR/historical/r1i1p1f1/tasmax/tasmax_day_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/MPI-ESM1-2-LR/historical/Tmax/tasmax_day_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_",i,".nc")
  download.file(url = url, destfile = destfile)
}

## Future Tmax
for(i in 2030:2060){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MPI-ESM1-2-LR/ssp585/r1i1p1f1/tasmax/tasmax_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/MPI-ESM1-2-LR/2030_2060/Tmax/tasmax_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  download.file(url = url, destfile = destfile)
}

## Historical Precipitation
for(i in 1980:2010){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MPI-ESM1-2-LR/historical/r1i1p1f1/pr/pr_day_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_",i,".nc")
  # destfile <- paste0("E:/Climate/Nasa/MPI-ESM1-2-LR/historical/Prec/pr_day_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_",i,".nc")
  destfile <- paste0('../data/nasa/MPI-ESM1-2-LR/historical/pr_day_MPI-ESM1-2-LR_historical_r1i1p1f1_gn_',i,".nc")
  download.file(url = url, destfile = destfile)
}

## Future Precipitation
for(i in 2030:2060){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MPI-ESM1-2-LR/ssp585/r1i1p1f1/pr/pr_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/MPI-ESM1-2-LR/2030_2060/Prec/pr_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  download.file(url = url, destfile = destfile)
}


for(i in 2030:2060){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MPI-ESM1-2-LR/ssp585/r1i1p1f1/rsds/rsds_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/MPI-ESM1-2-LR/2030_2060/Srad/rsds_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  download.file(url = url, destfile = destfile)
}

for(i in 2030:2060){
  url <- paste0("https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/MPI-ESM1-2-LR/ssp585/r1i1p1f1/hurs/hurs_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  destfile <- paste0("E:/Climate/Nasa/MPI-ESM1-2-LR/2030_2060/Hum/hurs_day_MPI-ESM1-2-LR_ssp585_r1i1p1f1_gn_",i,".nc")
  download.file(url = url, destfile = destfile)
}

