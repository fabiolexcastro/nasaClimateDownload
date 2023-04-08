
# Load libraries ----------------------------------------------------------
require(pacman)
pacman::p_load(geodata, terra, sf, curl, fs, tidyverse, rgeos, stringr, glue)

g <- gc(reset = T); rm(list = ls()); options(scipen = 999, warn = -1)

dir_create('temp')
terra::terraOptions(TMPDIR = 'temp')

# Load data ---------------------------------------------------------------
base <- 'https://ds.nccs.nasa.gov/thredds/fileServer/AMES/NEX/GDDP-CMIP6/'
mdls <- c('ACCESS-CM2', 'ACCESS-ESM1-5', 'BCC-CSM2-MR', 'CanESM5', 'CESM2-WACCM', 'CESM2', 'CMCC-CM2-SR5', 'CMCC-ESM2', 'CNRM-CM6-1', 'EC-Earth3-Veg-LR', 'EC-Earth3',
          'FGOALS-g3', 'GFDL-ESM4', 'GISS-E2-1-G', 'HadGEM3-GC31-LL', 'HadGEM3-GC31-MM', 'IITM-ESM', 'INM-CM4-8', 'INM-CM5-0', 'IPSL-CM6A-LR', 'KACE-1-0-G', 'KIOST-ESM',
          'MIROC-ES2L', 'MIROC6', 'MPI-ESM1-2-HR', 'MPI-ESM1-2-LR', 'MRI-ESM2-0', 'NESM3', 'NorESM2-LM', 'TaiESM1', 'UKESM1-0-LL')

ssps <- c('ssp370', 'ssp585')
vars <- c('pr', 'tasmax', 'tas', 'tasmin')
iso  <- 'VNM'
limt <- gadm(country = iso, level = 0, path = 'tmpr')

# Function to download ----------------------------------------------------
to_download <- function(mdl, var, ssp){
  
  mdl <- mdls[1]
  var <- vars[1]
  ssp <- ssps[2]
  
  cat('... Processing: ', mdl, ' - ', var, '\n')
  urli <- paste0(base, mdl, '/', ssp, '/r1i1p1f1/', var, '/', var, '_day_', mdl, '_', ssp, '_r1i1p1f1_gn_', 2021:2060, '.nc')
  dest <- paste0('nasa_download/future/', mdl, '/', ssp, '/', basename(urli))
  dire <- unique(dirname(dest))
  dir_create(dire)
  
  download.file(urli[1], dest[1]) #curl_download(url = urli[1], destfile = dest[1])
  
  rstr <- terra::rast(dout)
  rstr <- terra::rotate(rstr)
  rstr <- terra::crop(rstr, limt)
  terra::writeRaster(x = rstr, filename = glue(dirname(dout), '/', iso, '_', basename(dout)), overwrite = TRUE)
  file.remove(dout)
  cat('Done!\n')
  
}

# To download all  --------------------------------------------------------







