
# Load libraries ----------------------------------------------------------
require(pacman)
pacman::p_load(terra, sf, curl, fs, tidyverse, rgeos, stringr)

g <- gc(reset = T); rm(list = ls()); options(scipen = 999, warn = -1)

# Load data ---------------------------------------------------------------
base <- 'https://nex-gddp-cmip6.s3-us-west-2.amazonaws.com/NEX-GDDP-CMIP6'
mdls <- c('ACCESS-CM2', 'ACCESS-ESM1-5', 'BCC-CSM2-MR', 'CanESM5', 'CESM2-WACCM', 'CESM2', 'CMCC-CM2-SR5', 'CMCC-ESM2', 'CNRM-CM6-1', 'EC-Earth3-Veg-LR', 'EC-Earth3',
          'FGOALS-g3', 'GFDL-ESM4', 'GISS-E2-1-G', 'HadGEM3-GC31-LL', 'HadGEM3-GC31-MM', 'IITM-ESM', 'INM-CM4-8', 'INM-CM5-0', 'IPSL-CM6A-LR', 'KACE-1-0-G', 'KIOST-ESM',
          'MIROC-ES2L', 'MIROC6', 'MPI-ESM1-2-HR', 'MPI-ESM1-2-LR', 'MRI-ESM2-0', 'NESM3', 'NorESM2-LM', 'TaiESM1', 'UKESM1-0-LL')

prds <- c('historical', 'ssp370', 'ssp585')
vars <- c('pr', 'tasmax', 'tas', 'tasmin')

# Function to download ----------------------------------------------------

# Historical function
to_download <- function(mdl, prd, var){
  
  # mdl <- mdls[25]
  # prd <- prds[1]
  # var <- vars[1]
  
  cat('... Processing: ', prd, ' - ', mdl, '\n')
  urli <- paste0(base, '/', mdl, '/', prd, '/', 'r1i1p1f1', '/', var, '/', var, '_day_', mdl, '_', prd, '_', 'r1i1p1f1', '_gn_', 1980:2014, '.nc')
  dest <- paste0('nasa_download/v1/', prd, '/', basename(urli))
  
  for(i in 1:length(urli)){
    
    cat(i, '\t')
    webi <- urli[i]
    dout <- dest[i]
    dire <- dirname(dout)
    dir_create(dire)
    curl_download(url = webi, destfile = dout)
    cat('Done!\n')
    
  }
  
}

# To apply the function ---------------------------------------------------
map(1:length(vars), function(j){
  cat('Processing: ', vars[j], '\n')
  to_download(mdl = mdls[7], prd = prds[1], var = vars[j])
  cat('Done!\n')
})






