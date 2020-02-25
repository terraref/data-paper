#!/usr/bin/env Rscript
library(traits)
options(betydb_url = "https://terraref.ncsa.illinois.edu/bety/",
        betydb_api_version = 'v1',
        betydb_key = readLines('~/.betykey', warn = FALSE))

traits <-   c(#"leaf_angle_mean", "leaf_angle_chi", "panicle_surface_area", "panicle_volume", 
  # "aboveground_fresh_biomass", "surface_temperature", 
  "canopy_height", "leaf_angle_beta", "emergence_count", "leaf_angle_alpha", "leaf_length", "stalk_diameter_fixed_height", "aboveground_dry_biomass", "panicle_count", "aboveground_biomass_moisture", "canopy_cover", "leaf_width")
for(t in traits){
  print(paste0("downloading ", t))
  tt <- system.time(
    tmp <- betydb_query(sitename = '~Season 6', limit = 'none', trait = t)
    )
  print(paste0(t, ' has ', nrow(tmp), ' records ', ' and took ', round(tt[3]/60, 3), ' minutes to download'))
  readr::write_csv(x = tmp, path = file.path('data/season_6_traits/', 
                                             paste0('season_6_',t,'.csv')))
}
print("done")